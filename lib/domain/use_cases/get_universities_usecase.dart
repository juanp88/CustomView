import 'package:toggle_view/domain/models/university.dart';

import '../models/gateway/universities_gateway.dart';
import 'package:http/http.dart' as http;

class GetUniversitiesUseCase {
  final UniversitiesGateway _universitiesGateway;
  GetUniversitiesUseCase(this._universitiesGateway);

  Future<List<University>> getAll(http.Client client) async {
    return _universitiesGateway.getAll(client);
  }
}
