# iOS System Design Topic Overview

## HTTP Overview

**HTTP (Hypertext Transfer Protocol)** is a protocol used for transmitting information across the web. It is based on the client-server model and allows for communication between web browsers (clients) and web servers.

* **Request-Response Protocol:** In HTTP, the client sends an HTTP request to the server, which then processes the request and returns an HTTP response.

* **Built on TCP:** HTTP is built on top of the TCP (Transmission Control Protocol), ensuring reliable data transmission between client and server.

* **Stateless:** Each HTTP request is independent, meaning the server does not retain any information about previous requests.

### Anatomy of an HTTP Message

#### **HTTP Request**

1. **Request Line:** Specifies the HTTP method (GET, POST, etc.), the URL, and the HTTP version.
   * Example: `GET /index.html HTTP/1.1`

2. **Headers:** Provide additional information about the request.
   * **General Headers:** Include information applicable to both request and response.
     * Example: `Date: Wed, 21 Oct 2015 07:28:00 GMT`
   * **Request Headers:** Provide information about the client.
     * `User-Agent`: Identifies the client software initiating the request.
     * `Accept`: Specifies the media types the client is willing to receive.
     * `Authorization`: Contains credentials for authenticating the client.

3. **Body:** Contains data sent to the server (optional, used primarily in POST, PUT requests).

#### **HTTP Response**

1. **Status Line:** Includes the HTTP version, status code, and status message.
   * Example: `HTTP/1.1 200 OK`

2. **Headers:** Provide metadata about the response.
   * **General Headers:** As with requests, they include shared information.
   * **Response Headers:** Specific to the response.
     * `Content-Type`: Indicates the media type of the response body.
     * `Server`: Provides information about the software used by the origin server.

3. **Body:** Contains the data returned by the server (e.g., HTML, JSON).

### HTTP Methods

HTTP methods are used to perform actions on the server. Here are the most common ones used in mobile development:

1. **GET:**
   * **Definition:** Retrieves data from the server.
   * **Characteristics:**
     * Usually does not contain a request body.
     * Can be cached by the browser or intermediate caches.
   * **Example in Mobile:** Fetching a list of users or retrieving specific user details.
   * **Endpoint Example:**
     * `GET https://api.example.com/users`
   * **Use Case:**
     * Displaying content like news articles or user profiles.

2. **POST:**
   * **Definition:** Sends data to the server to create a resource.
   * **Characteristics:**
     * Contains a request body with data to be processed.
     * Not cacheable by default.
   * **Example in Mobile:** Submitting a form, uploading a file, or creating a new user account.
   * **Endpoint Example:**
     * `POST https://api.example.com/users`
   * **Use Case:**
     * User registration, sending feedback.

3. **PUT:**
   * **Definition:** Updates a resource on the server.
   * **Characteristics:**
     * Contains a request body with data to update.
     * Idempotent: Performing the same request multiple times results in the same state on the server.
   * **Example in Mobile:** Updating user profile information or modifying a specific record.
   * **Endpoint Example:**
     * `PUT https://api.example.com/users/123`
   * **Use Case:**
     * Changing user settings, updating product details.

4. **DELETE:**
   * **Definition:** Removes a resource from the server.
   * **Characteristics:**
     * Usually does not contain a request body.
     * Idempotent: Performing the same request multiple times results in the same state.
   * **Example in Mobile:** Deleting a user account or removing an item from a list.
   * **Endpoint Example:**
     * `DELETE https://api.example.com/users/123`
   * **Use Case:**
     * Removing data, canceling a subscription.

### HTTP Status Codes

Status codes indicate the result of an HTTP request. Here are some common codes and their relevance to mobile development:

1. **1xx: Informational**
   * Rarely used in mobile apps.

2. **2xx: Success**
   * **200 OK:** The request was successful, and the server returned the requested data.
     * **Example:** Successfully fetched user data.
   * **201 Created:** The request was successful, and a new resource was created.
     * **Example:** A new user account was created via a POST request.
   * **204 No Content:** The request was successful, but there is no content to return.
     * **Example:** A DELETE request successfully removed a resource.

