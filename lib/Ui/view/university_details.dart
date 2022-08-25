import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../view_model/details_view_model.dart';

class UniversityDetails extends StatefulWidget {
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
  State<UniversityDetails> createState() => _UniversityDetailsState();
}

class _UniversityDetailsState extends State<UniversityDetails> {
  String number = '';
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    // controller2.dispose();
  }

  //TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    final detailsProvider =
        Provider.of<DetailsViewModel>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          actions: [
            IconButton(
              icon: const Icon(Icons.photo_album),
              onPressed: () => detailsProvider.seleccionfoto(),
            ),
            IconButton(
                icon: const Icon(Icons.camera),
                onPressed: () => detailsProvider.tomarfoto()),
          ],
        ),
        body: Card(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: (detailsProvider.fotoSelecctionada == true)
                      ? Image(
                          image: FileImage(File(detailsProvider.image.path)))
                      : const Image(image: AssetImage('assets/no-image.png')),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text('University: ${widget.name}'),
                      Text('Country: ${widget.country}'),
                      Text('State: ${widget.state}'),
                      Text('Web Page: ${widget.webPage}'),
                      Text('Numer of Students:  $number')
                    ],
                  )),
              Expanded(
                  child: ListTile(
                title: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: 'Enter a message',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                        });
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                  onSubmitted: (value) {
                    number = value;
                    FocusScope.of(context).unfocus();
                    setState(() {
                      _controller.clear();
                    });
                  },
                ),
              )),
              // Expanded(child: child)
            ],
          ),
        ));
  }
}
