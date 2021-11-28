// ignore_for_file: unnecessary_getters_setters

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pos/configs/api_url.dart';
import 'package:pos/configs/constants.dart';
import 'package:pos/models/auth_model.dart';
import 'package:pos/models/user_model.dart';
import 'package:pos/utils/user_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.LoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<Map<String, dynamic>> register(
      String email, String username, String password) async {
    final Map<String, dynamic> apiBodyData = {
      'email': email,
      'username': username,
      'password': password,
    };

    return await post(
      Uri.parse(ApiUrl.register),
      body: json.encode(apiBodyData),
      headers: {'Content-Type': 'application/json'},
    ).then(onValue).catchError(onError);
  }

  notify() {
    notifyListeners();
  }

  static Future<Map<String, dynamic>> onValue(Response response) async {
    Map<String, Object> result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    // print(responseData);

    if (response.statusCode == 200) {

      // now we will create a user model
      User authUser = User.fromJson(responseData);

      // now we will create shared preferences and save data
      UserPreferences().saveUser(authUser);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Successfully registered',
        'data': responseData
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String, dynamic> result;

    final Map<String, dynamic> loginData = {
      'grant_type': 'password',
      'client_id': clientId, // set on configs/constants.dart
      'client_secret': clientSecret, // set on configs/Constants.dart
      'username': username,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(
      Uri.parse(ApiUrl.login),
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // print(responseData);

      // var userData = responseData['Content'];

      // User authUser = User.fromJson(userData);
      Auth authUser = Auth(
        tokenType: responseData['token_type'],
        expiresIn: responseData['expires_in'],
        accessToken: responseData['access_token'],
        refreshToken: responseData['refresh_token'],
      );

      UserPreferences().saveAuth(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'auth': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;
  }

  static onError(error) {
    // print('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
