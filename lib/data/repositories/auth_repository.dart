import 'dart:io';

import 'package:recipe/core/client.dart';
import 'package:recipe/core/secure_storage.dart';

import '../models/user_model.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;


  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String password,
  }) async {
    final result = await client.signUp(
      UserModel(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        dateOfBirth: dateOfBirth,
      ),
    );

    return result;
  }

  Future<bool> uploadProfilePhoto(File file) async{
    final result = await client.uploadProfilePhoto(file);
    return result;
  }

  Future<String> login(String login, String password) async {
    final response = await client.genericPostRequest<Map<String, String>>(
      "/auth/login",
      {"login": login, "password": password},
    );
    final jwtToken = response['accessToken'];
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
    await SecureStorage.saveCredentials(login, password);
    await SecureStorage.saveToken(jwtToken!);
    return jwtToken;
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<String?> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials['login'] == null || credentials['password'] == null) {
      return null;
    }

    final response = await client.genericPostRequest<Map<String, String>>(
      "/auth/login",
      {"login": credentials['login'], "password": credentials['password']},
    );

    final jwtToken = response['accessToken'];
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwtToken!);
    return jwtToken;
  }

  Future<String?> getJwtToken() async {
    return await SecureStorage.getToken();
  }
}
