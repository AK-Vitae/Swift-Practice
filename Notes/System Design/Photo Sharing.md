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

- How are photos displayed to users, and what metadata is shown?
- What media types can users upload?
- Can users interact with photos, such as liking, commenting, or sharing?
- Can users organize their photos into albums or collections?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Photo Sharing (e.g., Instagram, Flickr)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/photos` - List user photos.
    - `POST /api/photos` - Upload a new photo.
    - `GET /api/photos/{id}` - Get photo details.
    - `POST /api/photos/{id}/like` - Like a photo.

- **GraphQL + HTTP**:
  - **Use Case**: Allows querying for specific photo metadata, user interactions, and comments. Supports complex queries for browsing user feeds and discovering new content.
  - **Query Example**:

    ```graphql
    {
      photo(id: "123") {
        title
        url
        likes
        comments {
          user
          text
        }
      }
    }
    ```

- **WebSocket**:
  - Use for real-time notifications of new photo uploads or comments.
  - Example: Connect to `/ws/photos/{userId}` for updates on new activities.

- **SSE**:
  - Use for streaming updates to photo feeds or notifying users about new content.
  - Endpoint: `/sse/photos/updates` to push real-time photo activities.

- **App-Side Storage:**
  - **Key-Value Storage**: Store user preferences like feed layout.
  - **Database/ORM**: Use Realm or SQLite for caching photos and comments.
  - **Secure Storage**: Store user credentials securely in the Keychain.
  - **Cache**:
    - **LRU**: Cache recent photos and galleries for quick access.
    - **LFU**: Cache frequently liked or commented photos.

- **Backend Storage:**
  - **NoSQL**: Ideal for managing large volumes of unstructured data such as images and metadata.

- **Pagination:**
  - **Cursor-based**: Efficient for infinite scrolling in photo feeds.

- **Real-Time Data and Updates:**
  - **WebSocket**: For live notifications of new uploads or comments.
  - **SSE**: Stream updates for photo activities or new content alerts.
  - **HTTP Polling**: For fetching updates in less interactive scenarios.

## High Level Diagram

![Getting Started](iOSDesign.png)
