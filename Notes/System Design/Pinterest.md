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

- How are pins displayed, and what information is shown with them for quick mobile interaction?
- What media types can users create pins with?
- Can users favorite or organize boards?
- What interactions can users perform with pins, such as liking, commenting, or repinning?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Pinterest (e.g., Pinterest)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/pins` - List pins.
    - `POST /api/pins` - Create a new pin.
    - `GET /api/pins/{id}` - Retrieve pin details.

- **GraphQL + HTTP**:
  - **Use Case**: Allows querying for specific pin details, board content, and user interactions. Supports complex queries for content discovery and recommendation systems.
  - **Query Example**:

    ```graphql
    {
      pin(id: "123") {
        title
        imageUrl
        creator {
          name
          profilePicture
        }
      }
    }
    ```

- **WebSocket**:
  - Use for real-time updates on new pins or board activities.
  - Example: Subscribe to `/ws/pins/updates` for live notifications.

- **SSE**:
  - Use for streaming updates on board activities or new content recommendations.
  - Endpoint: `/sse/pins/recommendations` for real-time updates.

- **App-Side Storage:**
  - **Key-Value Storage**: Store board layout and user preferences.
  - **Database/ORM**: Use Realm for caching pins and board data.
  - **Secure Storage**: Store user credentials securely in the Keychain.
  - **Cache**:
    - **LRU**: Cache recently viewed pins and boards.
    - **LFU**: Cache popular pins for faster access.

- **Backend Storage:**
  - **NoSQL**: Ideal for handling image-related data and metadata.

- **Pagination:**
  - **Cursor-based**: For efficient browsing through pins and boards.

- **Real-Time Data and Updates:**
  - **WebSocket**: For updates on new pins or board activities.
  - **SSE**: Stream updates on board recommendations or activities.
  - **HTTP Polling**: Used for periodic checks in less interactive areas.

## High Level Diagram

![Getting Started](iOSDesign.png)
