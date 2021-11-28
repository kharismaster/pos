
import 'package:flutter/cupertino.dart';
import 'package:pos/configs/api_url.dart';
import 'package:pos/models/auth_model.dart';
import 'package:pos/models/business_detail_model.dart';
import 'package:pos/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class BusinessDetailsProvider with ChangeNotifier {
  BusinessDetail _businessDetails = BusinessDetail(
    id: 0,
    name: 'Pos APPTren',
    currencyId: 54,
    startDate: DateTime(2019 - 07 - 07),
    taxNumber1: null,
    taxLabel1: null,
    taxNumber2: null,
    taxLabel2: null,
    codeLabel1: null,
    code1: null,
    codeLabel2: null,
    code2: null,
    defaultSalesTax: null,
    defaultProfitPercent: 10,
    ownerId: 0,
    timeZone: "Asia/Jakarta",
    fyStartMonth: 1,
    accountingMethod: "fifo",
    defaultSalesDiscount: "0.0000",
    sellPriceTax: "includes",
    logo:"",
    skuPrefix: "POS",
    enableProductExpiry: 1,
    expiryType: "add_expiry",
    onProductExpiry: "stop_selling",
    stopSellingBefore: 2,
    enableTooltip: 1,
    purchaseInDiffCurrency: 0,
    purchaseCurrencyId: null,
    pExchangeRate: "1.000",
    transactionEditDays: 30,
    stockExpiryAlertDays: 30,
    keyboardShortcuts: KeyboardShortcuts(
        pos: Pos(
      expressCheckout: 'shift+e',
      payNCkeckout: 'shift+p',
      draft: 'shift+d',
      cancel: '"shift+c"',
      recentProductQuantity: 'f2',
      editDiscount: 'shift+i',
      editOrderTax: 'shift+t',
      addPaymentRow: 'shift+r',
      finalizePayment: 'shift+f',
      addNewProduct: 'f4',
    )),
    posSettings: PosSettings(
      enableMsp: '1',
      showCreditSaleButton: '1',
      disablePayCheckout: 0,
      disableDraft: 0,
      disableExpressCheckout: 0,
      hideProductSuggestion: 0,
      hideRecentTrans: 0,
      disableDiscount: 0,
      disableOrderTax: 0,
      isPosSubtotalEditable: 0,
    ),
    weighingScaleSetting: null,
    manufacturingSettings: null,
    essentialsSettings: null,
    woocommerceSkippedOrders: null,
    woocommerceWhOcSecret: 'woocommerceWhOcSecret',
    woocommerceWhOuSecret: 'woocommerceWhOuSecret',
    woocommerceWhOdSecret: 'woocommerceWhOdSecret',
    woocommerceWhOrSecret: 'woocommerceWhOrSecret',
    enableBrand: 1,
    enableCategory: 2,
    enableSubCategory: 3,
    enablePriceTax: 0,
    enablePurchaseStatus: 1,
    enableLotNumber: 0,
    defaultUnit: 1,
    enableSubUnits: 1,
    enableRacks: 0,
    enableRow: 0,
    enablePosition: 0,
    enableEditingProductFromPurchase: 1,
    salesCmsnAgnt: null,
    itemAdditionMethod: 1,
    enableInlineTax: 0,
    currencySymbolPlacement: 'before',
    enabledModules: ["account", "subscription", "booking"],
    dateFormat: "d-m-Y",
    timeFormat: '24',
    refNoPrefixes: RefNoPrefixes(
        purchase: 'PB',
        purchaseReturn: 'Rb',
        stockTransfer: 'ST',
        stockAdjustment: "SA",
        sellReturn: 'CN',
        expense: 'EP',
        contacts: 'CO',
        purchasePayment: 'PP',
        sellPayment: 'PJL',
        expensePayment: null,
        businessLocation: 'BL',
        username: null,
        subscription: null),
    themeColor: "blue-light",
    createdBy: null,
    enableRp: 1,
    rpName: 'POIN MERDEKA',
    amountForUnitRp: '1.0000',
    minOrderTotalForRp: '100000.0000',
    maxRpPerOrder: 10,
    redeemAmountPerUnitRp: '1000.0000',
    minOrderTotalForRedeem: '1.0000',
    minRedeemPoint: 10,
    maxRedeemPoint: 100000,
    rpExpiryPeriod: 3,
    rpExpiryType: 'month',
    emailSettings: EmailSettings(
        mailDriver: 'smtp',
        mailHost: null,
        mailPort: null,
        mailUsername: 'admin',
        mailPassword: 'admin',
        mailEncryption: null,
        mailFromAddress: null,
        mailFromName: 'admin'),
    smsSettings: SmsSettings(
        url: null,
        sendToParamName: "Kepada",
        msgParamName: 'text',
        requestMethod: 'post',
        param1: null,
        paramVal1: null,
        param2: null,
        paramVal2: null,
        param3: null,
        paramVal3: null,
        param4: null,
        paramVal4: null,
        param5: null,
        paramVal5: null,
        param6: null,
        paramVal6: null,
        param7: null,
        paramVal7: null,
        param8: null,
        paramVal8: null,
        param9: null,
        paramVal9: null,
        param10: null,
        paramVal10: null),
    customLabels: CustomLabels(
        payments:
            Payments(customPay1: null, customPay2: null, customPay3: null)),
    commonSettings: CommonSettings(defaultDatatablePageEntries: '25'),
    isActive: 1,
    createdAt: DateTime(2019,08,05),
    updatedAt: DateTime(2019,08,05),
    locations: [Location(
      id: 1,
      businessId: 0,
      locationId: 'lokasi',
      name: 'Bisnis',
      landmark: 'landmark',
      country: 'Indonesia',
      state: 'Provinsi',
      city: 'Kota',
      zipCode: '000000',
      invoiceSchemeId: 2,
      invoiceLayoutId: 1,
      saleInvoiceLayoutId: 1,
      sellingPriceGroupId: 1,
      printReceiptOnInvoice: 1,
      receiptPrinterType: 'browser',
      printerId: null,
      mobile: '0000 12345',
      alternateNumber: '0000 112233',
      email: 'null',
      website: 'website',
      featuredProducts: null,
      isActive: 1,
      defaultPaymentAccounts: DefaultPaymentAccounts(cash: BankTransfer(isEnabled: '1', account: '1'), card: BankTransfer(isEnabled: '1', account: '2'), cheque: BankTransfer(isEnabled: '1', account: '2'), bankTransfer: BankTransfer(isEnabled: '1', account: '2'), other: CustomPay1(account: null), customPay1: CustomPay1(account: null), customPay2: CustomPay1(account: null), customPay3: CustomPay1(account: null),),
      customField1: null,
      customField2: null,
      customField3: null,
      customField4: null,
      deletedAt: null,
      createdAt: DateTime(2019-08-05),
      updatedAt: DateTime(2019-08-05),
    ),],
    currency: Currency(id: 54, country: 'Indonesia', currency: 'Rupiah', code: 'IDR', symbol: 'Rp', thousandSeparator: ',', decimalSeparator: '.', createdAt: null, updatedAt: null),
    printers: [],
  );

  BusinessDetail get businessDetails => _businessDetails;

  Future<void> fetchAndSetData() async {
    Auth auth = await UserPreferences().getAuth();
    String token = auth.accessToken.toString();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final url = Uri.parse(ApiUrl.businessDetails);

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final result = businessDataFromJson(response.body);
        _businessDetails = result.data;
        // print(result.data.logo);
        // _businessDetails = result.data[0];
        // print(_businessDetails);
        /* 
        if(req == 'refresh'){
          _items = result.data;
          // print('Halaman: $_page');
        } else if( req == 'next') {
          _items.addAll(result.data);
          // print('Halaman next: $_page'); 
        }*/
        notifyListeners();
      } else {
        notifyListeners();
      }
    } catch (error) {
      // print(error);
      rethrow;
    }
  } // fetchAndSetData

} // ENDCLASS