// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison, prefer_null_aware_operators

import 'dart:convert';

import 'package:flutter/material.dart';

ProductsData productsDataFromJson(String str) => ProductsData.fromJson(json.decode(str));

String productsDataToJson(ProductsData data) => json.encode(data.toJson());

class ProductsData {
    ProductsData({
        required this.data,
        required this.links,
        required this.meta,
    });

    List<Product> data;
    Links links;
    Meta meta;

    factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}

class Product with ChangeNotifier {
    Product({
        required this.id,
        required this.name,
        required this.businessId,
        required this.type,
        required this.subUnitIds,
        required this.enableStock,
        required this.alertQuantity,
        required this.sku,
        required this.barcodeType,
        required this.expiryPeriod,
        required this.expiryPeriodType,
        required this.enableSrNo,
        required this.weight,
        required this.productCustomField1,
        required this.productCustomField2,
        required this.productCustomField3,
        required this.productCustomField4,
        required this.image,
        required this.woocommerceMediaId,
        required this.productDescription,
        required this.createdBy,
        required this.warrantyId,
        required this.woocommerceProductId,
        required this.woocommerceDisableSync,
        required this.isInactive,
        required this.notForSelling,
        required this.imageUrl,
        required this.productVariations,
        required this.brand,
        required this.unit,
        required this.category,
        required this.subCategory,
        required this.productTax,
        required this.productLocations,
    });

