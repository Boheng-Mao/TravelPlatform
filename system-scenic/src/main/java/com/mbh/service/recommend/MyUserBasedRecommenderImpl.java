package com.mbh.service.recommend;

import com.alibaba.fastjson.JSON;
import com.mysql.cj.jdbc.MysqlDataSource;
import lombok.extern.slf4j.Slf4j;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class MyUserBasedRecommenderImpl implements MyUserBasedRecommender1 {

	public List<RecommendedItem> userBasedRecommender(long userID,int size) {
		// steps: 1) build the model 2) compute similarity 3) find k-nearest neighbors 4) create the recommender
		List<RecommendedItem> recommendations = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			MysqlDataSource dataSource = new MysqlDataSource();
			dataSource.setServerName("localhost");//localhost for local testing
			dataSource.setPort(3306);
			dataSource.setUser("");
			dataSource.setPassword("");
			dataSource.setDatabaseName("system-scenic");//database name
			DataModel dataModel=new MySQLJDBCDataModel(dataSource,"score_scenic","user_id","scenic_id","score","time");

			//UserSimilarity similarity1=new UncenteredCosineSimilarity(model);
			UserSimilarity similarity = new PearsonCorrelationSimilarity(dataModel);   //use Pearson correlation to calculate user similarity
			UserNeighborhood neighborhood = new NearestNUserNeighborhood(2, similarity, dataModel);   //select the two closest users as neighbors
			Recommender recommender = new CachingRecommender(new GenericUserBasedRecommender(dataModel, neighborhood, similarity));   //cache recommendation items for faster reuse
			recommendations = recommender.recommend(userID, size);//retrieve recommendation results; size controls the count

			System.out.println("recommendations="+JSON.toJSONString(recommendations));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recommendations;
	}
}
