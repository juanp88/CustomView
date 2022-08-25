import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class DetailsViewModel extends ChangeNotifier {
  final picker = ImagePicker();
  String _numberOfStudents = '';
  late File _image;
  bool _fotoSeleccionada = false;

  get numberOfStudents => _numberOfStudents;
  get image => _image;
  get fotoSelecctionada => _fotoSeleccionada;

  setNumberOfStudentents(String n) {
    _numberOfStudents = n;
    notifyListeners();
  }

  setImage(File file) {
    _image = file;
    notifyListeners();
  }

  setFotoSeleccionada(bool seleccionada) {
    _fotoSeleccionada = seleccionada;
    notifyListeners();
  }

  Future seleccionfoto() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setImage(File(pickedFile.path));
      setFotoSeleccionada(true);
    } else {
      print('No image selected.');
    }
  }

  Future tomarfoto() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setImage(File(pickedFile.path));
      setFotoSeleccionada(true);

      // detailsProvider.fotoSelecctionada(false);
    } else {
      print('No image selected.');
    }
  }
}
