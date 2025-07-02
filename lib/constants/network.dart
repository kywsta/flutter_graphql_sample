class NetworkConstants {
  static const String baseUrl = 'http://10.0.87.27:3000';
  static const String baseWsUrl = 'ws://10.0.87.27:3000';
  static const String authApi = '$baseUrl/auth';
  static const String graphqlEndpoint = '$baseUrl/graphql';
  static const String graphqlSubscriptionEndpoint = '$baseWsUrl/graphql';


  static const String login = '$authApi/login';
  static const String register = '$authApi/register';
}