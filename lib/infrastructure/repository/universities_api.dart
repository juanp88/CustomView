import 'dart:convert';

import 'package:toggle_view/config/api_constants.dart';
import 'package:toggle_view/domain/models/gateway/universities_gateway.dart';
import 'package:toggle_view/domain/models/university.dart';
import 'package:http/http.dart' as http;

class UniversitiesApi extends UniversitiesGateway {
  @override
  Future<List<University>> getAll(http.Client client) async {
    final response = await client.get(
        Uri.parse(Apiconstants.baseUrl + Apiconstants.universitiesEndpoint));

    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      return univeritiesFromJson(jsonString);
    } else {
      throw Exception('URL unavailable');
    }
  }
}
