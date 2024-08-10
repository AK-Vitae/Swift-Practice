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

- What drawing and editing tools are available, and are there templates or components provided?
- Can multiple users edit a design simultaneously, and is there a chat feature?
- How can users organize their designs, and is there a version history?
- What export formats are supported, and how can users share their designs?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Drawing (e.g., Figma, Lucidchart)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/designs` - List designs.
    - `POST /api/designs` - Create a new design.
    - `PUT /api/designs/{id}` - Update a design.

- **GraphQL + HTTP**:
  - **Use Case**: Allows querying for specific design elements, user interactions, and history. Supports complex data models and flexible updates to design content.
  - **Query Example**:

    ```graphql
    {
      design(id: "123") {
        title
        elements {
          type
          properties
        }
      }
    }
    ```

- **WebSocket**:
  - Ideal for real-time rendering and synchronization of design changes.
  - Example: Connect to `/ws/designs/{designId}` for live updates.

- **gRPC**:
  - Use for efficient data transfer and low-latency collaboration in design sessions.
  - Example service: `SyncDesign(DesignRequest) returns (DesignResponse)`

- **App-Side Storage:**
  - **Key-Value Storage**: Store tool settings and preferences.
  - **Database/ORM**: Use Core Data for caching designs and layers.
  - **Secure Storage**: Keep authentication tokens secure in the Keychain
  - **Cache**:
    - **LRU**: Cache recent designs and layers.
    - **LFU**: Cache frequently used design components.
  
- **Backend Storage:**
  - NoSQL: For storing elements and user session data.

- **Pagination**:
  - Not typically used: Designs are loaded as needed based on user activity.

- **Real-Time Data and Updates:**
  - **WebSocket**: For real-time design changes and collaboration.
  - **SSE**: For notifications on shared design updates.
  - **HTTP** Polling: Occasionally used for less frequent updates.

## High Level Diagram

![Getting Started](iOSDesign.png)
