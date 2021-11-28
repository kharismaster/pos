import 'package:flutter/material.dart';
import 'package:pos/configs/api_url.dart';
import 'package:pos/models/auth_model.dart';
import 'package:pos/models/profit_lost_model.dart';
import 'package:http/http.dart' as http;
import 'package:pos/utils/user_preferences.dart';

class ProfitLostProvider with ChangeNotifier {
  ProfitLost _profitLost = ProfitLost(
      totalPurchaseShippingCharge: '0',
      totalSellShippingCharge: '0',
      totalPurchaseAdditionalExpense: '0',
      totalTransferShippingCharges: '0',
      openingStock: '0',
      closingStock: '0',
      totalPurchase: '0',
      totalPurchaseDiscount: '0',
      totalPurchaseReturn: '0',
      totalSell: '0',
      totalSellDiscount: '0',
      totalSellReturn: '0',
      totalSellRoundOff: '0',
      totalExpense: 0,
      totalAdjustment: '0',
      totalRecovered: '0',
      totalRewardAmount: '0',
      leftSideModuleData: [
        LeftSideModuleDatum(
            value: 0, label: 'Total Penggajian', addToNetProfit: true),
        LeftSideModuleDatum(
            value: 0, label: 'Total Biaya Produksi', addToNetProfit: true),
      ],
      rightSideModuleData: [],
      netProfit: 0.0,
      grossProfit: 0.0,
      totalSellBySubtype: []);

  ProfitLost get profitLost => _profitLost;

  Future<void> fetchAndSetData() async {
    Auth auth = await UserPreferences().getAuth();
    String token = auth.accessToken.toString();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final url = Uri.parse(ApiUrl.profitLostReport+'?location_id=1&start_date=2021-11-13&end_date=2021-11-13&user_id=2');

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final result = profitLostDataFromJson(response.body);
        _profitLost = result.data;
        // print('opening stock: '+ _profitLost.openingStock);
        notifyListeners();
      } else {
        // print('opening stock: GAGAL');
        notifyListeners();
      }
    } catch (error) {
      // print(error);
      rethrow;
    }
  }
}