3. **3xx: Redirection**
   * **301 Moved Permanently:** The resource has been moved to a new URL.
     * **Example:** Useful for updating app links.
   * **302 Found:** The resource is temporarily located at a different URL.
     * **Example:** Redirecting users during maintenance.

4. **4xx: Client Errors**
   * **400 Bad Request:** The request was invalid or cannot be processed.
     * **Example:** Missing required fields in a request body.
   * **401 Unauthorized:** Authentication is required, or authentication failed.
     * **Example:** Accessing a protected API endpoint without valid credentials.
   * **403 Forbidden:** The server understands the request but refuses to authorize it.
     * **Example:** A user trying to access restricted data.
   * **404 Not Found:** The requested resource was not found on the server.
     * **Example:** Accessing a nonexistent endpoint.
   * **422 Unprocessable Entity:** The server understands the request, but it was unable to process the contained instructions.
     * **Example:** Validation error, such as submitting a form with invalid data.

5. **5xx: Server Errors**
   * **500 Internal Server Error:** The server encountered an unexpected condition.
     * **Example:** An error in the server code when processing a request.
   * **502 Bad Gateway:** The server received an invalid response from the upstream server.
     * **Example:** Issues with the backend server configuration.
   * **503 Service Unavailable:** The server is currently unable to handle the request.
     * **Example:** Server maintenance or overload.

### Examples in Mobile Development

* **Fetching Data:** Use GET requests to retrieve data such as lists of items, user profiles, or application settings.
* **Submitting Forms:** Use POST requests to send user input from forms, like registration or feedback forms.
* **Updating Resources:** Use PUT requests to change existing data, such as updating user settings or profile information.
* **Deleting Data:** Use DELETE requests to remove resources, like deleting user accounts or removing items from a cart.

### Tips for Mobile Developers

* **Caching:** Leverage GET request caching to improve performance and reduce data usage.
* **Error Handling:** Implement comprehensive error handling based on HTTP status codes to provide user-friendly feedback.
* **Security:** Always use HTTPS to encrypt data in transit and protect sensitive information.
* **Efficiency:** Optimize the use of HTTP methods to minimize data usage and ensure a responsive user experience.

### HTTP Polling

**HTTP Polling** is a technique where the client repeatedly requests data from the server at regular intervals to check for updates.

#### Example Use Case

* **Polling for Tweet Updates:** A mobile app polls the server every 30 seconds to check for new tweets or updates in the user's feed.

#### When to Use

* **Simple Updates:** Suitable when updates are infrequent, and the application can tolerate some delay.
* **Low Priority Data:** Use polling for non-critical data where real-time updates are not essential.

#### Pros of HTTP Polling

* **Simple to Implement:** Easy to set up using standard HTTP requests.
* **Widely Supported:** Works with most servers and clients.

#### Cons of HTTP Polling

* **Inefficient:** Consumes more bandwidth and resources as requests are made regularly, even if there is no new data.
* **Latency:** Updates are delayed until the next polling interval, leading to potentially stale data.

---

### WebSockets

**WebSockets** provide a full-duplex communication channel over a single, long-lived connection between the client and the server.

#### Steps to Establish a WebSocket Connection

1. **Handshake:** The client initiates a WebSocket connection with an HTTP request, and the server responds with a 101 status code, upgrading the connection.
2. **Persistent Connection:** After the handshake, the connection remains open, allowing data to flow freely between client and server.
3. **Bi-Directional Communication:** Both client and server can send messages independently without waiting for each other's response.

#### Example

* **Chat Messaging App:** A messaging app uses WebSockets to enable real-time chat functionality, allowing users to send and receive messages instantly.

#### Pros of WebSockets

