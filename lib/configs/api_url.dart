import 'package:pos/configs/constants.dart';

class ApiUrl {
  static const String baseUrl = siteUrl;
  static const String apiUrl  = baseUrl + '/connector/api/';

  // AUTH
  static const String login = baseUrl + '/oauth/token';
  static const String register = apiUrl + 'register';
  static const forgotPassword = apiUrl + 'forgotPassword';

  // USER
  // [GET] Get the list of user
  static const String listUser = apiUrl + 'user';
  // [GET] Get the loggedin user detail
  static const String currentUser = apiUrl + 'user/loggedin';

  // BUSINESS
  static const String businessDetails = apiUrl + 'business-details';
  static const String profitLostReport = apiUrl + 'profit-loss-report';

  // PRODUCT
  // [GET]
  static const String listProducts = apiUrl + 'product';


  // CASH REGISTER
  static const String cashRegister = apiUrl + 'cash-register';
}