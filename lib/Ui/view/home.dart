import 'package:flutter/material.dart';
import 'package:toggle_view/Ui/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import 'package:toggle_view/Ui/widgets/gridview_widget2.dart';
import 'package:toggle_view/Ui/widgets/listview_widget.dart';

import 'package:toggle_view/domain/models/university.dart';
import '../../config/style_constants.dart';
import '../../config/use_case_config.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = StyleConstants();
    http.Client client = http.Client();
    final homeProvider = Provider.of<HomeViewModel>(context, listen: true);

    final UseCaseConfig _universitiesConfig = UseCaseConfig();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: (homeProvider.isList == true)
            ? const Icon(Icons.list)
            : const Icon(Icons.grid_view_rounded),
        onPressed: () => homeProvider.setToggleView(),
      ),
      appBar: AppBar(
          title: const ListTile(
        title: Text('Universities'),
      )),
      body: FutureBuilder(
          future: _universitiesConfig.getUniverisitesUseCase.getAll(client),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: style.titles,
                  ),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data as List<University>;

                return (homeProvider.isList == false)
                    ? const GridMode()
                    : const ListViewMode();
              }
            }
            return const Center(
              child: Text('No hay datos disponibles'),
            );
          }),
    );
  }
}