* **Real-Time Communication:** Enables instant data exchange, ideal for chat applications, live updates, etc.
* **Bi-Directional:** Both client and server can send and receive messages independently.

#### Cons of WebSockets

* **Complexity:** Requires more setup and management compared to HTTP-based communication.
* **Overhead:** The persistent connection can consume resources, especially on mobile devices with limited battery life.

---

### Server-Sent Events (SSE)

**Server-Sent Events (SSE)** are a technology that allows the server to push updates to the client over a single, persistent HTTP connection. Unlike WebSockets, which support full-duplex communication, SSE is unidirectional, meaning data flows from the server to the client only.

* **Live News Updates:** Providing users with real-time news feeds without requiring them to refresh the page or app manually.
* **Stock Market Data:** Streaming live stock prices or market updates to users who are monitoring investments.
* **Social Media Notifications:** Sending real-time notifications about social media activities, such as likes, comments, or messages.

#### Pros of SSE

* **Efficient Use of Resources:** Uses a single, long-lived HTTP connection, reducing the overhead of constantly opening new connections.
* **Easy to Implement:** Built into the HTTP protocol, making it easier to set up compared to more complex solutions like WebSockets.
* **Automatic Reconnection:** SSE clients automatically reconnect if the connection is lost, providing robustness.

#### Cons of SSE

* **Unidirectional:** Only supports server-to-client communication. If the client needs to send data back to the server, it must use separate HTTP requests.
* **Limited Support on Mobile:** Primarily designed for web applications and less commonly used in native mobile applications.
* **Less Control:** Limited control over message delivery compared to WebSockets, as it relies on HTTP.

---

### Push Notifications

**Push Notifications** are messages sent from a server to a client application to notify users of new information, even when the app is not actively running. Push notifications are typically handled by third-party services like Apple Push Notification Service (APNS) or Firebase Cloud Messaging (FCM).

* **Messaging Apps:** Notifying users of new messages or chat activity.
* **News Apps:** Alerting users about breaking news or important updates.
* **E-commerce Apps:** Sending promotions or order status updates to customers.

#### Pros of Push Notifications

* **Easier to Implement:** Compared to building a dedicated real-time messaging service, push notifications rely on existing infrastructure, simplifying implementation.
* **Can Wake the App in the Background:** Push notifications can trigger background updates or alert users to new content without requiring them to open the app manually.
* **Wide Reach:** Notifications can reach users even when the app is closed or not running.

#### Cons of Push Notifications

* **Not 100% Reliable:** Delivery of push notifications is not guaranteed, and some messages may not arrive.
* **Delay in Delivery:** Notifications may take up to a minute or more to arrive, depending on network conditions and service latency.
* **Reliance on Third-Party Services:** Developers rely on services like APNS or FCM, which means they have less control over delivery and behavior.
* **Users Can Opt-Out Easily:** Users can disable notifications at the system level, reducing the effectiveness of this communication channel.

---

### Pagination

**Pagination** is a technique used to divide large datasets into smaller, manageable chunks, improving performance and user experience, especially in mobile applications.

### Offset-Based Pagination

**Offset-based pagination** uses `offset` and `limit` parameters to specify the starting point and the number of items to retrieve.

Imagine an API that returns a list of products in an e-commerce app:

* **Initial Call:** To fetch the first 20 products.

  ```html
  GET https://api.example.com/products?offset=0&limit=20
  ```

* **Subsequent Call:** To fetch the next 20 products.

  ```html
  GET https://api.example.com/products?offset=20&limit=20
  ```

* **Explanation:**
  * **`offset`:** Specifies the index of the first item to return.
  * **`limit`:** Specifies the maximum number of items to return in a single request.

### Cursor-Based Pagination

**Cursor-based pagination** uses a `cursor` parameter to track the position in the dataset. The cursor is usually returned by the server in the response and is opaque to the client.

Imagine an API that returns a timeline of social media posts:

* **Initial Call:** To fetch the first batch of posts.

  ```html
  GET https://api.example.com/posts?limit=20
  ```

