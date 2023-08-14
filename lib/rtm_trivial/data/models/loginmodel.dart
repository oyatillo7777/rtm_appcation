// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromJson(String str) => Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  int id;
  String accessToken;
  String roll;

  Loginmodel({
    required this.id,
    required this.accessToken,
    required this.roll,
  });

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
    id: json["id"],
    accessToken: json["access_token"],
    roll: json["roll"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "access_token": accessToken,
    "roll": roll,
  };
}
