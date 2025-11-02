/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50557
Source Host           : localhost:3306
Source Database       : system-scenic

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2024-10-15 20:43:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Comment ID',
  `scenic_id` int(11) NOT NULL,
  `customer` varchar(255) DEFAULT NULL COMMENT 'Reviewer name',
  `cimage` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '3', 'Ethan Parker', '103846106577500.png', 'The illuminated promenade blends live performances with historic Parisian facades, making every evening stroll feel cinematic.', '2023-11-09 18:30:26', '2');
INSERT INTO `comment` VALUES ('37', '3', 'Ethan Parker', '103846106577500.png', 'I was impressed by how the light shows and food stalls capture the spirit of Paris; it is vibrant without feeling overwhelming.', null, '4');
INSERT INTO `comment` VALUES ('38', '3', 'Ethan Parker', '103846106577500.png', 'Even on a quiet weekday the riverside walk is packed with art installations that make you linger at every corner.', '2024-05-14 22:52:53', '1');
INSERT INTO `comment` VALUES ('39', '3', 'Ethan Parker', '103846106577500.png', 'The mix of restored Belle Epoque facades and modern lighting design creates a surreal atmosphere that keeps you exploring for hours.', '2024-05-14 22:53:49', '5');
INSERT INTO `comment` VALUES ('40', '5', 'Liam Carter', '851947490499700.png', 'A quick stop before catching the evening light show - still one of the most awe-inspiring ancient wonders I have visited.', '2024-06-13 16:04:34', null);
INSERT INTO `comment` VALUES ('41', '4', 'Ethan Parker', '26179307739300.png', 'The cable car views of the Matterhorn are breathtaking, especially at sunrise above the glaciers.', '2024-06-13 16:36:27', null);
INSERT INTO `comment` VALUES ('42', '4', 'Ethan Parker', '26179307739300.png', 'Steep via ferrata sections but totally worth it for the ridgeline panoramas.', '2024-06-13 16:43:04', null);
INSERT INTO `comment` VALUES ('43', '7', 'Ethan Parker', '26179307739300.png', 'Statue views over Rio are unbeatable and the evening breeze is perfect.', '2024-06-20 15:40:02', null);
INSERT INTO `comment` VALUES ('44', '4', 'Ethan Parker', '103846106577500.png', 'Every cliff face feels alive with Alpine history. The ascents are challenging yet the mountain lore keeps you moving.', '2024-07-25 18:19:26', '5');
INSERT INTO `comment` VALUES ('45', '8', 'Ethan Parker', '103846106577500.png', 'Snow-capped symmetry and the surrounding lakes create the postcard view I always imagined.', '2024-07-26 08:42:15', null);
INSERT INTO `comment` VALUES ('46', '7', 'Ethan Parker', '147434661115700.png', 'Watching the city wake up from Corcovado is magical - crowds are lighter just after dawn.', '2024-07-26 15:00:57', '4');
INSERT INTO `comment` VALUES ('48', '3', 'Ethan Parker', '332176745800.png', 'Street musicians were on point the entire night, great energy.', '2024-09-03 13:41:20', '5');
INSERT INTO `comment` VALUES ('49', '5', 'Ethan Parker', '332176745800.png', 'Guides share fascinating engineering stories about the Great Pyramid; highly recommend the sunrise session.', '2024-09-05 11:02:02', '5');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Customer ID',
  `customer_name` varchar(255) NOT NULL COMMENT 'Customer name',
  `password` varchar(255) NOT NULL DEFAULT '666' COMMENT 'Default credential marker',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `phone` varchar(255) DEFAULT NULL COMMENT 'Phone number',
  `address` varchar(255) DEFAULT NULL COMMENT 'Mailing address',
  `cimage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'Ethan Parker', '202cb962ac59075b964b07152d234b70', 'ethan.parker@example.com', '1234567899999', 'Seattle, WA, USA', '332176745800.png');
INSERT INTO `customer` VALUES ('4', 'Lily Bennett', '202cb962ac59075b964b07152d234b70', 'lily.bennett@example.com', '19591581167', 'Philadelphia, PA, USA', '289713480700.jfif');
INSERT INTO `customer` VALUES ('5', 'Martin Hughes', '202cb962ac59075b964b07152d234b70', 'martin.hughes@example.com', '19591581167111', 'Boston, MA, USA', '300430292800.png');
INSERT INTO `customer` VALUES ('13', 'Grace Moore', '202cb962ac59075b964b07152d234b70', '', '', '', '254371788015300.jfif');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hname` varchar(255) DEFAULT NULL COMMENT 'Hotel name',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `address` varchar(255) DEFAULT NULL COMMENT 'Street address',
  `sid` int(255) DEFAULT NULL COMMENT 'Linked scenic ID',
  `descr` varchar(255) DEFAULT NULL COMMENT 'Hotel description',
  `himage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('3', 'Seine View Grand Hotel', 'Paris', '1 Quai du Louvre, Paris', '3', 'Boutique suites overlooking the Seine with private gallery tours after hours.', '63714639725000.png');
INSERT INTO `hotel` VALUES ('4', 'Montmartre Lights Hotel', 'Paris', '18 Rue Lamarck, Paris', '3', 'Steps from Sacre-Coeur with evening rooftop concerts and tasting menus.', '64028574107600.png');
INSERT INTO `hotel` VALUES ('5', 'Alpine Summit Lodge', 'Zermatt', 'Riedweg 42, Zermatt', '4', 'Founded in 2005, the lodge pairs guided Matterhorn climbs with thermal spa recovery.', '823685924100.png');

-- ----------------------------
-- Table structure for h_order
-- ----------------------------
DROP TABLE IF EXISTS `h_order`;
CREATE TABLE `h_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Hotel order ID',
  `cid` int(11) DEFAULT NULL COMMENT 'Customer ID',
  `rid` int(11) DEFAULT NULL COMMENT 'Room ID',
  `start_time` datetime DEFAULT NULL COMMENT 'Check-in time',
  `end_time` datetime DEFAULT NULL COMMENT 'Check-out time',
  `total` double(255,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT 'Number of nights',
  `status` int(11) DEFAULT '0' COMMENT '0=unpaid,1=paid,2=cancelled,3=wishlist',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of h_order
-- ----------------------------
INSERT INTO `h_order` VALUES ('65', '1', '4', '2024-09-01 00:00:00', '2024-09-04 00:00:00', '369.00', '3', '2');
INSERT INTO `h_order` VALUES ('68', '1', '1', '2024-09-01 00:00:00', '2024-09-05 00:00:00', '1200.00', '4', '1');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nname` varchar(255) NOT NULL COMMENT 'Title',
  `content` varchar(255) NOT NULL COMMENT 'Content',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', 'Digital Travel Licenses Go Live Nationwide', 'The Ministry of Culture and Tourism announced the rollout schedule for digital permits across travel operators.');
INSERT INTO `notice` VALUES ('4', 'Cultural Heritage And Tourism Integration Push', 'Guidelines were released encouraging scenic partners to co-create events around intangible heritage assets.');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rname` varchar(255) DEFAULT NULL COMMENT 'Room name',
  `wifi` int(255) DEFAULT NULL COMMENT 'Wi-Fi included',
  `bed` int(255) DEFAULT NULL COMMENT 'Beds',
  `big` int(255) DEFAULT NULL COMMENT 'Room size (sqm)',
  `weiyu` int(255) DEFAULT NULL COMMENT 'Private bathroom',
  `tv` int(255) DEFAULT NULL COMMENT 'TV available',
  `hid` int(255) DEFAULT NULL COMMENT 'Hotel ID',
  `rimage` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', 'Harbor View King Room', '1', '2', '80', '0', '1', '3', 'Snipaste_2024-07-19_11-37-47.png', '300.00');
INSERT INTO `room` VALUES ('3', 'Premier Twin Loft', '1', '1', '68', '1', '0', '3', '68893930440000.png', '134.00');
INSERT INTO `room` VALUES ('4', 'Summit Single Suite', '1', '1', '68', '1', '0', '4', '183777016398000.png', '123.00');

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Route ID',
  `rname` varchar(255) NOT NULL COMMENT 'Route name',
  `rtime` varchar(255) NOT NULL COMMENT 'Opening hours',
  `day` int(255) DEFAULT NULL COMMENT 'Recommended day',
  `descr` varchar(255) DEFAULT NULL COMMENT 'Description',
  `rimage` varchar(255) DEFAULT NULL COMMENT 'Route image',
  `sid` int(11) DEFAULT NULL COMMENT 'Linked scenic ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES ('1', 'Seine Twilight Walk', '07:00-21:00', '1', 'A guided evening loop from the Louvre Pyramid to Pont Neuf with projection art and patisserie tastings.', 'Snipaste_2024-07-23_16-47-40.png', '3');
INSERT INTO `route` VALUES ('3', 'Left Bank Street Performers', '07:00-21:00', '2', 'Jazz ensembles and pop-up theatre along Rue de Rivoli invite visitors to join improvisation sessions.', '2011322554100.png', '3');
INSERT INTO `route` VALUES ('4', 'Montmartre Lantern Tour', '07:00-21:00', '3', 'Lantern-lit climbs through Montmartre with rooftop poetry readings overlooking Paris.', '2642106079700.png', '3');
INSERT INTO `route` VALUES ('5', 'Glacier Ridge Walk', '07:00-22:00', '1', 'Suspended walkways hug the rock face above Zermatt, revealing glacial valleys at sunrise.', '2811833870700.png', '4');
INSERT INTO `route` VALUES ('6', 'Eagle Pass Descent', '07:00-22:00', '2', 'Narrow ladders and cables descend to a hidden alpine chess hut with panoramic views.', '2962767467900.png', '4');
INSERT INTO `route` VALUES ('7', 'Zermatt Market Bites', '07:00-22:00', '3', 'Sample raclette, rosti, and artisan chocolates in the old town after a day on the slopes.', '3129083392800.png', '4');

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sname` varchar(255) DEFAULT NULL COMMENT 'Scenic name',
  `country` varchar(255) DEFAULT NULL COMMENT 'Country or region',
  `address` varchar(255) DEFAULT NULL COMMENT 'Location',
  `stime` varchar(255) DEFAULT NULL COMMENT 'Opening hours',
  `price` double(15,2) DEFAULT NULL COMMENT 'Ticket price',
  `type` varchar(255) DEFAULT NULL COMMENT 'Category',
  `simage` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL COMMENT 'Description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES ('3', 'Louvre Night Promenade', 'France', '1 Cour du Louvre, Paris', 'Mon-Thu 07:00-23:00', '32.00', 'Heritage Site', '11471675446900.png', 'An evening promenade linking the Louvre and the Seine with projection art, live music, and gourmet pop-ups.');
INSERT INTO `scenic` VALUES ('4', 'Matterhorn Sky Trail', 'Switzerland', 'Zermatt, Switzerland', 'Mon-Fri 07:00-23:00', '66.00', 'Natural Scenery', '55395721126600.png', 'A high-altitude network of ridge trails facing the Matterhorn, featuring via ferrata routes and glacier vistas.');
INSERT INTO `scenic` VALUES ('5', 'Great Pyramid of Giza', 'Egypt', 'Giza Plateau, Cairo', 'Mon-Fri 07:00-23:00', '123.00', 'Heritage Site', '55535218353500.png', 'Ancient engineering marvel offering guided tours into burial chambers and panoramic desert sunsets.');
INSERT INTO `scenic` VALUES ('6', 'Maldives Atolls', 'Maldives', 'Republic of Maldives', 'Mon-Fri 07:00-23:00', '321.00', 'Natural Scenery', '55917437006500.png', 'A chain of coral islands with turquoise lagoons, luxury resorts, and world-class diving reefs.');
INSERT INTO `scenic` VALUES ('7', 'Corcovado Mountain', 'Brazil', 'Rio de Janeiro', 'Mon-Fri 07:00-23:00', '321.00', 'Heritage Site', '56705738876900.png', 'Home to the Christ the Redeemer statue overlooking Guanabara Bay with 360-degree city views.');
INSERT INTO `scenic` VALUES ('8', 'Mount Fuji', 'Japan', 'Honshu, Japan', 'Mon-Fri 07:00-23:00', '123.00', 'Natural Scenery', '58153965832700.png', 'Japan s iconic cone-shaped volcano surrounded by alpine lakes and seasonal flower fields.');
INSERT INTO `scenic` VALUES ('9', 'New York City', 'United States', 'Hudson River Estuary', 'Open 24 hours', '0.00', 'Urban Experience', '58418480851600.png', 'The largest city in the United States, offering museums, Broadway, financial hubs, and diverse neighborhoods.');
INSERT INTO `scenic` VALUES ('10', 'Aurora Borealis', 'Norway', 'Tromso, Norway', 'Open 24 hours', '321.00', 'Celestial Phenomena', '58863722853000.png', 'Prime vantage point for viewing the northern lights above snow-clad fjords and Arctic forests.');
INSERT INTO `scenic` VALUES ('11', 'Hawaiian Islands', 'United States', 'State of Hawaii', 'Mon-Fri 07:00-23:00', '321.00', 'Natural Scenery', '59748584736900.png', 'A Pacific archipelago known for volcanic landscapes, surf culture, and year-round tropical weather.');

-- ----------------------------
-- Table structure for score_scenic
-- ----------------------------
DROP TABLE IF EXISTS `score_scenic`;
CREATE TABLE `score_scenic` (
  `user_id` int(11) DEFAULT NULL,
  `scenic_id` int(11) DEFAULT NULL,
  `score` int(255) DEFAULT NULL,
  `time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of score_scenic
-- ----------------------------
INSERT INTO `score_scenic` VALUES ('1', '3', '5', null);
INSERT INTO `score_scenic` VALUES ('1', '4', '3', null);
INSERT INTO `score_scenic` VALUES ('4', '3', '3', null);
INSERT INTO `score_scenic` VALUES ('4', '4', '5', null);
INSERT INTO `score_scenic` VALUES ('4', '5', '5', null);
INSERT INTO `score_scenic` VALUES ('4', '6', '5', null);
INSERT INTO `score_scenic` VALUES ('4', '7', '5', null);
INSERT INTO `score_scenic` VALUES ('4', '8', '4', null);
INSERT INTO `score_scenic` VALUES ('4', '9', '5', null);
INSERT INTO `score_scenic` VALUES ('4', '10', '5', null);
INSERT INTO `score_scenic` VALUES ('4', '11', '5', null);
INSERT INTO `score_scenic` VALUES ('5', '3', '5', null);
INSERT INTO `score_scenic` VALUES ('5', '4', '5', null);
INSERT INTO `score_scenic` VALUES ('5', '5', '4', null);
INSERT INTO `score_scenic` VALUES ('5', '6', '5', null);
INSERT INTO `score_scenic` VALUES ('5', '7', '2', null);
INSERT INTO `score_scenic` VALUES ('5', '8', '5', null);
INSERT INTO `score_scenic` VALUES ('5', '9', '3', null);
INSERT INTO `score_scenic` VALUES ('5', '10', '4', null);
INSERT INTO `score_scenic` VALUES ('5', '11', '3', null);
INSERT INTO `score_scenic` VALUES ('6', '3', '4', null);
INSERT INTO `score_scenic` VALUES ('6', '4', '4', null);
INSERT INTO `score_scenic` VALUES ('6', '5', '3', null);
INSERT INTO `score_scenic` VALUES ('6', '6', '3', null);
INSERT INTO `score_scenic` VALUES ('6', '7', '2', null);
INSERT INTO `score_scenic` VALUES ('6', '8', '4', null);
INSERT INTO `score_scenic` VALUES ('6', '9', '4', null);
INSERT INTO `score_scenic` VALUES ('6', '10', '2', null);
INSERT INTO `score_scenic` VALUES ('7', '3', '4', null);
INSERT INTO `score_scenic` VALUES ('7', '4', '5', null);
INSERT INTO `score_scenic` VALUES ('7', '5', '2', null);
INSERT INTO `score_scenic` VALUES ('7', '6', '5', null);
INSERT INTO `score_scenic` VALUES ('7', '7', '4', null);
INSERT INTO `score_scenic` VALUES ('7', '8', '5', null);
INSERT INTO `score_scenic` VALUES ('7', '9', '3', null);
INSERT INTO `score_scenic` VALUES ('7', '10', '4', null);
INSERT INTO `score_scenic` VALUES ('7', '11', '3', null);
INSERT INTO `score_scenic` VALUES ('8', '3', '4', null);
INSERT INTO `score_scenic` VALUES ('8', '4', '5', null);
INSERT INTO `score_scenic` VALUES ('8', '5', '4', '2024-05-14');
INSERT INTO `score_scenic` VALUES ('8', '6', '3', '2024-05-21');
INSERT INTO `score_scenic` VALUES ('8', '7', '2', '2024-06-13');
INSERT INTO `score_scenic` VALUES ('8', '8', '5', '2024-06-13');
INSERT INTO `score_scenic` VALUES ('8', '9', '5', '2024-06-13');
INSERT INTO `score_scenic` VALUES ('8', '10', '5', '2024-06-20');
INSERT INTO `score_scenic` VALUES ('1', '7', '1', '2024-07-26');
INSERT INTO `score_scenic` VALUES (null, '4', '2', '2024-09-02');
INSERT INTO `score_scenic` VALUES ('1', '3', '5', '2024-09-03');
INSERT INTO `score_scenic` VALUES ('1', '5', '5', '2024-09-05');

-- ----------------------------
-- Table structure for s_order
-- ----------------------------
DROP TABLE IF EXISTS `s_order`;
CREATE TABLE `s_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Scenic order ID',
  `cid` int(11) DEFAULT NULL COMMENT 'Customer ID',
  `sid` int(11) DEFAULT NULL COMMENT 'Scenic ID',
  `start_time` datetime DEFAULT NULL COMMENT 'Start time',
  `end_time` datetime DEFAULT NULL COMMENT 'End time',
  `total` double(255,2) DEFAULT NULL COMMENT 'Total price',
  `count` int(11) DEFAULT NULL COMMENT 'Tickets count',
  `status` int(11) DEFAULT '0' COMMENT '0=unpaid,1=paid,2=cancelled,3=wishlist',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  CONSTRAINT `s_order_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`id`),
  CONSTRAINT `s_order_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `scenic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_order
