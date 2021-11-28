// To parse this JSON data, do
//
//     final businessData = businessDataFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

BusinessData businessDataFromJson(String str) => BusinessData.fromJson(json.decode(str));

String businessDataToJson(BusinessData data) => json.encode(data.toJson());

class BusinessData {
    BusinessData({
        required this.data,
    });

    BusinessDetail data;

    factory BusinessData.fromJson(Map<String, dynamic> json) => BusinessData(
        data: BusinessDetail.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class BusinessDetail {
    BusinessDetail({
        required this.id,
        required this.name,
        required this.currencyId,
        required this.startDate,
        required this.taxNumber1,
        required this.taxLabel1,
        required this.taxNumber2,
        required this.taxLabel2,
        required this.codeLabel1,
        required this.code1,
        required this.codeLabel2,
        required this.code2,
        required this.defaultSalesTax,
        required this.defaultProfitPercent,
        required this.ownerId,
        required this.timeZone,
        required this.fyStartMonth,
        required this.accountingMethod,
        required this.defaultSalesDiscount,
        required this.sellPriceTax,
        required this.logo,
        required this.skuPrefix,
        required this.enableProductExpiry,
        required this.expiryType,
        required this.onProductExpiry,
        required this.stopSellingBefore,
        required this.enableTooltip,
        required this.purchaseInDiffCurrency,
        required this.purchaseCurrencyId,
        required this.pExchangeRate,
        required this.transactionEditDays,
        required this.stockExpiryAlertDays,
        required this.keyboardShortcuts,
        required this.posSettings,
        required this.weighingScaleSetting,
        required this.manufacturingSettings,
        required this.essentialsSettings,
        required this.woocommerceSkippedOrders,
        required this.woocommerceWhOcSecret,
        required this.woocommerceWhOuSecret,
        required this.woocommerceWhOdSecret,
        required this.woocommerceWhOrSecret,
        required this.enableBrand,
        required this.enableCategory,
        required this.enableSubCategory,
        required this.enablePriceTax,
        required this.enablePurchaseStatus,
        required this.enableLotNumber,
        required this.defaultUnit,
        required this.enableSubUnits,
        required this.enableRacks,
        required this.enableRow,
        required this.enablePosition,
        required this.enableEditingProductFromPurchase,
        required this.salesCmsnAgnt,
        required this.itemAdditionMethod,
        required this.enableInlineTax,
        required this.currencySymbolPlacement,
        required this.enabledModules,
        required this.dateFormat,
        required this.timeFormat,
        required this.refNoPrefixes,
        required this.themeColor,
        required this.createdBy,
        required this.enableRp,
        required this.rpName,
        required this.amountForUnitRp,
        required this.minOrderTotalForRp,
        required this.maxRpPerOrder,
        required this.redeemAmountPerUnitRp,
        required this.minOrderTotalForRedeem,
        required this.minRedeemPoint,
        required this.maxRedeemPoint,
        required this.rpExpiryPeriod,
        required this.rpExpiryType,
        required this.emailSettings,
        required this.smsSettings,
        required this.customLabels,
        required this.commonSettings,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
        required this.locations,
        required this.currency,
        required this.printers,
    });

    int id;
    String name;
    int currencyId;
    DateTime startDate;
    dynamic taxNumber1;
    dynamic taxLabel1;
    dynamic taxNumber2;
    dynamic taxLabel2;
    dynamic codeLabel1;
    dynamic code1;
    dynamic codeLabel2;
    dynamic code2;
    dynamic defaultSalesTax;
    int defaultProfitPercent;
    int ownerId;
    String timeZone;
    int fyStartMonth;
    String accountingMethod;
    String defaultSalesDiscount;
    String sellPriceTax;
    String logo;
    String skuPrefix;
    int enableProductExpiry;
    String expiryType;
    String onProductExpiry;
    int stopSellingBefore;
    int enableTooltip;
    int purchaseInDiffCurrency;
    dynamic purchaseCurrencyId;
    String pExchangeRate;
    int transactionEditDays;
    int stockExpiryAlertDays;
    KeyboardShortcuts keyboardShortcuts;
    PosSettings posSettings;
    dynamic weighingScaleSetting;
    dynamic manufacturingSettings;
    dynamic essentialsSettings;
    dynamic woocommerceSkippedOrders;
    String woocommerceWhOcSecret;
    String woocommerceWhOuSecret;
    String woocommerceWhOdSecret;
    String woocommerceWhOrSecret;
    int enableBrand;
    int enableCategory;
    int enableSubCategory;
    int enablePriceTax;
    int enablePurchaseStatus;
    int enableLotNumber;
    int defaultUnit;
    int enableSubUnits;
    int enableRacks;
    int enableRow;
    int enablePosition;
    int enableEditingProductFromPurchase;
    dynamic salesCmsnAgnt;
    int itemAdditionMethod;
    int enableInlineTax;
    String currencySymbolPlacement;
    List<String> enabledModules;
    String dateFormat;
    String timeFormat;
    RefNoPrefixes refNoPrefixes;
    String themeColor;
    dynamic createdBy;
    int enableRp;
    String rpName;
    String amountForUnitRp;
    String minOrderTotalForRp;
    int maxRpPerOrder;
    String redeemAmountPerUnitRp;
    String minOrderTotalForRedeem;
    int minRedeemPoint;
    int maxRedeemPoint;
    int rpExpiryPeriod;
    String rpExpiryType;
    EmailSettings emailSettings;
    SmsSettings smsSettings;
    CustomLabels customLabels;
    CommonSettings commonSettings;
    int isActive;
    DateTime createdAt;
    DateTime updatedAt;
    List<Location> locations;
    Currency currency;
    List<dynamic> printers;

    factory BusinessDetail.fromJson(Map<String, dynamic> json) => BusinessDetail(
        id: json["id"],
        name: json["name"],
        currencyId: json["currency_id"],
        startDate: DateTime.parse(json["start_date"]),
        taxNumber1: json["tax_number_1"],
        taxLabel1: json["tax_label_1"],
        taxNumber2: json["tax_number_2"],
        taxLabel2: json["tax_label_2"],
        codeLabel1: json["code_label_1"],
        code1: json["code_1"],
        codeLabel2: json["code_label_2"],
        code2: json["code_2"],
        defaultSalesTax: json["default_sales_tax"],
        defaultProfitPercent: json["default_profit_percent"],
        ownerId: json["owner_id"],
        timeZone: json["time_zone"],
        fyStartMonth: json["fy_start_month"],
        accountingMethod: json["accounting_method"],
        defaultSalesDiscount: json["default_sales_discount"],
        sellPriceTax: json["sell_price_tax"],
        logo: json["logo"],
        skuPrefix: json["sku_prefix"],
        enableProductExpiry: json["enable_product_expiry"],
        expiryType: json["expiry_type"],
        onProductExpiry: json["on_product_expiry"],
        stopSellingBefore: json["stop_selling_before"],
        enableTooltip: json["enable_tooltip"],
        purchaseInDiffCurrency: json["purchase_in_diff_currency"],
        purchaseCurrencyId: json["purchase_currency_id"],
        pExchangeRate: json["p_exchange_rate"],
        transactionEditDays: json["transaction_edit_days"],
        stockExpiryAlertDays: json["stock_expiry_alert_days"],
        keyboardShortcuts: KeyboardShortcuts.fromJson(json["keyboard_shortcuts"]),
        posSettings: PosSettings.fromJson(json["pos_settings"]),
        weighingScaleSetting: json["weighing_scale_setting"],
        manufacturingSettings: json["manufacturing_settings"],
        essentialsSettings: json["essentials_settings"],
        woocommerceSkippedOrders: json["woocommerce_skipped_orders"],
        woocommerceWhOcSecret: json["woocommerce_wh_oc_secret"],
        woocommerceWhOuSecret: json["woocommerce_wh_ou_secret"],
        woocommerceWhOdSecret: json["woocommerce_wh_od_secret"],
        woocommerceWhOrSecret: json["woocommerce_wh_or_secret"],
        enableBrand: json["enable_brand"],
        enableCategory: json["enable_category"],
        enableSubCategory: json["enable_sub_category"],
        enablePriceTax: json["enable_price_tax"],
        enablePurchaseStatus: json["enable_purchase_status"],
        enableLotNumber: json["enable_lot_number"],
        defaultUnit: json["default_unit"],
        enableSubUnits: json["enable_sub_units"],
        enableRacks: json["enable_racks"],
        enableRow: json["enable_row"],
        enablePosition: json["enable_position"],
        enableEditingProductFromPurchase: json["enable_editing_product_from_purchase"],
        salesCmsnAgnt: json["sales_cmsn_agnt"],
        itemAdditionMethod: json["item_addition_method"],
        enableInlineTax: json["enable_inline_tax"],
        currencySymbolPlacement: json["currency_symbol_placement"],
        enabledModules: List<String>.from(json["enabled_modules"].map((x) => x)),
        dateFormat: json["date_format"],
        timeFormat: json["time_format"],
        refNoPrefixes: RefNoPrefixes.fromJson(json["ref_no_prefixes"]),
        themeColor: json["theme_color"],
        createdBy: json["created_by"],
        enableRp: json["enable_rp"],
        rpName: json["rp_name"],
        amountForUnitRp: json["amount_for_unit_rp"],
        minOrderTotalForRp: json["min_order_total_for_rp"],
        maxRpPerOrder: json["max_rp_per_order"],
        redeemAmountPerUnitRp: json["redeem_amount_per_unit_rp"],
        minOrderTotalForRedeem: json["min_order_total_for_redeem"],
        minRedeemPoint: json["min_redeem_point"],
        maxRedeemPoint: json["max_redeem_point"],
        rpExpiryPeriod: json["rp_expiry_period"],
        rpExpiryType: json["rp_expiry_type"],
        emailSettings: EmailSettings.fromJson(json["email_settings"]),
        smsSettings: SmsSettings.fromJson(json["sms_settings"]),
        customLabels: CustomLabels.fromJson(json["custom_labels"]),
        commonSettings: CommonSettings.fromJson(json["common_settings"]),
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
        currency: Currency.fromJson(json["currency"]),
        printers: List<dynamic>.from(json["printers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency_id": currencyId,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "tax_number_1": taxNumber1,
        "tax_label_1": taxLabel1,
        "tax_number_2": taxNumber2,
        "tax_label_2": taxLabel2,
        "code_label_1": codeLabel1,
        "code_1": code1,
        "code_label_2": codeLabel2,
        "code_2": code2,
        "default_sales_tax": defaultSalesTax,
        "default_profit_percent": defaultProfitPercent,
        "owner_id": ownerId,
        "time_zone": timeZone,
        "fy_start_month": fyStartMonth,
        "accounting_method": accountingMethod,
        "default_sales_discount": defaultSalesDiscount,
        "sell_price_tax": sellPriceTax,
        "logo": logo,
        "sku_prefix": skuPrefix,
        "enable_product_expiry": enableProductExpiry,
        "expiry_type": expiryType,
        "on_product_expiry": onProductExpiry,
        "stop_selling_before": stopSellingBefore,
        "enable_tooltip": enableTooltip,
        "purchase_in_diff_currency": purchaseInDiffCurrency,
        "purchase_currency_id": purchaseCurrencyId,
        "p_exchange_rate": pExchangeRate,
        "transaction_edit_days": transactionEditDays,
        "stock_expiry_alert_days": stockExpiryAlertDays,
        "keyboard_shortcuts": keyboardShortcuts.toJson(),
        "pos_settings": posSettings.toJson(),
        "weighing_scale_setting": weighingScaleSetting,
        "manufacturing_settings": manufacturingSettings,
        "essentials_settings": essentialsSettings,
        "woocommerce_skipped_orders": woocommerceSkippedOrders,
        "woocommerce_wh_oc_secret": woocommerceWhOcSecret,
        "woocommerce_wh_ou_secret": woocommerceWhOuSecret,
        "woocommerce_wh_od_secret": woocommerceWhOdSecret,
        "woocommerce_wh_or_secret": woocommerceWhOrSecret,
        "enable_brand": enableBrand,
        "enable_category": enableCategory,
        "enable_sub_category": enableSubCategory,
        "enable_price_tax": enablePriceTax,
        "enable_purchase_status": enablePurchaseStatus,
        "enable_lot_number": enableLotNumber,
        "default_unit": defaultUnit,
        "enable_sub_units": enableSubUnits,
        "enable_racks": enableRacks,
        "enable_row": enableRow,
        "enable_position": enablePosition,
        "enable_editing_product_from_purchase": enableEditingProductFromPurchase,
        "sales_cmsn_agnt": salesCmsnAgnt,
        "item_addition_method": itemAdditionMethod,
        "enable_inline_tax": enableInlineTax,
        "currency_symbol_placement": currencySymbolPlacement,
        "enabled_modules": List<dynamic>.from(enabledModules.map((x) => x)),
        "date_format": dateFormat,
        "time_format": timeFormat,
        "ref_no_prefixes": refNoPrefixes.toJson(),
        "theme_color": themeColor,
        "created_by": createdBy,
        "enable_rp": enableRp,
        "rp_name": rpName,
        "amount_for_unit_rp": amountForUnitRp,
        "min_order_total_for_rp": minOrderTotalForRp,
        "max_rp_per_order": maxRpPerOrder,
        "redeem_amount_per_unit_rp": redeemAmountPerUnitRp,
        "min_order_total_for_redeem": minOrderTotalForRedeem,
        "min_redeem_point": minRedeemPoint,
        "max_redeem_point": maxRedeemPoint,
        "rp_expiry_period": rpExpiryPeriod,
        "rp_expiry_type": rpExpiryType,
        "email_settings": emailSettings.toJson(),
        "sms_settings": smsSettings.toJson(),
        "custom_labels": customLabels.toJson(),
        "common_settings": commonSettings.toJson(),
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "currency": currency.toJson(),
        "printers": List<dynamic>.from(printers.map((x) => x)),
    };
}

class CommonSettings {
    CommonSettings({
        required this.defaultDatatablePageEntries,
    });

    String defaultDatatablePageEntries;

    factory CommonSettings.fromJson(Map<String, dynamic> json) => CommonSettings(
        defaultDatatablePageEntries: json["default_datatable_page_entries"],
    );

    Map<String, dynamic> toJson() => {
        "default_datatable_page_entries": defaultDatatablePageEntries,
    };
}

class Currency {
    Currency({
        required this.id,
        required this.country,
        required this.currency,
        required this.code,
        required this.symbol,
        required this.thousandSeparator,
        required this.decimalSeparator,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String country;
    String currency;
    String code;
    String symbol;
    String thousandSeparator;
    String decimalSeparator;
    dynamic createdAt;
    dynamic updatedAt;

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        country: json["country"],
        currency: json["currency"],
        code: json["code"],
        symbol: json["symbol"],
        thousandSeparator: json["thousand_separator"],
        decimalSeparator: json["decimal_separator"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "currency": currency,
        "code": code,
        "symbol": symbol,
        "thousand_separator": thousandSeparator,
        "decimal_separator": decimalSeparator,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class CustomLabels {
    CustomLabels({
        required this.payments,
    });

    Payments payments;

    factory CustomLabels.fromJson(Map<String, dynamic> json) => CustomLabels(
        payments: Payments.fromJson(json["payments"]),
    );

    Map<String, dynamic> toJson() => {
        "payments": payments.toJson(),
    };
}

class Payments {
    Payments({
        required this.customPay1,
        required this.customPay2,
        required this.customPay3,
    });

    dynamic customPay1;
    dynamic customPay2;
    dynamic customPay3;

    factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        customPay1: json["custom_pay_1"],
        customPay2: json["custom_pay_2"],
        customPay3: json["custom_pay_3"],
    );

    Map<String, dynamic> toJson() => {
        "custom_pay_1": customPay1,
        "custom_pay_2": customPay2,
        "custom_pay_3": customPay3,
    };
}

class EmailSettings {
    EmailSettings({
        required this.mailDriver,
        required this.mailHost,
        required this.mailPort,
        required this.mailUsername,
        required this.mailPassword,
        required this.mailEncryption,
        required this.mailFromAddress,
        required this.mailFromName,
    });

    String mailDriver;
    dynamic mailHost;
    dynamic mailPort;
    String mailUsername;
    String mailPassword;
    dynamic mailEncryption;
    dynamic mailFromAddress;
    String mailFromName;

    factory EmailSettings.fromJson(Map<String, dynamic> json) => EmailSettings(
        mailDriver: json["mail_driver"],
        mailHost: json["mail_host"],
        mailPort: json["mail_port"],
        mailUsername: json["mail_username"],
        mailPassword: json["mail_password"],
        mailEncryption: json["mail_encryption"],
        mailFromAddress: json["mail_from_address"],
        mailFromName: json["mail_from_name"],
    );

    Map<String, dynamic> toJson() => {
        "mail_driver": mailDriver,
        "mail_host": mailHost,
        "mail_port": mailPort,
        "mail_username": mailUsername,
        "mail_password": mailPassword,
        "mail_encryption": mailEncryption,
        "mail_from_address": mailFromAddress,
        "mail_from_name": mailFromName,
    };
}

class KeyboardShortcuts {
    KeyboardShortcuts({
        required this.pos,
    });

    Pos pos;

    factory KeyboardShortcuts.fromJson(Map<String, dynamic> json) => KeyboardShortcuts(
        pos: Pos.fromJson(json["pos"]),
    );

    Map<String, dynamic> toJson() => {
        "pos": pos.toJson(),
    };
}

class Pos {
    Pos({
        required this.expressCheckout,
        required this.payNCkeckout,
        required this.draft,
        required this.cancel,
        required this.recentProductQuantity,
        required this.editDiscount,
        required this.editOrderTax,
        required this.addPaymentRow,
        required this.finalizePayment,
        required this.addNewProduct,
    });

    String expressCheckout;
    String payNCkeckout;
    String draft;
    String cancel;
    String recentProductQuantity;
    String editDiscount;
    String editOrderTax;
    String addPaymentRow;
    String finalizePayment;
    String addNewProduct;

    factory Pos.fromJson(Map<String, dynamic> json) => Pos(
        expressCheckout: json["express_checkout"],
        payNCkeckout: json["pay_n_ckeckout"],
        draft: json["draft"],
        cancel: json["cancel"],
        recentProductQuantity: json["recent_product_quantity"],
        editDiscount: json["edit_discount"],
        editOrderTax: json["edit_order_tax"],
        addPaymentRow: json["add_payment_row"],
        finalizePayment: json["finalize_payment"],
        addNewProduct: json["add_new_product"],
    );

    Map<String, dynamic> toJson() => {
        "express_checkout": expressCheckout,
        "pay_n_ckeckout": payNCkeckout,
        "draft": draft,
        "cancel": cancel,
        "recent_product_quantity": recentProductQuantity,
        "edit_discount": editDiscount,
        "edit_order_tax": editOrderTax,
        "add_payment_row": addPaymentRow,
        "finalize_payment": finalizePayment,
        "add_new_product": addNewProduct,
    };
}

class Location {
    Location({
        required this.id,
        required this.businessId,
        required this.locationId,
        required this.name,
        required this.landmark,
        required this.country,
        required this.state,
        required this.city,
        required this.zipCode,
        required this.invoiceSchemeId,
        required this.invoiceLayoutId,
        required this.saleInvoiceLayoutId,
        required this.sellingPriceGroupId,
        required this.printReceiptOnInvoice,
        required this.receiptPrinterType,
        required this.printerId,
        required this.mobile,
        required this.alternateNumber,
        required this.email,
        required this.website,
        required this.featuredProducts,
        required this.isActive,
        required this.defaultPaymentAccounts,
        required this.customField1,
        required this.customField2,
        required this.customField3,
        required this.customField4,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int businessId;
    String locationId;
    String name;
    String landmark;
    String country;
    String state;
    String city;
    String zipCode;
    int invoiceSchemeId;
    int invoiceLayoutId;
    int saleInvoiceLayoutId;
    dynamic sellingPriceGroupId;
    int printReceiptOnInvoice;
    String receiptPrinterType;
    dynamic printerId;
    String mobile;
    String alternateNumber;
    String email;
    String website;
    dynamic featuredProducts;
    int isActive;
    DefaultPaymentAccounts defaultPaymentAccounts;
    dynamic customField1;
    dynamic customField2;
    dynamic customField3;
    dynamic customField4;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        businessId: json["business_id"],
        locationId: json["location_id"],
        name: json["name"],
        landmark: json["landmark"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipCode: json["zip_code"],
        invoiceSchemeId: json["invoice_scheme_id"],
        invoiceLayoutId: json["invoice_layout_id"],
        saleInvoiceLayoutId: json["sale_invoice_layout_id"],
        sellingPriceGroupId: json["selling_price_group_id"],
        printReceiptOnInvoice: json["print_receipt_on_invoice"],
        receiptPrinterType: json["receipt_printer_type"],
        printerId: json["printer_id"],
        mobile: json["mobile"],
        alternateNumber: json["alternate_number"] ?? null,
        email: json["email"] ?? null,
        website: json["website"] ?? null,
        featuredProducts: json["featured_products"],
        isActive: json["is_active"],
        defaultPaymentAccounts: DefaultPaymentAccounts.fromJson(json["default_payment_accounts"]),
        customField1: json["custom_field1"],
        customField2: json["custom_field2"],
        customField3: json["custom_field3"],
        customField4: json["custom_field4"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "location_id": locationId,
        "name": name,
        "landmark": landmark,
        "country": country,
        "state": state,
        "city": city,
        "zip_code": zipCode,
        "invoice_scheme_id": invoiceSchemeId,
        "invoice_layout_id": invoiceLayoutId,
        "sale_invoice_layout_id": saleInvoiceLayoutId,
        "selling_price_group_id": sellingPriceGroupId,
        "print_receipt_on_invoice": printReceiptOnInvoice,
        "receipt_printer_type": receiptPrinterType,
        "printer_id": printerId,
        "mobile": mobile,
        "alternate_number": alternateNumber,
        "email": email,
        "website": website,
        "featured_products": featuredProducts,
        "is_active": isActive,
        "default_payment_accounts": defaultPaymentAccounts.toJson(),
        "custom_field1": customField1,
        "custom_field2": customField2,
        "custom_field3": customField3,
        "custom_field4": customField4,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class DefaultPaymentAccounts {
    DefaultPaymentAccounts({
        required this.cash,
        required this.card,
        required this.cheque,
        required this.bankTransfer,
        required this.other,
        required this.customPay1,
        required this.customPay2,
        required this.customPay3,
    });

    BankTransfer cash;
    BankTransfer card;
    BankTransfer cheque;
    BankTransfer bankTransfer;
    CustomPay1 other;
    CustomPay1 customPay1;
    CustomPay1 customPay2;
    CustomPay1 customPay3;

    factory DefaultPaymentAccounts.fromJson(Map<String, dynamic> json) => DefaultPaymentAccounts(
        cash: BankTransfer.fromJson(json["cash"]),
        card: BankTransfer.fromJson(json["card"]),
        cheque: BankTransfer.fromJson(json["cheque"]),
        bankTransfer: BankTransfer.fromJson(json["bank_transfer"]),
        other: CustomPay1.fromJson(json["other"]),
        customPay1: CustomPay1.fromJson(json["custom_pay_1"]),
        customPay2: CustomPay1.fromJson(json["custom_pay_2"]),
        customPay3: CustomPay1.fromJson(json["custom_pay_3"]),
    );

    Map<String, dynamic> toJson() => {
        "cash": cash.toJson(),
        "card": card.toJson(),
        "cheque": cheque.toJson(),
        "bank_transfer": bankTransfer.toJson(),
        "other": other.toJson(),
        "custom_pay_1": customPay1.toJson(),
        "custom_pay_2": customPay2.toJson(),
        "custom_pay_3": customPay3.toJson(),
    };
}

class BankTransfer {
    BankTransfer({
        required this.isEnabled,
        required this.account,
    });

    String isEnabled;
    String account;

    factory BankTransfer.fromJson(Map<String, dynamic> json) => BankTransfer(
        isEnabled: json["is_enabled"],
        account: json["account"],
    );

    Map<String, dynamic> toJson() => {
        "is_enabled": isEnabled,
        "account": account,
    };
}

class CustomPay1 {
    CustomPay1({
        required this.account,
    });

    dynamic account;

    factory CustomPay1.fromJson(Map<String, dynamic> json) => CustomPay1(
        account: json["account"],
    );

    Map<String, dynamic> toJson() => {
        "account": account,
    };
}

class PosSettings {
    PosSettings({
        required this.enableMsp,
        required this.showCreditSaleButton,
        required this.disablePayCheckout,
        required this.disableDraft,
        required this.disableExpressCheckout,
        required this.hideProductSuggestion,
        required this.hideRecentTrans,
        required this.disableDiscount,
        required this.disableOrderTax,
        required this.isPosSubtotalEditable,
    });

    String enableMsp;
    String showCreditSaleButton;
    int disablePayCheckout;
    int disableDraft;
    int disableExpressCheckout;
    int hideProductSuggestion;
    int hideRecentTrans;
    int disableDiscount;
    int disableOrderTax;
    int isPosSubtotalEditable;

    factory PosSettings.fromJson(Map<String, dynamic> json) => PosSettings(
        enableMsp: json["enable_msp"],
        showCreditSaleButton: json["show_credit_sale_button"],
        disablePayCheckout: json["disable_pay_checkout"],
        disableDraft: json["disable_draft"],
        disableExpressCheckout: json["disable_express_checkout"],
        hideProductSuggestion: json["hide_product_suggestion"],
        hideRecentTrans: json["hide_recent_trans"],
        disableDiscount: json["disable_discount"],
        disableOrderTax: json["disable_order_tax"],
        isPosSubtotalEditable: json["is_pos_subtotal_editable"],
    );

    Map<String, dynamic> toJson() => {
        "enable_msp": enableMsp,
        "show_credit_sale_button": showCreditSaleButton,
        "disable_pay_checkout": disablePayCheckout,
        "disable_draft": disableDraft,
        "disable_express_checkout": disableExpressCheckout,
        "hide_product_suggestion": hideProductSuggestion,
        "hide_recent_trans": hideRecentTrans,
        "disable_discount": disableDiscount,
        "disable_order_tax": disableOrderTax,
        "is_pos_subtotal_editable": isPosSubtotalEditable,
    };
}

class RefNoPrefixes {
    RefNoPrefixes({
        required this.purchase,
        required this.purchaseReturn,
        required this.stockTransfer,
        required this.stockAdjustment,
        required this.sellReturn,
        required this.expense,
        required this.contacts,
        required this.purchasePayment,
        required this.sellPayment,
        required this.expensePayment,
        required this.businessLocation,
        required this.username,
        required this.subscription,
    });

    String purchase;
    String purchaseReturn;
    String stockTransfer;
    String stockAdjustment;
    String sellReturn;
    String expense;
    String contacts;
    String purchasePayment;
    String sellPayment;
    dynamic expensePayment;
    String businessLocation;
    dynamic username;
    dynamic subscription;

    factory RefNoPrefixes.fromJson(Map<String, dynamic> json) => RefNoPrefixes(
        purchase: json["purchase"],
        purchaseReturn: json["purchase_return"],
        stockTransfer: json["stock_transfer"],
        stockAdjustment: json["stock_adjustment"],
        sellReturn: json["sell_return"],
        expense: json["expense"],
        contacts: json["contacts"],
        purchasePayment: json["purchase_payment"],
        sellPayment: json["sell_payment"],
        expensePayment: json["expense_payment"],
        businessLocation: json["business_location"],
        username: json["username"],
        subscription: json["subscription"],
    );

    Map<String, dynamic> toJson() => {
        "purchase": purchase,
        "purchase_return": purchaseReturn,
        "stock_transfer": stockTransfer,
        "stock_adjustment": stockAdjustment,
        "sell_return": sellReturn,
        "expense": expense,
        "contacts": contacts,
        "purchase_payment": purchasePayment,
        "sell_payment": sellPayment,
        "expense_payment": expensePayment,
        "business_location": businessLocation,
        "username": username,
        "subscription": subscription,
    };
}

class SmsSettings {
    SmsSettings({
        required this.url,
        required this.sendToParamName,
        required this.msgParamName,
        required this.requestMethod,
        required this.param1,
        required this.paramVal1,
        required this.param2,
        required this.paramVal2,
        required this.param3,
        required this.paramVal3,
        required this.param4,
        required this.paramVal4,
        required this.param5,
        required this.paramVal5,
        required this.param6,
        required this.paramVal6,
        required this.param7,
        required this.paramVal7,
        required this.param8,
        required this.paramVal8,
        required this.param9,
        required this.paramVal9,
        required this.param10,
        required this.paramVal10,
    });

    dynamic url;
    String sendToParamName;
    String msgParamName;
    String requestMethod;
    dynamic param1;
    dynamic paramVal1;
    dynamic param2;
    dynamic paramVal2;
    dynamic param3;
    dynamic paramVal3;
    dynamic param4;
    dynamic paramVal4;
    dynamic param5;
    dynamic paramVal5;
    dynamic param6;
    dynamic paramVal6;
    dynamic param7;
    dynamic paramVal7;
    dynamic param8;
    dynamic paramVal8;
    dynamic param9;
    dynamic paramVal9;
    dynamic param10;
    dynamic paramVal10;

    factory SmsSettings.fromJson(Map<String, dynamic> json) => SmsSettings(
        url: json["url"],
        sendToParamName: json["send_to_param_name"],
        msgParamName: json["msg_param_name"],
        requestMethod: json["request_method"],
        param1: json["param_1"],
        paramVal1: json["param_val_1"],
        param2: json["param_2"],
        paramVal2: json["param_val_2"],
        param3: json["param_3"],
        paramVal3: json["param_val_3"],
        param4: json["param_4"],
        paramVal4: json["param_val_4"],
        param5: json["param_5"],
        paramVal5: json["param_val_5"],
        param6: json["param_6"],
        paramVal6: json["param_val_6"],
        param7: json["param_7"],
        paramVal7: json["param_val_7"],
        param8: json["param_8"],
        paramVal8: json["param_val_8"],
        param9: json["param_9"],
        paramVal9: json["param_val_9"],
        param10: json["param_10"],
        paramVal10: json["param_val_10"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "send_to_param_name": sendToParamName,
        "msg_param_name": msgParamName,
        "request_method": requestMethod,
        "param_1": param1,
        "param_val_1": paramVal1,
        "param_2": param2,
        "param_val_2": paramVal2,
        "param_3": param3,
        "param_val_3": paramVal3,
        "param_4": param4,
        "param_val_4": paramVal4,
        "param_5": param5,
        "param_val_5": paramVal5,
        "param_6": param6,
        "param_val_6": paramVal6,
        "param_7": param7,
        "param_val_7": paramVal7,
        "param_8": param8,
        "param_val_8": paramVal8,
        "param_9": param9,
        "param_val_9": paramVal9,
        "param_10": param10,
        "param_val_10": paramVal10,
    };
}
