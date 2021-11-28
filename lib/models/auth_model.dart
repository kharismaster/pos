// ignore_for_file: constant_identifier_names

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  LoggedOut
}

class Auth {
  final String tokenType;
  final int expiresIn;
  final String accessToken;
  final String refreshToken;
  // final Status status;

  const Auth({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
    // required this.status,
  });  
}
