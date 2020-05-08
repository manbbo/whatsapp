// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class User {
  String id;
  String lastActive;
  String status;
  String name;
  String photo;
  String theme;

  User({
    @required this.id,
    @required this.lastActive,
    this.status,
    @required this.name,
    this.photo,
    this.theme,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => new User(
    id: json["id"],
    lastActive: json["last_active"],
    status: json["status"] == null ? "Hello! I'm using Reseau!" : json["status"],
    name: json["name"],
    photo: json["photo"] == null ? "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
        : json["photo"],
    theme: json["theme"] == null ? "https://i.pinimg.com/236x/c5/d6/c0/c5d6c0eae34ae8bb69533bc7872308ad.jpg"
        : json["theme"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "last_active": lastActive,
    "status": status == null ? "Hello! I'm using Reseau!" : status,
    "name": name,
    "photo": photo == null ? "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80" : photo,
    "theme": theme == null ? "https://i.pinimg.com/236x/c5/d6/c0/c5d6c0eae34ae8bb69533bc7872308ad.jpg" : theme,
  };
}
