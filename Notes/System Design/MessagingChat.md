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

- Can the user make Voice/Video calls?
- Video/Voice/Photo attachment support?
- Group Chats?
- Editing and deleting messages?
- Message Status (sending, sent, received, read receipts)?
- Is there any personalization the user can do?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Messaging/Chat (e.g., Messenger, Slack)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/conversations` - List user conversations.
    - `GET /api/messages/{conversationId}` - Get messages from a conversation.
    - `POST /api/messages` - Send a new message.
    - `PUT /api/resources/{id}` - Update resource.
    - `DELETE /api/resources/{id}` - Delete resource.

- **GraphQL + HTTP**:
  - **Use Case**: Allows querying for specific conversation details, participants, and message metadata. Supports dynamic queries for managing chat features and retrieving user-specific data.
  - **Query Example**:

    ```graphql
    {
      conversation(id: "123") {
        messages {
          id
          content
          sender {
            name
            avatar
          }
          timestamp
        }
      }
    }
    ```

- **WebSocket**:
  - Ideal for real-time message delivery and typing indicators.
  - Example: Connect to `/ws/chat/{conversationId}` for live chat updates.

- **gRPC**:
  - Use for low-latency message syncing between servers.
  - Example service: `SendMessage(MessageRequest) returns (MessageResponse)`

- **App-Side Storage:**
  - **Key-Value Storage**: Store chat settings and user preferences.
  - **Database/ORM**: Use Realm or SQLite for messages and chat history for offline access.
  - **Secure Storage**: Secure user authentication tokens in the Keychain.
  - **Cache**:
    - **LRU**: Cache recent conversations for fast loading.
    - **LFU**: Cache frequently accessed media files (images, voice notes).

- **Backend Storage:**
  - **SQL**: Use relational databases for managing user relationships, messages, and threads.

- **Pagination:**
  - **Offset-based**: Efficient for loading previous messages in a chat conversation.

- **Real-Time Data and Updates:**
  - **WebSocket**: Essential for real-time message delivery and typing indicators.
  - **SSE**: Can be used for notifying users of message receipts or read status.
  - **HTTP Polling**: Less common, but used for checking updates in inactive conversations.

## High Level Diagram

![Getting Started](iOSDesign.png)