* **Subsequent Call:** To fetch the next batch using a cursor received from the previous response.

  ```html
  GET https://api.example.com/posts?cursor=abcdefg&limit=20
  ```

* **Explanation:**
  * **`cursor`:** A token provided by the server indicating where to start the next set of data.
  * **`limit`:** Specifies the maximum number of items to return in a single request.

### Page-Based Pagination

**Page-based pagination** uses `page` and `per_page` parameters to retrieve a specific page of items.

Imagine an API that returns search results in a news app:

* **Initial Call:** To fetch the first page of results.

  ```html
  GET https://api.example.com/search?q=technology&page=1&per_page=20
  ```

* **Subsequent Call:** To fetch the second page of results.

  ```html
  GET https://api.example.com/search?q=technology&page=2&per_page=20
  ```

* **Explanation:**
  * **`page`:** Specifies the current page number to retrieve.
  * **`per_page`:** Specifies the number of items to return per page.

### Key Considerations for Pagination in Mobile Development

* **User Experience:** Provide visual feedback (like loading indicators) during data retrieval to keep users informed.
* **Efficiency:** Adjust the number of items per request based on performance testing to balance load times and resource usage.
* **State Management:** Maintain the current state of pagination (such as the current page or cursor) within the app to ensure smooth navigation.

Certainly! Here's a more detailed overview of API paradigms, focusing on REST, GraphQL, and gRPC, with examples and when they would be appropriate for mobile applications.

---

### REST

**REST (Representational State Transfer)** is an architectural style for designing networked applications, based on stateless communication and resource-based interactions.

* **Stateless:** Each request from client to server must contain all information needed to understand and process the request.
* **Resource-Based:** Each resource (such as users, products, or orders) is represented by a specific URL.
* **Common Data Format:** JSON is commonly used for data interchange, though XML can also be used.

#### Pros of REST

* **Simplicity:** Easy to understand and implement with standard HTTP methods (GET, POST, PUT, DELETE).
* **Caching:** Leverages HTTP caching to improve performance and reduce server load.
* **Wide Adoption:** Supported by most platforms, tools, and libraries.

#### Cons of REST

* **Overfetching:** Clients may receive more data than needed.
  * **Example:** A request for a list of users may return full user profiles when only names are needed.
  * **Endpoint Example:** `GET /users` may return full profiles, while the app only needs usernames.
* **Underfetching:** Clients may need multiple requests to get all necessary data.
  * **Example:** Fetching a user's profile and recent activities might require separate calls.
  * **Endpoint Example:** `GET /users/1` for user details, `GET /users/1/activities` for activities.

#### Use Case: REST

* **Social Networking App:** Fetching user profiles, posts, comments, and likes can be easily managed using REST due to its straightforward nature and HTTP method alignment.

#### Example Endpoints

* **Get User Profile:** `GET /users/1`
* **Create New Post:** `POST /posts`
* **Update User Profile:** `PUT /users/1`
* **Delete Comment:** `DELETE /comments/1`

---

### GraphQL

**GraphQL** is a query language for APIs that allows clients to request exactly the data they need, providing a more flexible and efficient interaction model.

* **Query Language:** Clients define precisely what data they need, allowing for more efficient data retrieval.
* **Single Endpoint:** Typically uses a single endpoint for all queries and mutations, reducing complexity.
* **Flexible Data Retrieval:** Clients specify exactly what fields they want for a resource.

#### Pros of GraphQL

* **Reduced Overfetching/Underfetching:** Clients get exactly the data they need, reducing unnecessary data transfer.
* **Efficient for Complex Requests:** Can fetch multiple related resources in a single request.
* **Strong Schema and Type System:** Ensures consistency and validation, reducing runtime errors.

#### Cons of GraphQL

* **Complexity:** More complex to implement and set up compared to REST.
* **Caching Challenges:** Traditional HTTP caching is less effective due to the dynamic nature of queries.
* **Overhead:** The need to parse GraphQL queries can introduce overhead on the server.

