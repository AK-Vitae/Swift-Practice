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

## Collaborative Apps (e.g., Google Docs, Notion)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/documents` - List documents.
    - `POST /api/documents`

- Create a new document.
  - `PUT /api/documents/{id}` - Update a document.

- **GraphQL + HTTP**:
  - **Use Case**: Allows querying for specific document sections, user edits, and comments. Supports dynamic collaboration features and real-time content updates.
  - **Query Example**:

    ```graphql
    {
      document(id: "123") {
        title
        content
        lastModified
      }
    }
    ```

- **WebSocket**:
  - Ideal for real-time collaboration and document editing with low latency.
  - Example: Connect to `/ws/documents/{documentId}` for live updates.

- **gRPC**:
  - Use for low-latency synchronization and efficient data transfer.
  - Example service: `UpdateDocument(DocumentRequest) returns (DocumentResponse)`

- **App-Side Storage:**
  - **Key-Value Storage:** Store collaboration settings and notifications.
  - **Database/ORM:** Use Core Data for documents and collaboration data.
  - **Secure Storage:** Securely store credentials in the Keychain.
  - **Cache**:
    - **LRU**: Cache recently edited documents for quick access.
    - **LFU**: Cache frequently accessed templates.

- **Backend Storage:**
  - **NoSQL:** For flexible document storage and real-time collaboration data.

- **Pagination:**
  - Not typically used: Content loads dynamically based on user interaction.

- **Real-Time Data and Updates:**
  - **WebSocket:** For real-time collaboration and document editing.
  - **SSE:** For document changes or updates notifications.
  - **HTTP** Polling: Less common, but may be used for session maintenance.

## Important General Topics

- If out of local storage, need to clear files/content/cache and this should be conveyed to the user
- If data is going to be refreshed every fixed interval polling might be goood
- If a consistent connection is required then SSE or WebSocket might be better
- When retrieving data from the local storage we may want to synchronize with our backend

## Important Specfic Topics

- Synchronization Service
  - For large files possibly done by using chunks

## High Level Diagram

![Getting Started](iOSDesign.png)
