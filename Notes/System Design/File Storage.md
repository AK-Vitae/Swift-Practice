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

### File Storage (e.g., Google Drive, Dropbox)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/files` - List files.
    - `POST /api/files/upload` - Upload a file.
    - `GET /api/files/{id}` - Download a file.

- **GraphQL + HTTP**:
  - **Use Case**: Allows querying for specific file metadata, user permissions, and folder structures. Supports complex search and filtering of stored content.
  - **Query Example**:

    ```graphql
    {
      file(id: "123") {
        name
        size
        owner {
          name
        }
      }
    }
    ```

- **WebSocket**:
  - Use for real-time notifications of file changes or collaboration updates.
  - Example: Connect to `/ws/files/updates` for live file status.

- **gRPC**:
  - Use for real-time synchronization and efficient data transfer between devices.

- **App-Side Storage:**
  - **Key-Value Storage**: Store sync preferences and settings.
  - **Database/ORM**: Use Core Data to cache files and metadata for offline access.
  - **Secure Storage**: Secure credentials and tokens in the Keychain.
  - **Cache**:
    - **LRU**: Cache recently accessed files for quick reopening.
    - **LFU**: Cache frequently accessed documents.

- **Backend Storage:**
  - **NoSQL**: For file metadata and user settings, with cloud storage for files.

- **Pagination:**
  - **Offset-based**: For browsing large file lists and directories.

- **Real-Time Data and Updates:**
  - **WebSocket**: For real-time file changes and updates.
  - **SSE**: Stream notifications on file status or updates.
  - **HTTP Polling**: Used for syncing file changes in the background.

## High Level Diagram

![Getting Started](iOSDesign.png)