#### Use Case: GraphQL

* **E-commerce App:** Fetch product details, user preferences, and order history in a single query, improving efficiency and user experience.

#### Example Queries

* **Fetch User and Posts:**

  ```graphql
  query {
    user(id: 1) {
      name
      email
      posts {
        title
        content
      }
    }
  }
  ```

* **Create a New Product:**

  ```graphql
  mutation {
    createProduct(input: {name: "New Product", price: 19.99}) {
      id
      name
      price
    }
  }
  ```

---

### gRPC

**gRPC** is a high-performance, open-source framework that uses HTTP/2 for transport and Protocol Buffers for serialization, providing features like streaming and bi-directional communication.

* **Built on HTTP/2:** Offers multiplexing, flow control, and low latency communication.
* **Protocol Buffers:** Uses an efficient serialization format, reducing message size.
* **Supports Streaming:** Can handle client-side, server-side, and bi-directional streaming.

#### Pros of gRPC

* **Efficiency:** Lightweight and fast due to Protocol Buffers and HTTP/2.
* **Streaming Capabilities:** Supports complex real-time communication scenarios.
* **Strong Typing:** Uses a strongly typed schema, ensuring consistency and reducing errors.

#### Cons of gRPC

* **Limited Browser Support:** Primarily designed for backend communication, with limited browser support.
* **Complexity:** More complex to set up compared to REST and GraphQL.
* **Readability:** Protocol Buffers are not as human-readable as JSON.
* **Custom Error Handling:** Requires custom error handling, as it doesn't use standard HTTP status codes.

#### Use Case: gRPC

* **Video Streaming Service:** Efficiently handles real-time data streaming and bidirectional communication for features like live chat and video feeds.

### Summary of Api Paradigms

Each API paradigm offers unique benefits and trade-offs. The choice depends on the specific needs of the mobile application, such as data complexity, real-time requirements, and development resources:

* **REST** is ideal for simple applications with well-defined resource boundaries and standard HTTP operations.
* **GraphQL** is suitable for apps that require flexibility and efficiency in data retrieval, especially when dealing with complex data structures.
* **gRPC** is best for performance-critical applications that benefit from streaming and efficient binary communication, particularly in backend systems and real-time services.

## App Side APIs

### REST API Service

* Purpose: Handle standard RESTful operations using HTTP methods.
* Components:
  * Endpoint configuration
  * Request building and execution
  * Authentication headers management

### GraphQL API Service

* Purpose: Handle GraphQL operations and queries.
* Components:
  * Query and mutation construction
  * Handling of variables and fragments

### WebSocket Service

* Purpose: Manage real-time, bidirectional communication.
* Components:
  * Connection management (open, close, reconnect)
  * Message sending and receiving
  * Connection error handling and retry logic

### SSE (Server-Sent Events) Service

* Purpose: Handle server-to-client unidirectional updates.
* Components:
  * Event source setup and management
  * Handling of event streams and message parsing
  * Error handling and reconnection logic

## Data Storage Options on iOS Devices

### 1. Key-Value Storage

**Overview:** Key-value storage is a simple way to store small amounts of data using key-value pairs, typically using `UserDefaults` on iOS.

**Best For:**

* Simple, unstructured data such as settings, preferences, and feature flags.

**Pros:**

* **Easy to Use:** Built-in API is straightforward, requiring minimal setup.
* **Quick Access:** Ideal for storing small, frequently accessed data.

**Cons:**

* **Insecure:** Not suitable for sensitive data (encryption can be added with third-party libraries).
* **Limited Capacity:** Not designed for large datasets.
* **No Schema Support:** Cannot perform complex queries or data migrations.
* **Poor Performance:** Inefficient for large data operations.

**iOS Example:**

* **Settings and Preferences:** Storing user preferences like theme (dark/light mode) or notification settings.

