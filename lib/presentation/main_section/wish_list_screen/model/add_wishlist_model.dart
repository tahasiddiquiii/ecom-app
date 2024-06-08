// To parse this JSON data, do
//
//     final addWishListModel = addWishListModelFromJson(jsonString);

import 'dart:convert';

AddRemoveWishListModel addWishListModelFromJson(String str) =>
    AddRemoveWishListModel.fromJson(json.decode(str));

String addWishListModelToJson(AddRemoveWishListModel data) =>
    json.encode(data.toJson());

class AddRemoveWishListModel {
  String? message;
  Wishlist? wishlist;

  AddRemoveWishListModel({
    this.message,
    this.wishlist,
  });

  factory AddRemoveWishListModel.fromJson(Map<String, dynamic> json) =>
      AddRemoveWishListModel(
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
  List<String>? products;
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
            : List<String>.from(json["products"]!.map((x) => x)),
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
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
