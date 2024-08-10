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

- What search criteria can users use to find accommodations or flights?
- What information/media is shown in search results?
- How do users make bookings, and what payment methods are available with secure mobile transactions?
- Can users save favorite listings?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Travel Booking (e.g., Airbnb, Skyscanner)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/search` - Search for available accommodations or flights.
    - `POST /api/bookings` - Create a booking.
    - `GET /api/bookings/{id}` - Retrieve booking details.

- **GraphQL + HTTP**:
  - **Use Case**: Enables complex search queries that include filters for location, price, and amenities. Supports dynamic queries for customizing search results and user preferences.
  - **Query Example**:

    ```graphql
    {
      search(location: "New York", checkIn: "2024-08-01", checkOut: "2024-08-10") {
        hotels {
          name
          price
          availability
        }
      }
    }
    ```

- **WebSocket**:
  - Use for real-time updates on booking availability or price changes.
  - Example: Subscribe to `/ws/bookings/{userId}` for live booking updates.

- **SSE**:
  - Use for continuous updates on booking status, travel alerts, or promotional offers.
  - Endpoint: `/sse/bookings/alerts` for real-time notifications.

- **App-Side Storage:**
  - **Key-Value Storage**: Store user settings like currency and language preferences.
  - **Database/ORM**: Use Core Data for caching booking details and search results.
  - **Secure Storage**: Secure payment information in the Keychain.
  - **Cache**:
    - **LRU**: Cache recent searches and bookings for easy retrieval.
    - **LFU**: Cache frequently searched destinations or accommodations.

- **Backend Storage:**
  - **SQL and NoSQL**: SQL for bookings and transactions, NoSQL for user reviews and dynamic pricing.

- **Pagination:**
  - **Page-based**: Used for displaying search results and listings.

- **Real-Time Data and Updates:**
  - **WebSocket**: For updates on booking availability or price changes.
  - **SSE**: Stream travel alerts or promotional offers.
  - **HTTP Polling**: Used for checking last-minute availability or updates.

## High Level Diagram

![Getting Started](iOSDesign.png)