### 2. Database/ORM

**Overview:** Relational databases like SQLite and ORMs (Object-Relational Mapping) like Core Data and Realm are used for storing structured data that requires complex querying.

**Best For:**

* Large volumes of structured data needing relationships and complex queries.

**Pros:**

* **ORM Support:** Simplifies interaction with the database using object-oriented principles.
* **Schema and Querying:** Supports structured queries, joins, and data constraints.
* **Data Migration:** Handles schema changes and migrations effectively.

**Cons:**

* **Complex Setup:** Requires more configuration and understanding of database principles.
* **Insecure:** Needs additional layers or libraries for encryption.
* **Memory Footprint:** Larger memory usage compared to simpler storage solutions.

**iOS Example:**

* **Offline Data Storage:** Storing articles, user profiles, or app content that requires local querying when offline.
* **App State Management:** Persisting complex app states or user-generated content like notes.

### 3. On-Device Secure Storage

**Overview:** Secure storage options like iOS Keychain provide encrypted storage for sensitive data like authentication tokens and passwords.

**Best For:**

* Sensitive data that requires encryption and security.

**Pros:**

* **Security:** Data is encrypted and secured, making it suitable for storing passwords and sensitive tokens.

**Cons:**

* **Limited Use:** Not optimized for large datasets or non-sensitive data.
* **Performance Overhead:** Encryption and decryption add processing time.

**iOS Example:**

* **Password Management:** Storing user credentials securely for automatic login.
* **API Tokens:** Keeping access tokens secure for third-party service integrations using Keychain.

## Storage Locations

### 1. Internal Storage

* **Description:** Sand-boxed storage accessible only to the app. It's secure from other apps accessing its data.
* **Use Case:** Storing app-specific data that should not be exposed, such as app settings and local databases.

### 2. External Storage

* **Description:** Publicly accessible storage, typically used for files that don't require protection and might need to be shared with other apps.
* **Use Case:** Saving user-generated media files that other apps can access, like images or documents.

### 3. Media/Scoped Storage

* **Description:** Special storage for media files with controlled access.
* **Use Case:** Managing media files like photos or videos, with controlled access per app.

## Storage Types

### 1. Documents (Automatically Backed Up)

* **Description:** User-generated data that cannot be easily regenerated, backed up automatically by the system.
* **Use Case:** Saving important files or documents that users expect to retain through device changes.

### 2. Cache

* **Description:** Data that can be downloaded or regenerated and can be deleted to free up space.
* **Use Case:** Storing images or temporary files that improve performance but aren't essential.

### 3. Temp

* **Description:** Temporary data that should be deleted when no longer needed.
* **Use Case:** Storing session-specific data or temporary downloads that don't persist after the app session ends.

## Best Practices for Mobile Storage

* **Minimize Sensitive Data Storage:** Store only what is necessary and ensure sensitive data is encrypted.
* **Use Encrypted Storage:** For sensitive information, always opt for encrypted storage solutions.
* **Manage Storage Growth:** Implement storage cleanup mechanisms to prevent uncontrolled data growth, especially for cached data.
* **Backup Important Data:** Ensure critical user data is backed up, allowing for recovery in case of device loss or app reinstallation.
  
---

## SQL Storage

SQL databases are relational databases that organize data into tables with predefined schemas. They are based on structured query language (SQL) for defining and manipulating data.

### ACID Properties

ACID is a set of properties that ensure reliable processing of database transactions:

1. **Atomicity:**
   * **Definition:** Each transaction is treated as a single unit, which either completely succeeds or fails. There are no partial transactions.
   * **Mobile Example:** In a mobile banking app, transferring money between accounts involves debiting one account and crediting another. Atomicity ensures that both operations occur, or neither does, preventing inconsistencies.

2. **Consistency:**
   * **Definition:** Transactions must transition the database from one valid state to another, maintaining database rules.
   * **Mobile Example:** When updating user profiles in a social media app, consistency ensures that changes conform to all business rules, like unique usernames.

