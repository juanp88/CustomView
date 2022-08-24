import 'dart:io';

import 'package:flutter/cupertino.dart';

class DetailsViewModel extends ChangeNotifier {
  late File _image;
  bool _fotoSeleccionada = false;

  get image => _image;
  get fotoSelecctionada => _fotoSeleccionada;

  setImage(File file) {
    _image = file;
    notifyListeners();
  }

  setFotoSeleccionada(bool seleccionada) {
    _fotoSeleccionada = seleccionada;
    notifyListeners();
  }
}
