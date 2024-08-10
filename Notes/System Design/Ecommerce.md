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

- What information is displayed for each product? Is there any sorting/filtering options?
- What media types are supported on product detail pages?
- How can users manage items in their shopping cart, such as editing quantities or removing items?
- What payment methods are supported during checkout, and is there integration with mobile wallets (e.g., Apple Pay, Google Pay)?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### E-commerce Marketplaces (e.g., Amazon, eBay)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/products` - List products.
    - `GET /api/products/{id}` - Get product details.
    - `POST /api/cart` - Add item to cart.
    - `POST /api/orders` - Place an order.

- **GraphQL + HTTP**:
  - **Use Case**: Allows clients to request specific product details, reviews, and recommendations in a single request. Supports dynamic search and filtering of products based on user preferences.
  - **Query Example**:

    ```graphql
    {
      products(category: "electronics") {
        id
        name
        price
        reviews {
          rating
          comment
        }
      }
    }
    ```

- **WebSocket**:
  - Use for real-time updates on inventory changes or live auctions.
  - Example: Subscribe to `/ws/products/{productId}/updates` for inventory changes.

- **SSE**:
  - Use for streaming updates on order status, shipping notifications, or live product availability.
  - Endpoint: `/sse/orders/{userId}` to push order notifications.

- **App-Side Storage:**
  - **Key-Value Storage**: Store user settings like currency and language preferences.
  - **Database/ORM**: Use Core Data for caching product information and user carts.
  - **Secure Storage**: Securely store payment details in the Keychain.
  - **Cache**:
    - **LRU**: Cache recently viewed products for easy comparison.
    - **LFU**: Cache frequently accessed products or categories.

- **Backend Storage:**
  - **SQL and NoSQL**: SQL for transactional data, NoSQL for user reviews and product recommendations.

- **Pagination:**
  - **Page-based**: Common for browsing products and search results.

- **Real-Time Data and Updates:**
  - **WebSocket**: For real-time updates on inventory changes or auction status.
  - **SSE**: Useful for streaming updates on order status or promotions.
  - **HTTP Polling**: Used for periodic stock checks or price updates.

## High Level Diagram

![Getting Started](iOSDesign.png)
