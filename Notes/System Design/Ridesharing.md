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

- What ride options are available, and can users schedule rides in advance with mobile-friendly interfaces?
- What information is displayed about drivers and vehicles?
- Is real-time tracking of rides? Notifications for updates?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Ridesharing (e.g., Uber, Lyft)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/trips` - List trips.
    - `POST /api/trips` - Book a new trip.
    - `GET /api/trips/{id}` - Get trip details.

- **GraphQL + HTTP**:
  - **Use Case**: Allows querying for specific trip details, driver information, and route options. Supports complex queries for ride recommendations and user preferences.
  - **Query Example**:

    ```graphql
    {
      trip(id: "123") {
        driver {
          name
          rating
        }
        vehicle {
          make
          model
        }
        route {
          start
          end
        }
      }
    }
    ```

- **WebSocket**:
  - Use for real-time updates on driver locations and ride status.
  - Example: Connect to `/ws/trips/{tripId}` for live tracking.

- **gRPC**:
  - Use for low-latency communication and efficient data exchange.
  - Example service: `TrackDriver(DriverRequest) returns (DriverResponse)`

- **App-Side Storage:**
  - **Key-Value Storage**: Store user settings and preferences such as payment methods and favorite locations.
  - **Database/ORM**: Use SQLite for caching trip history and driver profiles.
  - **Secure Storage**: Store payment information securely in the Keychain.
  - **Cache**:
    - **LRU**: Cache recent trips for easy review.
    - **LFU**: Cache frequently used locations.

- **Backend Storage:**
  - **NoSQL**: For flexible storage of ride data, user preferences, and geospatial queries.
- **SQL**: For transactional data such as payments and billing records.

- **Pagination:**
  - **Not typically used**: Data is generally based on live and dynamic user interactions rather than traditional pagination.

- **Real-Time Data and Updates:**
  - **WebSocket**: For real-time updates on driver locations, ride status, and ETA.
  - **SSE**: Stream ongoing trip alerts or notifications about driver arrival.
  - **HTTP Polling**: Sometimes used for checking ride status in environments where WebSockets are not supported.

## High Level Diagram

![Getting Started](iOSDesign.png)
