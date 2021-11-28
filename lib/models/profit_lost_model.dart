import 'dart:convert';

ProfitLostData profitLostDataFromJson(String str) => ProfitLostData.fromJson(json.decode(str));

String profitLostDataToJson(ProfitLostData data) => json.encode(data.toJson());

class ProfitLostData {
    ProfitLostData({
        required this.data,
    });

    ProfitLost data;

    factory ProfitLostData.fromJson(Map<String, dynamic> json) => ProfitLostData(
        data: ProfitLost.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class ProfitLost {
    ProfitLost({
        required this.totalPurchaseShippingCharge,
        required this.totalSellShippingCharge,
        required this.totalPurchaseAdditionalExpense,
        required this.totalTransferShippingCharges,
        required this.openingStock,
        required this.closingStock,
        required this.totalPurchase,
        required this.totalPurchaseDiscount,
        required this.totalPurchaseReturn,
        required this.totalSell,
        required this.totalSellDiscount,
        required this.totalSellReturn,
        required this.totalSellRoundOff,
        required this.totalExpense,
        required this.totalAdjustment,
        required this.totalRecovered,
        required this.totalRewardAmount,
        required this.leftSideModuleData,
        required this.rightSideModuleData,
        required this.netProfit,
        required this.grossProfit,
        required this.totalSellBySubtype,
    });

    String totalPurchaseShippingCharge;
    String totalSellShippingCharge;
    String totalPurchaseAdditionalExpense;
    String totalTransferShippingCharges;
    String openingStock;
    String closingStock;
    String totalPurchase;
    String totalPurchaseDiscount;
    String totalPurchaseReturn;
    String totalSell;
    String totalSellDiscount;
    String totalSellReturn;
    String totalSellRoundOff;
    int totalExpense;
    String totalAdjustment;
    String totalRecovered;
    String totalRewardAmount;
    List<LeftSideModuleDatum> leftSideModuleData;
    List<dynamic> rightSideModuleData;
    double netProfit;
    double grossProfit;
    List<dynamic> totalSellBySubtype;

    factory ProfitLost.fromJson(Map<String, dynamic> json) => ProfitLost(
        totalPurchaseShippingCharge: json["total_purchase_shipping_charge"],
        totalSellShippingCharge: json["total_sell_shipping_charge"],
        totalPurchaseAdditionalExpense: json["total_purchase_additional_expense"],
        totalTransferShippingCharges: json["total_transfer_shipping_charges"],
        openingStock: json["opening_stock"],
        closingStock: json["closing_stock"],
        totalPurchase: json["total_purchase"],
        totalPurchaseDiscount: json["total_purchase_discount"],
        totalPurchaseReturn: json["total_purchase_return"],
        totalSell: json["total_sell"],
        totalSellDiscount: json["total_sell_discount"],
        totalSellReturn: json["total_sell_return"],
        totalSellRoundOff: json["total_sell_round_off"],
        totalExpense: json["total_expense"],
        totalAdjustment: json["total_adjustment"],
        totalRecovered: json["total_recovered"],
        totalRewardAmount: json["total_reward_amount"],
        leftSideModuleData: List<LeftSideModuleDatum>.from(json["left_side_module_data"].map((x) => LeftSideModuleDatum.fromJson(x))),
        rightSideModuleData: List<dynamic>.from(json["right_side_module_data"].map((x) => x)),
        netProfit: json["net_profit"].toDouble(),
        grossProfit: json["gross_profit"].toDouble(),
        totalSellBySubtype: List<dynamic>.from(json["total_sell_by_subtype"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "total_purchase_shipping_charge": totalPurchaseShippingCharge,
        "total_sell_shipping_charge": totalSellShippingCharge,
        "total_purchase_additional_expense": totalPurchaseAdditionalExpense,
        "total_transfer_shipping_charges": totalTransferShippingCharges,
        "opening_stock": openingStock,
        "closing_stock": closingStock,
        "total_purchase": totalPurchase,
        "total_purchase_discount": totalPurchaseDiscount,
        "total_purchase_return": totalPurchaseReturn,
        "total_sell": totalSell,
        "total_sell_discount": totalSellDiscount,
        "total_sell_return": totalSellReturn,
        "total_sell_round_off": totalSellRoundOff,
        "total_expense": totalExpense,
        "total_adjustment": totalAdjustment,
        "total_recovered": totalRecovered,
        "total_reward_amount": totalRewardAmount,
        "left_side_module_data": List<dynamic>.from(leftSideModuleData.map((x) => x.toJson())),
        "right_side_module_data": List<dynamic>.from(rightSideModuleData.map((x) => x)),
        "net_profit": netProfit,
        "gross_profit": grossProfit,
        "total_sell_by_subtype": List<dynamic>.from(totalSellBySubtype.map((x) => x)),
    };
}

class LeftSideModuleDatum {
    LeftSideModuleDatum({
        required this.value,
        required this.label,
        required this.addToNetProfit,
    });

    dynamic value;
    String label;
    bool addToNetProfit;

    factory LeftSideModuleDatum.fromJson(Map<String, dynamic> json) => LeftSideModuleDatum(
        value: json["value"],
        label: json["label"],
        addToNetProfit: json["add_to_net_profit"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
        "add_to_net_profit": addToNetProfit,
    };
}