-- ----------------------------
INSERT INTO `s_order` VALUES ('1', '1', '3', '2024-07-22 17:31:01', '2024-07-27 17:31:04', '64.00', '2', '2');
INSERT INTO `s_order` VALUES ('58', '1', '3', null, null, null, null, '3');
INSERT INTO `s_order` VALUES ('59', '1', '4', null, null, null, null, '3');
INSERT INTO `s_order` VALUES ('60', '1', '8', null, null, null, null, '3');
INSERT INTO `s_order` VALUES ('91', '1', '5', '2024-09-01 00:00:00', '2024-09-05 00:00:00', '246.00', '2', '1');
INSERT INTO `s_order` VALUES ('93', '1', '7', null, null, null, null, '3');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(255) NOT NULL COMMENT 'Category name',
  `feature` varchar(255) NOT NULL COMMENT 'Category feature',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'Natural Scenery', 'Landscapes shaped by rivers, forests, deserts, coastlines, and mountains that highlight biodiversity and outdoor recreation.');
INSERT INTO `type` VALUES ('2', 'Heritage Site', 'Historic districts, monuments, and archaeological remains that reveal the craftsmanship and stories of past civilizations.');
INSERT INTO `type` VALUES ('4', 'Urban Experience', 'Iconic skylines, cultural neighborhoods, and immersive downtown attractions that showcase the soul of modern cities.');
INSERT INTO `type` VALUES ('8', 'Celestial Phenomena', 'Natural sky shows such as auroras, meteor showers, and astral events that reward visitors who chase rare atmospheric moments.');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) NOT NULL COMMENT 'Username',
  `password` varchar(255) NOT NULL COMMENT 'Password',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `phone` varchar(255) NOT NULL COMMENT 'Phone number',
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', '234760595678@qq.com', '312321321321', '80349826673600.jfif');
