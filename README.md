# Flutter GraphQL Subscription Test App

A Flutter application to test GraphQL subscriptions with an Express.js server using Apollo Server, GraphQL, and WebSocket connections.

## Features

- ✅ User authentication (login/logout)
- ✅ JWT token management
- ✅ GraphQL queries for chat data
- ✅ Real-time GraphQL subscriptions support
- ✅ Clean UI for testing purposes

## Prerequisites

1. **Express.js Server**: Make sure your Express.js GraphQL server is running on `http://localhost:3000`
2. **Flutter SDK**: Ensure Flutter is installed and configured
3. **Test User**: Have a registered user in your server database

## Setup Instructions

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Configure Server URL
If your Express.js server is running on a different port or host, update the URLs in:
- `lib/services/auth_service.dart` (line 11): `baseUrl`
- `lib/services/graphql_service.dart` (lines 8-9): `graphqlEndpoint` and `subscriptionEndpoint`

### 3. Run the App
```bash
flutter run
```

## Usage

### 1. Login
- Launch the app
- Enter your username and password (registered in your Express.js server)
- Tap "Login"

### 2. View Chats
- After successful login, you'll see the ChatsScreen
- The app will fetch your chats using GraphQL queries
- Pull to refresh to reload chats

### 3. Test GraphQL Features
- **Queries**: Chat list is loaded using `getUserChats` query
- **Subscriptions**: Ready for `messageAdded` and `typingIndicator` subscriptions
- **Authentication**: JWT token is automatically included in GraphQL requests

## GraphQL Operations Supported

### Queries
- `getUserChats`: Fetch user's chats
- `getChatMessages`: Get messages for a specific chat
- `me`: Get current user info

### Mutations
- `sendMessage`: Send a message to a chat
- `createChat`: Create a new chat
- `addChatMember`: Add member to chat

### Subscriptions
- `messageAdded`: Subscribe to new messages in a chat
- `typingIndicator`: Subscribe to typing indicators

## Architecture

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── chat_models.dart     # Data models (User, Chat, Message, etc.)
├── services/
│   ├── auth_service.dart    # Authentication & token management
│   └── graphql_service.dart # GraphQL client configuration
└── screens/
    ├── login_screen.dart    # Login UI
    └── chats_screen.dart    # Chat list UI with GraphQL integration
```

## Key Components

### AuthService
- Singleton service for authentication
- Handles login/logout
- Stores JWT token in memory
- Provides authentication headers

### GraphQLService
- Configures GraphQL client with HTTP and WebSocket links
- Handles authentication for GraphQL requests
- Supports both queries/mutations and subscriptions
- Auto-reconnection for WebSocket connections

### Screens
- **LoginScreen**: Simple login form with validation
- **ChatsScreen**: Displays user chats with GraphQL Query widget

## Testing GraphQL Subscriptions

To test subscriptions, you can:

1. **Add Subscription Widget**: Use the GraphQL Flutter `Subscription` widget in your chat detail screen
2. **Example Usage**:
```dart
Subscription(
  options: SubscriptionOptions(
    document: gql(GraphQLService.messageAddedSubscription),
    variables: {'chatId': 'your-chat-id'},
  ),
  builder: (result) {
    // Handle subscription data
    if (result.hasException) {
      return Text('Error: ${result.exception}');
    }
    
    if (result.isLoading) {
      return Text('Listening for messages...');
    }
    
    // New message received
    final message = result.data?['messageAdded'];
    // Update your UI accordingly
    
    return YourMessageWidget(message);
  },
)
```

## Troubleshooting

### Common Issues

1. **Connection Refused**
   - Ensure your Express.js server is running on `http://localhost:3000`
   - Check if GraphQL endpoint is accessible at `/graphql`

2. **Authentication Errors**
   - Verify your username/password are correct
   - Check if the user exists in your server database

3. **WebSocket Connection Issues**
   - Ensure your server supports WebSocket connections
   - Check if `graphql-ws` is properly configured on the server

4. **GraphQL Errors**
   - Check server logs for detailed error messages
   - Verify GraphQL schema matches the queries used in the app

### Debug Mode
The app includes console logging for debugging:
- Authentication responses
- GraphQL errors
- WebSocket connection status

## Server Requirements

Your Express.js server should have:
- `/auth/login` endpoint for authentication
- `/graphql` endpoint for GraphQL operations
- WebSocket support for subscriptions
- JWT authentication middleware
- CORS configured for Flutter app

## Next Steps

To extend this app for more comprehensive testing:

1. Add a chat detail screen with message subscriptions
2. Implement message sending functionality
3. Add typing indicator subscriptions
4. Create chat creation functionality
5. Add user management features

This app provides a solid foundation for testing GraphQL subscriptions with your Express.js server!
