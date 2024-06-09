// To parse this JSON data, do
//
//     final removeFromCartModel = removeFromCartModelFromJson(jsonString);

import 'dart:convert';

RemoveFromCartModel removeFromCartModelFromJson(String str) =>
    RemoveFromCartModel.fromJson(json.decode(str));

String removeFromCartModelToJson(RemoveFromCartModel data) =>
    json.encode(data.toJson());

class RemoveFromCartModel {
  String? message;
  Cart? cart;

  RemoveFromCartModel({
    this.message,
    this.cart,
  });

  factory RemoveFromCartModel.fromJson(Map<String, dynamic> json) =>
      RemoveFromCartModel(
        message: json["message"],
        cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "cart": cart?.toJson(),
      };
}

class Cart {
  String? id;
  String? buyerId;
  List<Item>? items;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Cart({
    this.id,
    this.buyerId,
    this.items,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        buyerId: json["BuyerId"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
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
        "BuyerId": buyerId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Item {
  String? productId;
  int? noOfPairs;
  String? size;
  String? id;

  Item({
    this.productId,
    this.noOfPairs,
    this.size,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["productId"],
        noOfPairs: json["noOfPairs"],
        size: json["size"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "noOfPairs": noOfPairs,
        "size": size,
        "_id": id,
      };
}
