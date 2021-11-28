import 'dart:convert';

CashRegisterData cashRegisterDataFromJson(String str) => CashRegisterData.fromJson(json.decode(str));

String cashRegisterDataToJson(CashRegisterData data) => json.encode(data.toJson());

class CashRegisterData {
    CashRegisterData({
        required this.data,
        required this.links,
        required this.meta,
    });

    List<CashRegister> data;
    Links links;
    Meta meta;

    factory CashRegisterData.fromJson(Map<String, dynamic> json) => CashRegisterData(
        data: List<CashRegister>.from(json["data"].map((x) => CashRegister.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}

class CashRegister {
    CashRegister({
        required this.id,
        required this.businessId,
        required this.locationId,
        required this.userId,
        required this.status,
        required this.closedAt,
        required this.closingAmount,
        required this.totalCardSlips,
        required this.totalCheques,
        required this.denominations,
        required this.closingNote,
        required this.createdAt,
        required this.updatedAt,
        required this.cashRegisterTransactions,
    });

    int id;
    int businessId;
    int locationId;
    int userId;
    String status;
    dynamic closedAt;
    String closingAmount;
    int totalCardSlips;
    int totalCheques;
    dynamic denominations;
    dynamic closingNote;
    DateTime createdAt;
    DateTime updatedAt;
    List<CashRegisterTransaction> cashRegisterTransactions;

    factory CashRegister.fromJson(Map<String, dynamic> json) => CashRegister(
        id: json["id"],
        businessId: json["business_id"],
        locationId: json["location_id"],
        userId: json["user_id"],
        status: json["status"],
        closedAt: json["closed_at"],
        closingAmount: json["closing_amount"],
        totalCardSlips: json["total_card_slips"],
        totalCheques: json["total_cheques"],
        denominations: json["denominations"],
        closingNote: json["closing_note"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        cashRegisterTransactions: List<CashRegisterTransaction>.from(json["cash_register_transactions"].map((x) => CashRegisterTransaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "location_id": locationId,
        "user_id": userId,
        "status": status,
        "closed_at": closedAt,
        "closing_amount": closingAmount,
        "total_card_slips": totalCardSlips,
        "total_cheques": totalCheques,
        "denominations": denominations,
        "closing_note": closingNote,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cash_register_transactions": List<dynamic>.from(cashRegisterTransactions.map((x) => x.toJson())),
    };
}

class CashRegisterTransaction {
    CashRegisterTransaction({
        required this.id,
        required this.cashRegisterId,
        required this.amount,
        required this.payMethod,
        required this.type,
        required this.transactionType,
        required this.transactionId,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int cashRegisterId;
    String amount;
    String payMethod;
    String type;
    String transactionType;
    int transactionId;
    DateTime createdAt;
    DateTime updatedAt;

    factory CashRegisterTransaction.fromJson(Map<String, dynamic> json) => CashRegisterTransaction(
        id: json["id"],
        cashRegisterId: json["cash_register_id"],
        amount: json["amount"],
        payMethod: json["pay_method"],
        type: json["type"],
        transactionType: json["transaction_type"],
        transactionId: json["transaction_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cash_register_id": cashRegisterId,
        "amount": amount,
        "pay_method": payMethod,
        "type": type,
        "transaction_type": transactionType,
        "transaction_id": transactionId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Links {
    Links({
        required this.first,
        required this.last,
        required this.prev,
        required this.next,
    });

    String first;
    String last;
    dynamic prev;
    dynamic next;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    Meta({
        required this.currentPage,
        required this.from,
        required this.lastPage,
        required this.path,
        required this.perPage,
        required this.to,
        required this.total,
    });

    int currentPage;
    int from;
    int lastPage;
    String path;
    String perPage;
    int to;
    int total;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}
