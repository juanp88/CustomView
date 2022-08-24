import 'package:flutter/material.dart';
import 'package:toggle_view/Ui/view/university_details.dart';
import 'package:toggle_view/domain/models/university.dart';

import '../view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class GridMode extends StatelessWidget {
  const GridMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeViewModel>(context, listen: true);
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: homeProvider.lista.length,
        itemBuilder: (BuildContext ctx, index) {
          University university = homeProvider.lista[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UniversityDetails(
                          country: university.country!,
                          name: university.name!,
                          state: university.stateProvince!,
                          webPage: university.webPages!.first)));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(university.name.toString()),
              ),
            ),
          );
        });
  }
}
