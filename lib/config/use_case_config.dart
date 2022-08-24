import 'package:toggle_view/domain/use_cases/get_universities_usecase.dart';

import '../infrastructure/repository/universities_api.dart';

class UseCaseConfig {
  late GetUniversitiesUseCase getUniverisitesUseCase;
  late GetUniversitiesUseCase getPostMock;
  late UniversitiesApi _universitiesApi;
  // late PostApiMock _postApiMock;

  UseCaseConfig() {
    _universitiesApi = UniversitiesApi();
    getUniverisitesUseCase = GetUniversitiesUseCase(_universitiesApi);
  }
}
