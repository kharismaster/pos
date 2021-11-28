
import 'package:flutter/material.dart';
import 'package:pos/configs/api_url.dart';
import 'package:pos/models/auth_model.dart';
import 'package:pos/models/cash_register_model.dart';
import 'package:pos/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class CashRegisterProvider with ChangeNotifier {
  List<CashRegister> _cashRegister = [];

  List<CashRegister> get cashRegister {
   return [..._cashRegister];

  }

  Future<void> setAndFetchCashRegister({
    String status = 'open',
    int? userId,
    String? startDate,
    String? endDate,
    int? locationId,
    int perPage = 15,
  }) async {

    // startDate = startDate?? DateTime.now().toString().substring(0,10);
    endDate = endDate?? DateTime.now().toString().substring(0,10);

    Auth auth = await UserPreferences().getAuth();
    String token = auth.accessToken.toString();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // start_date format => 2019-01-01
    final url = Uri.parse(
      ApiUrl.cashRegister +
          '?status=$status' +
          '&user_id=$userId' +
          '&start_date=$startDate' +
          '&end_date=$endDate' +
          '&location_id=$locationId' +
          '&per_page=$perPage',
    );

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final result = cashRegisterDataFromJson(response.body);

        _cashRegister = result.data;
        // print(response.body.toString());

        notifyListeners();
      } else {
        // print('');
        notifyListeners();
      }
    } catch (error) {
      // print(error);
      rethrow;
    }
  }
} // End Class