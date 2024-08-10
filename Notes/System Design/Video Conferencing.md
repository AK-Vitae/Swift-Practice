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

- Is there a calendar option? What options are available for scheduling meetings?
- What participant controls are available during meetings, such as mute or screen sharing, optimized for mobile interfaces?
- Is there chat or file sharing?
- How can hosts manage participants, and are there breakout room features accessible through mobile?

### Non-functional Requirements (Non feature related)

- Data should be highly available and reliable
- Analytics
- Privacy
- OS Support
- Security
- Battery performance
- Localization *
- Push Notifications *

### Video Conferencing (e.g., Zoom, Google Meet)

- **REST + HTTP**:
  - **Endpoints**:
    - `GET /api/meetings` - List meetings.
    - `POST /api/meetings` - Schedule a new meeting.
    - `GET /api/meetings/{id}` - Get meeting details.

- **WebSocket**:
  - Ideal for real-time audio and video streaming with low latency.
  - Example: Connect to `/ws/meetings/{meetingId}` for live interaction.

- **gRPC**:
  - Use for efficient data transfer and synchronization of participant states.
  - Example service: `JoinMeeting(MeetingRequest) returns (MeetingResponse)`

- **App-Side Storage:**
  - **Key-Value Storage**: Store user preferences like meeting settings in UserDefaults.
  - **Database/ORM**: Use Realm to cache meeting data and chat history for offline reference.
  - **Secure Storage**: Secure user credentials and meeting IDs in the Keychain.
  - **Cache**:
    - **LRU**: Cache recent meetings and chat history.
    - **LFU**: Cache frequently accessed contacts.

- **Backend Storage:**
  - **NoSQL**: For storing participant information, meeting metadata, and chat history, allowing for rapid access and scalability.

- **Pagination:**
  - **Not applicable**: Real-time data is streamed, focusing on live interaction rather than browsing through paginated content.

- **Real-Time Data and Updates:**
  - **WebSocket**: Essential for real-time audio and video streaming during meetings.
  - **SSE**: Can be used for streaming participant status updates or meeting notifications.
  - **HTTP Polling**: Generally not used due to the need for continuous, real-time communication.

## High Level Diagram

![Getting Started](iOSDesign.png)
