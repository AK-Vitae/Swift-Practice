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

- What controls are available in the video player, such as play, pause, and subtitles, with mobile-friendly UI?
- Can users discover content through browsing or searching?
- Can users create and manage playlists or watchlists?
- Can users interact with content, such as liking, commenting, or sharing?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Video Streaming (e.g., Netflix, YouTube)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/videos` - List videos.
    - `GET /api/videos/{id}` - Retrieve video details.
    - `POST /api/videos/{id}/like` - Like a video.

- **GraphQL + HTTP**:
  - **Use Case**: Provides flexibility for clients to request specific video details, comments, and recommendations. Supports personalized video suggestions and detailed user interaction data.
  - **Query Example**:

    ```graphql
    {
      video(id: "123") {
        title
        url
        duration
        comments {
          user
          text
        }
      }
    }
    ```

- **WebSocket**:
  - Use for real-time interactions, such as live chat during video streams.
  - Example: Connect to `/ws/videos/{videoId}/chat` for live interaction.

- **SSE**:
  - Use for streaming updates on video recommendations or live content changes.
  - Endpoint: `/sse/videos/recommendations` for pushing updates on new uploads.

- **App-Side Storage:**
  - **Key-Value Storage:** Store playback quality and user preferences.
  - **Database/ORM:** Use Core Data for video metadata and watchlists.
  - **Secure Storage:** Securely store subscription details in the Keychain.
  - **Cache**:
    - **LRU**: Cache recently watched video metadata for easy resumption.
    - **FIFO**: Cache video segments for seamless playback.

- **Backend Storage:**
  - **NoSQL:** For metadata and user preferences, with dedicated systems for large video files.

- **Pagination:**
  - **Page-based:** For browsing video catalogs and playlists.

- **Real-Time Data and Updates:**
  - **WebSocket:** For live interactions like chats during video streams.
  - **SSE**: Stream updates on new releases or recommendations.
  - **HTTP Polling:** Not commonly used due to the nature of streaming.

## High Level Diagram

![Getting Started](iOSDesign.png)
