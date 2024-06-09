// To parse this JSON data, do
//
//     final addToCartModel = addToCartModelFromJson(jsonString);

import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  String? message;
  Cart? cart;
  Order? order;

  AddToCartModel({
    this.message,
    this.cart,
    this.order,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        message: json["message"],
        cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "cart": cart?.toJson(),
        "order": order?.toJson(),
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

class Order {
  String? buyerId;
  List<Item>? items;
  int? totalAmount;
  String? status;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Order({
    this.buyerId,
    this.items,
    this.totalAmount,
    this.status,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        buyerId: json["buyerId"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        totalAmount: json["totalAmount"],
        status: json["status"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "buyerId": buyerId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "status": status,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
