import 'package:flutter/cupertino.dart';
import 'package:toggle_view/domain/models/university.dart';
import 'package:http/http.dart' as http;
import '../../config/app_constants.dart';
import '../../config/use_case_config.dart';

class HomeViewModel extends ChangeNotifier {
  final UseCaseConfig _universitiesConfig = UseCaseConfig();
  final List<University> _lista = [];
  http.Client client = http.Client();
  int _crossAxisCount = 2;
  double _aspectRatio = 1.5;
  bool _isList = true;
  ViewType _viewType = ViewType.grid;

  get lista => _lista;
  get isList => _isList;
  get crossAxisCount => _crossAxisCount;
  get aspectRatio => _aspectRatio;
  get viewType => _viewType;

  setIsList(bool isList) {
    _isList = isList;
    notifyListeners();
  }

  setToggleView() {
    _isList = !_isList;
    notifyListeners();
  }

  setCrossAxisCount(int i) {
    _crossAxisCount = i;
    notifyListeners();
  }

  setAspectRatio(double d) {
    _aspectRatio = d;
    notifyListeners();
  }

  setViewType(ViewType v) {
    _viewType = v;
    notifyListeners();
  }

  setLista(List<University> lista) {
    _lista.addAll(lista);
    notifyListeners();
  }

  HomeViewModel() {
    getUniversities();
  }

  getUniversities() async {
    try {
      var response =
          await _universitiesConfig.getUniverisitesUseCase.getAll(client);
      setLista(response);
    } catch (e) {
      debugPrint(e.toString());
      notifyListeners();
    }
  }
}
