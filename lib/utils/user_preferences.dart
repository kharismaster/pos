import 'package:pos/models/auth_model.dart';
import 'package:pos/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setInt('userId', user.id);
    prefs.setString('username', user.username);
    prefs.setString('firstName', user.firstName);
    prefs.setString('lastName', user.lastName);
    prefs.setString('email', user.email);
    prefs.setString('contactNo', user.contactNo);
    prefs.setString('userType', user.userType);
    // prefs.setString('token', user.token);
    // prefs.setString('renewal_token', user.renewalToken);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  // Future<User> getUser() async {
  //   final SharedPreferences prefs = await _prefs;

  //   int? userId = prefs.getInt("userId");
  //   String? username = prefs.getString("username");
  //   String? firstName = prefs.getString("firstName");
  //   String? lastName = prefs.getString("lastName");
  //   String? email = prefs.getString("email");
  //   String? contactNo = prefs.getString("phone");
  //   String? userType = prefs.getString("type");
  //   // String? token = prefs.getString("token");
  //   // String? renewalToken = prefs.getString("renewalToken");

  //   return User(
  //       userId: userId!,
  //       name: name!,
  //       email: email!,
  //       phone: phone!,
  //       type: type!,
  //       token: token!,
  //       renewalToken: renewalToken!);
  // }

  void removeUser() async {
    final SharedPreferences prefs = await _prefs;

    prefs.remove('userId');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('phone');
    prefs.remove('type');
    prefs.remove('token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    String? token = prefs.getString("token");
    return token;
  }

  Future<dynamic> getAuth() async {
    final SharedPreferences prefs = await _prefs;
    String? tokenType = prefs.getString('token_type');
    int? expiresIn = prefs.getInt('expires_in');
    String? accessToken = prefs.getString("access_token");
    String? refreshToken = prefs.getString('refresh_token');

    if(accessToken == null) {
      return null;
    }
    return Auth(
      tokenType: tokenType!,
      expiresIn: expiresIn!,
      accessToken: accessToken,
      refreshToken: refreshToken!,
    );
  }

  Future<Auth> saveAuth(Auth auth) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('token_type', auth.tokenType);
    prefs.setInt('expires_in', auth.expiresIn);
    prefs.setString('access_token', auth.accessToken);
    prefs.setString('refresh_token', auth.refreshToken);
    return auth;
  }

  void removeAuth() async {
    final SharedPreferences prefs = await _prefs;

    prefs.remove('token_type');
    prefs.remove('expires_in');
    prefs.remove('access_token');
    prefs.remove('refresh_token');
  }
}//endclass
