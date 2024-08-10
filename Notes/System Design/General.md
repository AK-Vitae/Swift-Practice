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

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### General Application Development Guide

#### REST + HTTP

- **Use Case**: REST is suitable for handling standard CRUD operations on resources. It is widely used for applications where clear resource boundaries exist and operations are mainly request-response based.

- **Generic Endpoints**:
  - `GET /api/resources` - Retrieve a list of resources.
  - `POST /api/resources` - Create a new resource.
  - `GET /api/resources/{id}` - Retrieve details of a specific resource.
  - `PUT /api/resources/{id}` - Update a specific resource.
  - `DELETE /api/resources/{id}` - Delete a specific resource.

- **Scenario**: Use REST for managing entities such as users, products, or orders where operations involve creating, reading, updating, and deleting records.

#### GraphQL + HTTP

- **Use Case**: GraphQL is ideal for applications that require flexible and efficient data retrieval. It allows clients to specify exactly what data they need, which can help reduce over-fetching and under-fetching.

- **Generic Query Example**:

  ```graphql
  {
    resource(id: "123") {
      name
      description
      relatedEntities {
        id
        name
      }
    }
  }
  ```

- **Scenario**: Use GraphQL to fetch related data from multiple resources in a single request, allowing for complex queries and dynamic data needs.

#### WebSocket

- **Use Case**: WebSocket is used for real-time, bidirectional communication between the client and server. It's suitable for applications that require low-latency updates or real-time interactions.

- **Scenario**: Use WebSocket for real-time features like notifications, chat, live updates, or collaborative editing.

- **Example**: Connect to `/ws/resource-updates` to receive real-time updates on changes to specific resources.

#### SSE (Server-Sent Events)

- **Use Case**: SSE is used for unidirectional, server-to-client streaming of updates. It’s suitable for applications that need to push updates to clients without requiring a two-way communication channel.

- **Scenario**: Use SSE to stream continuous updates like stock prices, live scores, or notifications.

- **Endpoint**: `/sse/resource-updates` to push updates to clients as changes occur.

#### gRPC

- **Use Case**: gRPC is used for high-performance, low-latency communication, particularly for inter-service communication in microservices architectures. It's suitable for applications that need efficient binary communication.

- **Generic Service Example**:

  ```protobuf
  service ResourceService {
    rpc GetResource(ResourceRequest) returns (ResourceResponse);
    rpc UpdateResource(ResourceUpdateRequest) returns (ResourceUpdateResponse);
  }
  ```

- **Scenario**: Use gRPC for backend services that require fast, efficient communication for real-time data processing or analytics.

### Summary

When approaching a new or custom application type, consider the following guidelines:

- **REST + HTTP** is great for well-defined resource management and standard CRUD operations.
- **GraphQL + HTTP** provides flexibility and efficiency for complex data retrieval and manipulation needs.
- **WebSocket** is optimal for real-time communication and interactive applications requiring low-latency updates.
- **SSE** is best for unidirectional streaming of updates from server to client, ideal for live data feeds.
- **gRPC** offers efficient, high-performance communication for internal microservices or backend processes.

#### Local Storage

- **Key-Value Storage**: For simple, unstructured data (e.g., preferences, settings).
  - **Example**: Store user settings using UserDefaults on iOS.

- **Database/ORM**: For structured data requiring complex querying.
  - **Example**: Use Core Data or Realm to manage offline data like user profiles and content.

- **Secure Storage**: For sensitive data (e.g., credentials, tokens).
  - **Example**: Store secure information in the Keychain on iOS.

#### Backend Storage

- **SQL Databases**: For structured, transactional data with complex relationships.
  - **Example**: Use PostgreSQL for transactional data like orders and payments.

- **NoSQL Databases**: For flexible, scalable storage of unstructured data.
  - **Example**: Use MongoDB or DynamoDB for user-generated content and metadata.

#### Caching Strategies

- **LRU (Least Recently Used)**: Cache recently accessed data for quick re-access.
  - **Example**: Cache recent API responses to improve performance.

- **LFU (Least Frequently Used)**: Cache frequently accessed data for quick retrieval.
  - **Example**: Cache popular content or frequently accessed user profiles.

- **FIFO (First In, First Out)**: Maintain a rolling cache, replacing old data with new.
  - **Example**: Cache streaming data segments to ensure seamless playback.

#### Pagination

- **Offset-based**: Use for traditional paginated content like lists and tables.
  - **Example**: Load additional pages of a product catalog as the user scrolls.

- **Cursor-based**: Use for infinite scrolling and dynamic content loading.
  - **Example**: Continuously load new feed items in a social media app.

#### Real-Time Data and Updates

- **WebSocket**: For low-latency, bidirectional communication.
  - **Example**: Real-time chat messages and notifications.

- **SSE (Server-Sent Events)**: For unidirectional, server-to-client updates.
  - **Example**: Live sports scores or financial market data.

- **HTTP Polling**: For periodic updates when real-time connections aren't feasible.
  - **Example**: Regularly check for new emails or notifications.

## High Level Diagram

![Getting Started](iOSDesign.png)
