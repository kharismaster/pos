
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pos/configs/api_url.dart';
import 'package:pos/models/auth_model.dart';
import 'package:pos/models/products_model.dart';
import 'package:pos/utils/user_preferences.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];


  List<Product> get items {
    return [..._items]; // ... copy of
  }

  int _page = 1;


  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  Future<void> fetchAndSetProducts(String req) async {
    if(req == 'refresh') {
      _page = 1;
    } else {
      _page++;
    }
    
    Auth auth = await UserPreferences().getAuth();
    String token = auth.accessToken.toString();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final url = Uri.parse(ApiUrl.listProducts+'?per_page=10&page=$_page');
    // final url = Uri.https(
    //     'shop-app-bdf57-default-rtdb.asia-southeast1.firebasedatabase.app',
    //     'products.json');
    
    try {
      
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final result = productsDataFromJson(response.body);
        if(req == 'refresh'){
          _items = result.data;
          // print('Halaman: $_page');
        } else if( req == 'next') {
          _items.addAll(result.data);
          // print('Halaman next: $_page');
        }
        notifyListeners();
      } else {
        notifyListeners();
      }

      /* final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      // List<dynamic> output = jsonDecode(response.body);
      final List<Product> loadedProducts = [];
      var a = extractedData['data'];
      print(a.length);
      extractedData.forEach((prodId, prodData) {
        /* loadedProducts.add(Product(
          id: 1,//prodData[prodId]['id'],
          name: prodData['name'] ?? 'Nama Produk',
          sku: prodData['sku'],
          description: prodData['product_description'] ?? 'Ini Deskripsi Produk Sementara',
          // description: prodData['product_description'],
          defaultPurchasePrice: 5000.0,
          // defaultPurchasePrice: double.parse(prodData['price']
          //     ['product_variations']['variations']['default_purchase_price']),
          defaultSellPrice: 6000.0,
          // defaultSellPrice: double.parse(prodData['price']['product_variations']
          //     ['variations']['default_sell_price']),
          imageUrl: prodData['imageUrl'],
          qtyAvailable: 40.0,
          // qtyAvailable: double.parse(prodData['price']['product_variations']
          //     ['variations']['variation_location_details']['qty_available']),
        )); */
      });
      _items = loadedProducts;
      notifyListeners(); */
    } catch (error) {
      // print(error);
      rethrow;
    }
    // return false;
  }
}//endclass
