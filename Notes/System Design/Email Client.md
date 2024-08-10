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

- How are emails organized within the app? Do we have to be concerned about sorting and filtering?
- What features does the email composer support, such as formatting options and attachments?
- Email syncing? Offline access?
- Can users personalize their notification settings?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Email Client (e.g., Outlook, Gmail)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/emails` - Retrieve emails.
    - `POST /api/emails/send` - Send a new email.
    - `GET /api/emails/{id}` - Retrieve a specific email.

- **GraphQL + HTTP**:
  - **Use Case**: Allows clients to fetch specific email fields and metadata needed for displaying the inbox. Supports dynamic queries for managing email threads and attachments.
  - **Query Example**:

    ```graphql
    {
      emails(folder: "inbox") {
        id
        subject
        sender {
          name
          email
        }
        receivedAt
      }
    }
    ```

- **WebSocket**:
  - Use for real-time notifications of new emails or changes in mailbox state.
  - Example: Connect to `/ws/emails/{userId}` for live email updates.

- **SSE**:
  - Use for streaming notifications of new messages or mailbox changes.
  - Endpoint: `/sse/emails/updates` for real-time email notifications.

- **App-Side Storage:**
  - **Key-Value Storage**: Store notification and sync preferences.
  - **Database/ORM**: Use SQLite for caching emails and attachments.
  - **Secure Storage**: Secure user credentials in the Keychain.
  - **Cache**:
    - **LRU**: Cache recently accessed emails for quick navigation.
    - **LFU**: Cache frequently accessed contacts.

- **Backend Storage:**
  - **SQL**: Use relational databases for structured email storage and indexing.

- **Pagination:**
  - **Offset-based**: For navigating large email lists and threads.

- **Real-Time Data and Updates:**
  - **WebSocket**: For real-time notifications of new emails.
  - **SSE**: Stream notifications for mailbox changes.
  - **HTTP Polling**: Commonly used for checking new emails in less interactive settings.

## High Level Diagram

![Getting Started](iOSDesign.png)
