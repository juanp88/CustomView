import 'package:flutter/Material.dart';
import 'package:toggle_view/domain/models/university.dart';

import '../view/university_details.dart';
import '../view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class ListViewMode extends StatelessWidget {
  const ListViewMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeViewModel>(context, listen: true);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: homeProvider.lista.length,
      itemBuilder: (context, index) {
        University university = homeProvider.lista[index];
        return Card(
          child: ListTile(
            title: Text(university.name!),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UniversityDetails(
                            country: university.country!,
                            name: university.name!,
                            state: university.stateProvince!,
                            webPage: university.webPages!.first)));
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Container(
        height: 5,
      ),
    );
  }
}
