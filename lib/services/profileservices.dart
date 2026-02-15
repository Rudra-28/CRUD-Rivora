import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rivoratechfe/model/profilemodel.dart';

class Profileservices {
  static const baseUrl = "http://10.184.118.227:3000";
   Future<void> addProfile(Profilemodel profile) async {
    await http.post(
      Uri.parse("$baseUrl/add-profile"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(profile.toJson()),
    );
  }
  Future<List<Profilemodel>> getProfiles() async {
    final response = await http.get(Uri.parse("$baseUrl/show-profile"));
    final List data = jsonDecode(response.body);
return data.map((e) => Profilemodel.fromJson(e)).toList();
  }

  Future<void> updateProfile(String id, Profilemodel profile) async {
    await http.put(
      Uri.parse("$baseUrl/update-profile-show/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(profile.toJson()),
    );
  }

  Future<void> deleteProfile(String id) async {
    await http.delete(
      Uri.parse("$baseUrl/delete-profile-show/$id"),
    );
  }
}
