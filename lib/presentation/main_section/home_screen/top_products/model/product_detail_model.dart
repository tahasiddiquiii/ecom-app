// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  String? message;
  Data? data;

  ProductDetailModel({
    this.message,
    this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? factoryId;
  String? name;
  String? category;
  String? subcategory;
  String? setSize;
  String? setColor;
  int? noOfPairs;
  String? productBrand;
  int? minPrice;
  int? maxPrice;
  String? sampleImage;
  DateTime? createdAt;
  List<dynamic>? reviews;
  int? v;

  Data({
    this.id,
    this.factoryId,
    this.name,
    this.category,
    this.subcategory,
    this.setSize,
    this.setColor,
    this.noOfPairs,
    this.productBrand,
    this.minPrice,
    this.maxPrice,
    this.sampleImage,
    this.createdAt,
    this.reviews,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        factoryId: json["factoryId"],
        name: json["name"],
        category: json["category"],
        subcategory: json["subcategory"],
        setSize: json["setSize"],
        setColor: json["setColor"],
        noOfPairs: json["noOfPairs"],
        productBrand: json["productBrand"],
        minPrice: json["minPrice"],
        maxPrice: json["maxPrice"],
        sampleImage: json["sampleImage"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "factoryId": factoryId,
        "name": name,
        "category": category,
        "subcategory": subcategory,
        "setSize": setSize,
        "setColor": setColor,
        "noOfPairs": noOfPairs,
        "productBrand": productBrand,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "sampleImage": sampleImage,
        "createdAt": createdAt?.toIso8601String(),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "__v": v,
      };
}