3. **Isolation:**
   * **Definition:** Transactions occur independently without interference from other transactions, ensuring results are predictable and correct.
   * **Mobile Example:** In an e-commerce app, multiple users placing orders concurrently will not interfere with each other's transactions, maintaining isolation.

4. **Durability:**
   * **Definition:** Once a transaction is committed, it remains in the database, even in the case of a system failure.
   * **Mobile Example:** A to-do app that saves tasks to a database ensures that once a task is added and saved, it remains even if the app crashes.

### Types of Data Suited for SQL

* **Structured Data:** Ideal for applications where data integrity and complex querying are required, such as user profiles, transactional data, and metadata.
* **Mobile Examples:**
  * **User Management:** Storing user profiles, authentication data, and preferences.
  * **Inventory Management:** Keeping track of items, stock levels, and pricing in a mobile retail app.

### Notable SQL Databases

* **SQLite:** Lightweight, file-based SQL database often used for mobile apps due to its simplicity and ease of integration.
* **PostgreSQL:** Advanced open-source relational database known for its reliability and robust feature set.
* **MySQL:** Widely-used open-source database known for its ease of use and flexibility.

---

## NoSQL Storage

NoSQL databases are non-relational and designed to handle unstructured data and scale horizontally. They use various data models like key-value pairs, documents, wide-column stores, and graph formats.

### Types of NoSQL Databases

1. **Key-Value Stores:**
   * **Description:** Data is stored as key-value pairs, offering fast retrieval by key.
   * **Mobile Example:** Caching user sessions or temporary data in a chat application.
   * **Notable DB:** Redis

2. **Document Stores:**
   * **Description:** Data is stored in documents (e.g., JSON), which can contain nested data structures.
   * **Mobile Example:** Storing user-generated content or app configuration settings.
   * **Notable DB:** MongoDB

3. **Wide Column Stores:**
   * **Description:** Data is stored in columns rather than rows, optimized for heavy write loads and queries across large datasets.
   * **Mobile Example:** Logging user interactions or tracking app usage statistics.
   * **Notable DB:** Cassandra

4. **Graph Databases:**
   * **Description:** Designed to store and navigate relationships between entities, using nodes, edges, and properties.
   * **Mobile Example:** Representing social networks or recommendation systems in a mobile app.
   * **Notable DB:** Neo4j

### Types of Data Suited for NoSQL

* **Unstructured or Semi-Structured Data:** Ideal for applications that require flexible schemas, horizontal scaling, and rapid development.
* **Mobile Examples:**
  * **Content Management:** Storing blog posts, comments, and media in a social media app.
  * **Real-Time Analytics:** Collecting and analyzing user behavior data for personalized content delivery.

---

## Blob Storage

### Overview

**Blob Storage** refers to storing large amounts of unstructured data, such as images, videos, audio, and documents.
**Providers** Amazon S3, Azure Blob Storage, and Google Cloud Storage

### Mobile Use Cases

* **Media Storage:** Apps like Instagram or TikTok use blob storage to store and retrieve user-uploaded images and videos.
* **Backup and Restore:** Mobile apps use blob storage for backing up app data, documents, or settings.

### Trade-Offs

* **Pros:** Blob storage offers scalability, durability, and low cost for large volumes of data.
* **Cons:** Not suitable for complex querying or transactional data, as it's primarily used for unstructured data storage.

## Trade-Offs between SQL and NoSQL

* **SQL Pros:** Strong consistency, complex queries, and data integrity.
* **SQL Cons:** Rigid schema design, scalability challenges with large datasets.

* **NoSQL Pros:** Flexibility, scalability, and ease of handling unstructured data.
* **NoSQL Cons:** Less consistency, complex querying can be challenging.

---

### Caching