    int id;
    String name;
    int businessId;
    String type;
    List<String> subUnitIds;
    int enableStock;
    String alertQuantity;
    String sku;
    dynamic barcodeType;
    String expiryPeriod;
    dynamic expiryPeriodType;
    int enableSrNo;
    String weight;
    String productCustomField1;
    String productCustomField2;
    String productCustomField3;
    String productCustomField4;
    String image;
    dynamic woocommerceMediaId;
    String productDescription;
    int createdBy;
    dynamic warrantyId;
    int woocommerceProductId;
    int woocommerceDisableSync;
    int isInactive;
    int notForSelling;
    String imageUrl;
    List<ProductVariation> productVariations;
    dynamic brand;
    Unit unit;
    Category category;
    dynamic subCategory;
    dynamic productTax;
    List<ProductLocation> productLocations;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        type: json["type"],
        subUnitIds: json["sub_unit_ids"],
        enableStock: json["enable_stock"],
        alertQuantity: json["alert_quantity"],
        sku: json["sku"],
        barcodeType: json["barcode_type"],
        expiryPeriod: json["expiry_period"],
        expiryPeriodType: json["expiry_period_type"],
        enableSrNo: json["enable_sr_no"],
        weight: json["weight"] == null ? null : json["weight"],
        productCustomField1: json["product_custom_field1"] == null ? null : json["product_custom_field1"],
        productCustomField2: json["product_custom_field2"] == null ? null : json["product_custom_field2"],
        productCustomField3: json["product_custom_field3"] == null ? null : json["product_custom_field3"],
        productCustomField4: json["product_custom_field4"] == null ? null : json["product_custom_field4"],
        image: json["image"] == null ? null : json["image"],
        woocommerceMediaId: json["woocommerce_media_id"],
        productDescription: json["product_description"] == null ? null : json["product_description"],
        createdBy: json["created_by"],
        warrantyId: json["warranty_id"],
        woocommerceProductId: json["woocommerce_product_id"],
        woocommerceDisableSync: json["woocommerce_disable_sync"],
        isInactive: json["is_inactive"],
        notForSelling: json["not_for_selling"],
        imageUrl: json["image_url"],
        productVariations: List<ProductVariation>.from(json["product_variations"].map((x) => ProductVariation.fromJson(x))),
        brand: json["brand"],
        unit: Unit.fromJson(json["unit"]),
        category: json["category"],
        subCategory: json["sub_category"],
        productTax: json["product_tax"],
        productLocations: List<ProductLocation>.from(json["product_locations"].map((x) => ProductLocation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_id": businessId,
        "type": type,
        "sub_unit_ids": subUnitIds == null ? null : List<dynamic>.from(subUnitIds.map((x) => x)),
        "enable_stock": enableStock,
        "alert_quantity": alertQuantity,
        "sku": sku,
        "barcode_type": barcodeType,
        "expiry_period": expiryPeriod,
        "expiry_period_type": expiryPeriodType,
        "enable_sr_no": enableSrNo,
        "weight": weight == null ? null : weight,
        "product_custom_field1": productCustomField1 == null ? null : productCustomField1,
        "product_custom_field2": productCustomField2 == null ? null : productCustomField2,
        "product_custom_field3": productCustomField3 == null ? null : productCustomField3,
        "product_custom_field4": productCustomField4 == null ? null : productCustomField4,
        "image": image == null ? null : image,
        "woocommerce_media_id": woocommerceMediaId,
        "product_description": productDescription == null ? null : productDescription,
        "created_by": createdBy,
        "warranty_id": warrantyId,
        "woocommerce_product_id": woocommerceProductId,
        "woocommerce_disable_sync": woocommerceDisableSync,
        "is_inactive": isInactive,
        "not_for_selling": notForSelling,
        "image_url": imageUrl,
        "product_variations": List<dynamic>.from(productVariations.map((x) => x.toJson())),
        "brand": brand,
        "unit": unit.toJson(),
        "category": category == null ? null : category.toJson(),
        "sub_category": subCategory,
        "product_tax": productTax,
        "product_locations": List<dynamic>.from(productLocations.map((x) => x.toJson())),
    };
}



class Category {
    Category({
        required this.id,
        required this.name,
        required this.businessId,
        required this.shortCode,
        required this.parentId,
        required this.createdBy,
        required this.categoryType,
        required this.description,
        required this.slug,
        required this.woocommerceCatId,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    int businessId;
    dynamic shortCode;
    int parentId;
    int createdBy;
    String categoryType;
    dynamic description;
    dynamic slug;
    int woocommerceCatId;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        businessId: json["business_id"],
        shortCode: json["short_code"],
        parentId: json["parent_id"],
        createdBy: json["created_by"],
        categoryType: json["category_type"],
        description: json["description"],
        slug: json["slug"],
        woocommerceCatId: json["woocommerce_cat_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_id": businessId,
        "short_code": shortCode,
        "parent_id": parentId,
        "created_by": createdBy,
        "category_type": categoryType,
        "description": description,
        "slug": slug,
        "woocommerce_cat_id": woocommerceCatId,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}


class ProductLocation {
    ProductLocation({
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
        required this.pivot,
    });

    int id;
    int businessId;
    dynamic locationId;
    dynamic name;
    String landmark;
    dynamic country;
    dynamic state;
    dynamic city;
    String zipCode;
    int invoiceSchemeId;
    int invoiceLayoutId;
    int saleInvoiceLayoutId;
    dynamic sellingPriceGroupId;
    int printReceiptOnInvoice;
    dynamic receiptPrinterType;
    dynamic printerId;
    dynamic mobile;
    dynamic alternateNumber;
    dynamic email;
    String website;
    dynamic featuredProducts;
    int isActive;
    String defaultPaymentAccounts;
    dynamic customField1;
    dynamic customField2;
    dynamic customField3;
    dynamic customField4;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;
    Pivot pivot;

    factory ProductLocation.fromJson(Map<String, dynamic> json) => ProductLocation(
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
        alternateNumber: json["alternate_number"],
        email: json["email"],
        website: json["website"],
        featuredProducts: json["featured_products"],
        isActive: json["is_active"],
        defaultPaymentAccounts: json["default_payment_accounts"],
        customField1: json["custom_field1"],
        customField2: json["custom_field2"],
        customField3: json["custom_field3"],
        customField4: json["custom_field4"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
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
        "default_payment_accounts": defaultPaymentAccounts,
        "custom_field1": customField1,
        "custom_field2": customField2,
        "custom_field3": customField3,
        "custom_field4": customField4,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}



class Pivot {
    Pivot({
        required this.productId,
        required this.locationId,
    });

    int productId;
    int locationId;

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        locationId: json["location_id"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "location_id": locationId,
    };
}


class ProductVariation {
    ProductVariation({
        required this.id,
        required this.variationTemplateId,
        required this.name,
        required this.productId,
        required this.isDummy,
        required this.createdAt,
        required this.updatedAt,
        required this.variations,
    });

    int id;
    int variationTemplateId;
    String name;
    int productId;
    int isDummy;
    DateTime createdAt;
    DateTime updatedAt;
    List<Variation> variations;

    factory ProductVariation.fromJson(Map<String, dynamic> json) => ProductVariation(
        id: json["id"],
        variationTemplateId: json["variation_template_id"] == null ? null : json["variation_template_id"],
        name: json["name"],
        productId: json["product_id"],
        isDummy: json["is_dummy"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "variation_template_id": variationTemplateId == null ? null : variationTemplateId,
        "name": name,
        "product_id": productId,
        "is_dummy": isDummy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
    };
}


class Variation {
    Variation({
        required this.id,
        required this.name,
        required this.productId,
        required this.subSku,
        required this.productVariationId,
        required this.woocommerceVariationId,
        required this.variationValueId,
        required this.defaultPurchasePrice,
        required this.dppIncTax,
        required this.profitPercent,
        required this.defaultSellPrice,
        required this.sellPriceIncTax,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.comboVariations,
        required this.variationLocationDetails,
        required this.media,
        required this.discounts,
    });

    int id;
    String name;
    int productId;
    String subSku;
    int productVariationId;
    dynamic woocommerceVariationId;
    dynamic variationValueId;
    String defaultPurchasePrice;
    String dppIncTax;
    String profitPercent;
    String defaultSellPrice;
    String sellPriceIncTax;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    List<dynamic> comboVariations;
    List<dynamic> variationLocationDetails;
    List<dynamic> media;
    List<dynamic> discounts;

    factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        subSku: json["sub_sku"],
        productVariationId: json["product_variation_id"],
        woocommerceVariationId: json["woocommerce_variation_id"],
        variationValueId: json["variation_value_id"],
        defaultPurchasePrice: json["default_purchase_price"],
        dppIncTax: json["dpp_inc_tax"],
        profitPercent: json["profit_percent"],
        defaultSellPrice: json["default_sell_price"],
        sellPriceIncTax: json["sell_price_inc_tax"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        comboVariations: json["combo_variations"],
        variationLocationDetails: List<dynamic>.from(json["variation_location_details"].map((x) => x)),
        media: List<dynamic>.from(json["media"].map((x) => x)),
        discounts: List<dynamic>.from(json["discounts"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_id": productId,
        "sub_sku": subSku,
        "product_variation_id": productVariationId,
        "woocommerce_variation_id": woocommerceVariationId,
        "variation_value_id": variationValueId,
        "default_purchase_price": defaultPurchasePrice,
        "dpp_inc_tax": dppIncTax,
        "profit_percent": profitPercent,
        "default_sell_price": defaultSellPrice,
        "sell_price_inc_tax": sellPriceIncTax,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "combo_variations": comboVariations == null ? null : List<dynamic>.from(comboVariations.map((x) => x)),
        "variation_location_details": List<dynamic>.from(variationLocationDetails.map((x) => x)),
        "media": List<dynamic>.from(media.map((x) => x)),
        "discounts": List<dynamic>.from(discounts.map((x) => x)),
    };
}


class Unit {
    Unit({
        required this.id,
        required this.businessId,
        required this.actualName,
        required this.shortName,
        required this.allowDecimal,
        required this.baseUnitId,
        required this.baseUnitMultiplier,
        required this.createdBy,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int businessId;
    dynamic actualName;
    dynamic shortName;
    int allowDecimal;
    dynamic baseUnitId;
    dynamic baseUnitMultiplier;
    int createdBy;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        businessId: json["business_id"],
        actualName: json["actual_name"],
        shortName: json["short_name"],
        allowDecimal: json["allow_decimal"],
        baseUnitId: json["base_unit_id"],
        baseUnitMultiplier: json["base_unit_multiplier"],
        createdBy: json["created_by"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "actual_name": actualName,
        "short_name": shortName,
        "allow_decimal": allowDecimal,
        "base_unit_id": baseUnitId,
        "base_unit_multiplier": baseUnitMultiplier,
        "created_by": createdBy,
        "deleted_at": deletedAt,
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
    String next;

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

