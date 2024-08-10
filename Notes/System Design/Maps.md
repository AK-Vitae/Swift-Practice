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

- What map views are available, and are there layers for traffic or transit optimized for mobile?
- What search filters can users apply, and can they save or bookmark locations easily on mobile?
- What navigation modes are supported, and is there real-time traffic information with mobile-friendly updates?
- Can users contribute information, such as reviews or photos?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Maps (e.g., Google/Apple Maps)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/maps` - Retrieve map data.
    - `GET /api/locations` - List locations.
    - `POST /api/routes` - Calculate a route.

- **GraphQL + HTTP**:
  - **Use Case**: Allows querying for specific map features, routes, and location data. Supports dynamic search and filtering of geographic information.
  - **Query Example**:

    ```graphql
    {
      route(start: "Location A", end: "Location B") {
        distance
        duration
        steps {
          instruction
          distance
        }
      }
    }
    ```

- **WebSocket**:
  - Use for real-time navigation updates and location tracking.
  - Example: Connect to `/ws/navigation/{tripId}` for live tracking.

- **SSE**:
  - Use for streaming updates on location-based alerts or map changes.
  - Endpoint: `/sse/maps/alerts` for real-time notifications.

- **App-Side Storage:**
  - **Key-Value Storage**: Store map type preferences.
  - **Database/ORM**: Use SQLite for caching map tiles and routes.
  - **Secure Storage**: Store location permissions securely in the Keychain.
  - **Cache**:
    - **LRU**: Cache recent routes and map views.
    - **LFU**: Cache frequently accessed locations.

- **Backend Storage:**
  - **NoSQL**: For geospatial data, using spatial databases for optimized queries.

- **Pagination:**
  - **Not typically used**: Data is dynamically loaded based on navigation.

- **Real-Time Data and Updates:**
  - **WebSocket**: For live navigation updates and location tracking.
  - **SSE**: Stream location-based alerts or map updates.
  - **HTTP Polling**: For checking conditions like traffic updates.

## High Level Diagram

![Getting Started](iOSDesign.png)
