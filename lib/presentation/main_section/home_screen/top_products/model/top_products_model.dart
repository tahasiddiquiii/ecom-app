// To parse this JSON data, do
//
//     final topProductsModel = topProductsModelFromJson(jsonString);

import 'dart:convert';

TopProductsModel topProductsModelFromJson(String str) =>
    TopProductsModel.fromJson(json.decode(str));

String topProductsModelToJson(TopProductsModel data) =>
    json.encode(data.toJson());

class TopProductsModel {
  String? message;
  Data? data;
  int? total;
  int? limit;
  int? page;
  int? pages;

  TopProductsModel({
    this.message,
    this.data,
    this.total,
    this.limit,
    this.page,
    this.pages,
  });

  factory TopProductsModel.fromJson(Map<String, dynamic> json) =>
      TopProductsModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        total: json["total"],
        limit: json["limit"],
        page: json["page"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
        "total": total,
        "limit": limit,
        "page": page,
        "pages": pages,
      };
}

class Data {
  List<Doc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  Data({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        docs: json["docs"] == null
            ? []
            : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "docs": docs == null
            ? []
            : List<dynamic>.from(docs!.map((x) => x.toJson())),
        "totalDocs": totalDocs,
        "limit": limit,
        "totalPages": totalPages,
        "page": page,
        "pagingCounter": pagingCounter,
        "hasPrevPage": hasPrevPage,
        "hasNextPage": hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage,
      };
}

class Doc {
  String? id;
  FactoryId? factoryId;
  String? name;
  Category? category;
  Subcategory? subcategory;
  String? setSize;
  SetColor? setColor;
  int? noOfPairs;
  ProductBrand? productBrand;
  int? minPrice;
  int? maxPrice;
  String? sampleImage;
  DateTime? createdAt;
  List<dynamic>? reviews;
  int? v;

  Doc({
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

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["_id"],
        factoryId: factoryIdValues.map[json["factoryId"]]!,
        name: json["name"],
        category: categoryValues.map[json["category"]]!,
        subcategory: subcategoryValues.map[json["subcategory"]]!,
        setSize: json["setSize"],
        setColor: setColorValues.map[json["setColor"]]!,
        noOfPairs: json["noOfPairs"],
        productBrand: productBrandValues.map[json["productBrand"]]!,
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
        "factoryId": factoryIdValues.reverse[factoryId],
        "name": name,
        "category": categoryValues.reverse[category],
        "subcategory": subcategoryValues.reverse[subcategory],
        "setSize": setSize,
        "setColor": setColorValues.reverse[setColor],
        "noOfPairs": noOfPairs,
        "productBrand": productBrandValues.reverse[productBrand],
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "sampleImage": sampleImage,
        "createdAt": createdAt?.toIso8601String(),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "__v": v,
      };
}

enum Category { FOOTWEAR }

final categoryValues = EnumValues({"Footwear": Category.FOOTWEAR});

enum FactoryId {
  THE_665_D8009_CA02061_B26_C20114,
  THE_665_F72_F891_F47008166742_C6
}

final factoryIdValues = EnumValues({
  "665d8009ca02061b26c20114": FactoryId.THE_665_D8009_CA02061_B26_C20114,
  "665f72f891f47008166742c6": FactoryId.THE_665_F72_F891_F47008166742_C6
});

enum ProductBrand { BRAND_X }

final productBrandValues = EnumValues({"BrandX": ProductBrand.BRAND_X});

enum SetColor { RED }

final setColorValues = EnumValues({"Red": SetColor.RED});

enum Subcategory { MEN }

final subcategoryValues = EnumValues({"Men": Subcategory.MEN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
