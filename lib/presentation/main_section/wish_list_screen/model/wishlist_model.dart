// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

WishListModel wishListModelFromJson(String str) =>
    WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
  String? message;
  Wishlist? wishlist;

  WishListModel({
    this.message,
    this.wishlist,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        message: json["message"],
        wishlist: json["wishlist"] == null
            ? null
            : Wishlist.fromJson(json["wishlist"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "wishlist": wishlist?.toJson(),
      };
}

class Wishlist {
  String? id;
  String? buyerId;
  List<Product>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Wishlist({
    this.id,
    this.buyerId,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        buyerId: json["buyerId"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "buyerId": buyerId,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Product {
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
