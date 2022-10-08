import 'dart:convert';

import 'package:http/http.dart' as http;

JModel jokeFromJson(String str) => JModel.fromJson(json.decode(str));
String jokeToJson(JModel data) => json.encode(data.toJson());

class JModel {
  JModel({required this.setup, required this.delivery, required this.id});

  String setup;
  String delivery;
  int id;

  factory JModel.fromJson(Map<String, dynamic> json) {
    return JModel(
        setup: json['setup'] ?? json['joke'],
        delivery: json['delivery'] ?? '',
        id: json['id']);
  }
  Map<String, dynamic> toJson() {
    return {'setup': setup, 'delivery': delivery, 'id': id};
  }
}

class jRepo {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  Future<JModel> getJokr() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return jokeFromJson(response.body);
    } else {
      throw Exception("failed to load");
    }
  }
}
