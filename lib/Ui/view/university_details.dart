import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toggle_view/Ui/widgets/show_image.dart';

import '../view_model/details_view_model.dart';

class UniversityDetails extends StatelessWidget {
  final String country;
  final String state;
  final String name;
  final String webPage;

  const UniversityDetails(
      {Key? key,
      required this.country,
      required this.name,
      required this.state,
      required this.webPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    File _image;
    final detailsProvider =
        Provider.of<DetailsViewModel>(context, listen: true);

    Future _seleccionfoto() async {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        detailsProvider.setImage(File(pickedFile.path));
        detailsProvider.fotoSelecctionada(true);
      } else {
        print('No image selected.');
      }
    }

    Future _tomarfoto() async {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        detailsProvider.setImage(File(pickedFile.path));
        // detailsProvider.fotoSelecctionada(false);
      } else {
        print('No image selected.');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          actions: [
            IconButton(
              icon: Icon(Icons.photo_album),
              onPressed: _seleccionfoto,
            ),
            IconButton(icon: Icon(Icons.camera), onPressed: _tomarfoto),
          ],
        ),
        body: Card(
          child: Column(
            children: [
              const Expanded(
                flex: 3,
                child: Center(
                  child: ShowImage(),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text('University: $name'),
                      Text('Country: $country'),
                      Text('State: $state'),
                      Text('Web Page: $webPage')
                    ],
                  )),
              // Expanded(child: child)
            ],
          ),
        ));
  }
}
