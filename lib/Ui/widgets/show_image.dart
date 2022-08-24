import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/details_view_model.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailsProvider =
        Provider.of<DetailsViewModel>(context, listen: true);
    return (detailsProvider.fotoSelecctionada == true)
        ? Image(image: FileImage(File(detailsProvider.image.path)))
        : const Image(image: AssetImage('assets/no-image.png'));
  }
}
