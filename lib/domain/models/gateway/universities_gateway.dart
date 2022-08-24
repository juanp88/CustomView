import 'package:toggle_view/domain/models/university.dart';
import 'package:http/http.dart' as http;

abstract class UniversitiesGateway {
  Future<List<University>> getAll(http.Client client);
}
