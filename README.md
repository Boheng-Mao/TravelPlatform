# Online Travel Agency Platform

## Project Overview

The codes expose Spring MVC controllers and services that power both customer-facing and admin-facing features:

- Customer login, profile management, scenic spot browsing, hotel reservations, travel route viewing, comments, and wishlists.
- Order management for scenic tickets (`Sorder`) and hotel bookings (`Horder`), including payment state transitions.
- Administrative dashboards to curate destinations, hotel inventory, announcements, and track booking statistics.
- A recommendation engine (`MyUserBasedRecommenderImpl`) that suggests scenic spots using similarity metrics derived from historical user ratings.

## Structure

```
system-scenic/
├── pom.xml
├── src/main/java/com/zpy
│   ├── config/        # Spring configuration (e.g., MyBatis Plus, Redis configuration)
│   ├── controller/    # Spring MVC controllers handling user/admin workflows
│   ├── mapper/        # MyBatis Plus mapper interfaces
│   ├── pojo/          # Entity and DTO classes (Scenic, Hotel, SOrder, etc.)
│   ├── service/       # Service interfaces and implementations
│   └── utils/         # Helper utilities (e.g., recommendation support)
├── src/main/resources
│   ├── application.yml         # Environment configuration (datasource, Redis, file storage)
│   └── com/zpy/mapper/*.xml    # Custom MyBatis queries
└── system-scenic.sql           # Database schema and seed data
```

Key patterns:

- Controllers orchestrate requests, delegate to services, and (once the frontend is restored) map to view templates or JSON responses.
- Services encapsulate domain logic and integrate with MyBatis Plus repositories.
- Redis is leveraged for caching user sessions and recommendation data (configure credentials in `application.yml`).
- Static assets are no longer present; uploaded files (e.g., images) are saved in the storage path defined by the `location` property.

## Notable Endpoints

| Controller | Endpoint | Description |
| ---------- | -------- | ----------- |
| `MainMenuController` | `GET /main/mainMenu` | Aggregates booking counts by scenic category for the admin dashboard charts. |
| `UserController` | `POST /userlogin` | Authenticates customers, hydrates session data, and returns the personalised home experience (scenics, hotels, recommendations). |
| `UserController` | `POST /addOrder` | Creates a scenic ticket order, calculating totals from pricing and stay duration. |
| `UserController` | `POST /addHorder` | Books hotel rooms for a user, computing cost and stay length. |
| `SorderController` | `GET /sorder/listSorder` | Lists scenic orders for administrators with pagination and filtering. |
| `HotelController` | `POST /hotel/saveHotel` | Manages hotel inventory for the admin interface (image uploads handled via the `location` file path). |

Other controllers manage additional flows such as announcements (`NoticeController`), scenic CRUD (`ScenicController`), user profile updates, and wishlists. While many endpoints currently return view names, they can be adapted to JSON APIs for a headless use case.

## Getting Started

1. Import `system-scenic` as a Maven project (JDK 8+).
2. Create a MySQL database and execute `system-scenic.sql`.
3. Update datasource and file storage settings in `src/main/resources/application.yml`.
4. Run the application via `mvn spring-boot:run` or from `SystemScenicApplication`.

The frontend is under modification, so it's not included in this repository currently.
