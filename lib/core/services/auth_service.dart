import 'package:dio/dio.dart';
import 'package:flutter_graphql_subscription_test/core/constants/network.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final Dio _dio = Dio();
  String? _token;
  Map<String, dynamic>? _user;

  String? get token => _token;
  Map<String, dynamic>? get user => _user;
  bool get isAuthenticated => _token != null;

  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        NetworkConstants.login,
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        _token = response.data['token'];
        _user = response.data['user'];
        return true;
      }
      return false;
    } on DioException catch (e) {
      print('Login error: ${e.message}');
      if (e.response != null) {
        print('Error response: ${e.response?.data}');
      }
      return false;
    }
  }

  Future<bool> register(String username, String password, {String? email}) async {
    try {
      final response = await _dio.post(
        NetworkConstants.register,
        data: {
          'username': username,
          'password': password,
          if (email != null) 'email': email,
        },
      );

      if (response.statusCode == 201) {
        _token = response.data['token'];
        _user = response.data['user'];
        return true;
      }
      return false;
    } on DioException catch (e) {
      print('Register error: ${e.message}');
      if (e.response != null) {
        print('Error response: ${e.response?.data}');
      }
      return false;
    }
  }

  void logout() {
    _token = null;
    _user = null;
  }

  // Get authorization header for API calls
  Map<String, String> get authHeaders {
    if (_token != null) {
      return {'Authorization': 'Bearer $_token'};
    }
    return {};
  }
} 