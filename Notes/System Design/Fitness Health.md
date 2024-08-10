# Sytem Design

## General Questions

- How many users per day/per month/total?
- Where are users located?
  - CDN considerations
  - GDPR/CCPA or other privacy concerns
    - Do we need to handle sensitive data?
- What OS versions are we supporting?
  - I would do the latest 3 for iOS as that generally encompasses (95%)
  - Android 7 onward
  - Speeds up development time
- Cross platform support?
- Offline support?
  - What features are supported
- Push notification support?
  - If so what scenario?
- Localization?
- Deep Linking?
- Authentication?
- Accessibility?
- Analytics?
  - Remote Config
- Payment processing
- What is the team size? How many resources do we have?
  - More resources allows for modularization
- Network Types (Wifi or Cellular or Both)?

### Functional Requirements

- What activities can users track, and is there support for wearable devices with mobile integration?
- How can users set and track fitness goals, and how is progress visualized on mobile?
- Are there any social features in scope?
- Are there pre-defined workout plans, and can users edit these or create their own?
- What health metrics are monitored?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Fitness/Health App

#### REST + HTTP

- **Use Case**: REST is ideal for handling standard CRUD operations on resources such as user profiles, workout plans, and health data records.

- **Endpoints**:
  - `GET /api/users/{id}` - Retrieve user profile information.
  - `PUT /api/users/{id}` - Update user profile details.
  - `GET /api/workouts` - Retrieve a list of available workout plans.
  - `POST /api/workouts` - Create a new custom workout plan.
  - `GET /api/health/metrics` - Fetch user's health metrics (e.g., steps, calories burned).

#### GraphQL + HTTP

- **Use Case**: GraphQL allows clients to request specific data tailored to their needs, reducing over-fetching and under-fetching. It supports complex queries for personalized workout recommendations and user-specific metrics.

- **Query Example**:

  ```graphql
  {
    user(id: "123") {
      name
      age
      goals {
        title
        target
      }
      workouts {
        date
        duration
        caloriesBurned
      }
      healthMetrics {
        steps
        heartRate
        sleepHours
      }
    }
  }
  ```

- **Scenario**: Use GraphQL to fetch a user's profile information, fitness goals, workout history, and health metrics in a single request, allowing for a customized and efficient data retrieval process.

#### WebSocket

- **Use Case**: WebSocket is suitable for real-time communication, such as live updates during workouts or real-time feedback on health metrics.

- **Scenario**: Use WebSocket to provide real-time updates on workout progress, such as notifying the user of completed sets or changes in heart rate during exercise.

- **Example**: Connect to `/ws/users/{userId}/workout-progress` to receive live updates on workout metrics like heart rate, calories burned, and elapsed time.

#### SSE (Server-Sent Events)

- **Use Case**: SSE is ideal for streaming server-to-client updates, such as sending live health data or push notifications about goal achievements.

- **Scenario**: Use SSE to continuously stream updates on the user's daily step count or send notifications when they achieve fitness goals.

- **Endpoint**: `/sse/health/updates` to stream live updates on health metrics like steps taken, heart rate, or calories burned.

#### gRPC

- **Use Case**: gRPC is useful for high-performance, low-latency communication, particularly for backend services managing large-scale health data processing or workout analytics.

- **Scenario**: Use gRPC for efficient communication between microservices handling real-time health data analysis and providing personalized workout recommendations.

- **Example Service**:

  ```protobuf
  service HealthAnalytics {
    rpc GetRealTimeMetrics(MetricsRequest) returns (MetricsResponse);
    rpc UpdateWorkoutPlan(WorkoutPlanRequest) returns (WorkoutPlanResponse);
  }
  ```

  - `GetRealTimeMetrics` can be used to fetch live health data, such as heart rate and step count, during workouts.
  - `UpdateWorkoutPlan` can adjust workout plans based on the latest health metrics or user preferences.

- **App-Side Storage:**
  - **Key-Value Storage**: Store user preferences such as workout settings in UserDefaults.
  - **Database/ORM**: Use Realm or Core Data to cache workout data, health metrics, and user goals.
  - **Secure Storage**: Securely store user credentials and sensitive health data in the Keychain.
  - **Cache**:
    - **LRU**: Cache recent workouts and health metrics.
    - **LFU**: Cache frequently accessed workout plans.

- **Backend Storage:**
  - **NoSQL**: For flexible storage of user data, workout records, and health metrics.
  - **SQL**: For structured health data and tracking user achievements.

- **Pagination**:
  - Cursor-based: Used for browsing historical workout data, health metrics, and progress logs.

- **Real-Time Data and Updates:**
  - **WebSocket**: For real-time feedback during workouts and health metric updates.
  - **SSE**: Stream alerts on workout milestones or health goal achievements.
  - **HTTP Polling**: Used for periodic updates on health data if real-time connections are not feasible.

## High Level Diagram

![Getting Started](iOSDesign.png)