**Caching** is a technique used to store copies of frequently accessed data in a temporary storage area, known as a cache, to improve data retrieval speeds and reduce latency. In iOS mobile development, caching is crucial for enhancing performance, minimizing network usage, and providing a smoother user experience.

#### FIFO (First In, First Out)

**Definition:** FIFO is a simple caching strategy where the oldest data is removed first when the cache reaches its maximum size. It follows the principle that the first item added to the cache will be the first one to be removed.

#### Pros of FIFO

* **Simplicity:** Easy to implement and understand.
* **Predictability:** The order of eviction is fixed and predictable.

#### Cons of FIFO

* **Inefficiency:** Does not consider the frequency or recency of data usage, which can lead to suboptimal cache performance.

#### FIFO Use Cases

* **News Articles:** Caching the most recent news articles where new articles replace the oldest in the cache, assuming users are more interested in the latest news.
* **Photo Galleries:** Storing a fixed number of recently viewed images, with older images being removed first as new ones are accessed.

#### LRU (Least Recently Used)

**Definition:** LRU is a caching strategy that removes the least recently accessed data when the cache reaches its capacity. It assumes that data accessed recently will likely be accessed again soon.

#### Pros of LRU

* **Efficiency:** Better cache performance for data with temporal locality, where recently accessed items are more likely to be reused.
* **Adaptive:** Adjusts automatically based on access patterns.

#### Cons of LRU

* **Complexity:** Requires tracking the access history of cached items, which can add overhead.

#### LRU Use Cases

* **User Profiles:** Caching user profiles that are frequently accessed and updated, ensuring that profiles viewed recently are readily available.
* **Music Streaming:** Keeping recently played songs in the cache, allowing for quick replay without needing to re-fetch from the network.

#### LFU (Least Frequently Used)

**Definition:** LFU is a caching strategy that removes the least frequently accessed data when the cache is full. It prioritizes keeping data that is accessed more often.

#### Pros of LFU

* **Optimal for Frequency:** Efficient for data accessed with high frequency over time.
* **Predictive:** Keeps items that are genuinely popular or frequently needed.

#### Cons of LFU

* **Complexity:** Requires tracking the frequency of access for each cached item.
* **Staleness:** Frequently accessed items may become stale if they are not updated.

#### LFU Use Cases

* **App Icons:** Caching icons for apps or features that are frequently used, such as favorite tools or settings, ensuring they load quickly.
* **Popular Articles:** Storing articles or content pieces that are accessed often, such as a frequently referenced help guide or FAQ section.

---

### CDN (Content Delivery Network)

**Definition:** A CDN is a distributed network of servers designed to deliver content efficiently by caching it closer to the user's location. CDNs are used to distribute static content such as images, stylesheets, and scripts across multiple geographical locations to reduce latency and improve load times.

**Blob storage can be integrated with CDNs to improve content delivery performance.**

**Providers:** Akamai, Cloudflare, Amazon CloudFront

#### Pros of a CDN

* **Reduced Latency:** Decreases the distance data must travel, resulting in faster load times for end users.
* **Scalability:** Can handle large volumes of traffic by distributing the load across multiple servers.
* **Reliability:** Provides redundancy and failover capabilities, ensuring content availability even during server failures.

#### Cons of a CDN

* **Cost:** Using a CDN can be expensive, especially for high-traffic applications.
* **Complexity:** Requires integration and management to ensure content is correctly distributed and cached.

#### CDN Use Cases

* **Media Streaming:** Delivering video or audio content to users across different regions.
* **Static Website Content:** Serving images, CSS files, and JavaScript libraries to improve website performance.

#### CDN Mobile Implications

* **Faster App Load Times:** By using a CDN, mobile apps can load resources faster, improving the overall user experience.
* **Reduced Data Consumption:** Efficient caching reduces the need for repeated data downloads, saving bandwidth for users.
* **Improved Availability:** CDNs provide redundancy, ensuring that content is available even during server outages.

## High Level Diagram

![Getting Started](/System%20Design/iOSDesign.png)
