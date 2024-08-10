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

- What kind of files can users upload (Images, Text, etc)?
- What formatting tools are available for document editing, and can multiple users edit simultaneously?
- What communication tools are provided for collaboration, such as comments or chat?
- How can users organize documents, and is offline access supported?
- How are sharing permissions managed, and can users collaborate with external parties?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### News Feed (e.g., Facebook, Twitter)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/feeds` - Retrieve a list of feed items.
    - `POST /api/posts` - Create a new post.
    - `GET /api/posts/{id}` - Get details of a specific post.
    - `DELETE /api/posts/{id}` - Delete a specific post.

- **GraphQL + HTTP**:
  - **Use Case**: Allows clients to request specific feed items and associated metadata, reducing over-fetching. Supports dynamic queries for personalized content and user-specific feeds.
  - **Query Example**:

    ```graphql
    {
      feed {
        id
        title
        author {
          name
          avatar
        }
        comments {
          content
          author
        }
      }
    }
    ```

- **WebSocket**:
  - Use for subscribing to live updates when new posts or comments are added to the feed.
  - Example: Subscribe to a channel like `/ws/feeds/{userId}` to get real-time notifications.

- **SSE**:
  - Use for continuously streaming updates to the feed, such as breaking news or live events.
  - Endpoint: `/sse/feeds` to push updates for new posts or comments.

- **App-Side Storage:**
  - **Key-Value Storage**: Store user preferences (e.g., theme settings) using UserDefaults.
  - **Database/ORM**: Use Core Data or Realm to cache feed items and interactions for offline access.
  - **Secure Storage**: Store user credentials securely in the Keychain.
  - **Cache**:
    - **LRU**: Cache recently viewed feed items for quick access.
    - **LFU**: Cache popular posts with frequent interaction.

- **Backend Storage:**
  - **NoSQL**: Use document-based stores like MongoDB for flexible schemas and dynamic content.

- **Pagination:**
  - **Cursor-based**: Ideal for infinite scrolling and efficiently loading additional feed items as the user scrolls.

- **Real-Time Data and Updates:**
  - **WebSocket**: For real-time updates on new posts or comments.
  - **SSE**: Useful for streaming continuous feed updates, such as live news events.
  - **HTTP Polling**: Periodic checks for new content, especially if WebSockets or SSE aren't available.

## High Level Diagram

![Getting Started](iOSDesign.png)
