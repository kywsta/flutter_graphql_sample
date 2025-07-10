class NetworkConstants {
  static const String _http = 'http://';
  static const String _ws = 'ws://';
  static const String _base = '10.0.87.19:3000';
  static const String baseUrl = '$_http$_base';
  static const String baseWsUrl = '$_ws$_base';
  static const String authApi = '$baseUrl/auth';
  static const String graphqlEndpoint = '$baseUrl/graphql';
  static const String graphqlSubscriptionEndpoint = '$baseWsUrl/graphql';


  static const String login = '$authApi/login';
  static const String register = '$authApi/register';
}