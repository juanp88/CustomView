import 'package:flutter/material.dart';

import '../../config/app_constants.dart';
import '../../domain/models/university.dart';

class GridViewMode extends StatelessWidget {
  final University gridData;
  final ViewType viewtype;
  const GridViewMode({Key? key, required this.gridData, required this.viewtype})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: (viewtype == ViewType.list)
          ? Container(
              margin: const EdgeInsets.all(5),
              child: Card(
                child: ListTile(
                  title: Text(gridData.name!),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {},
                  ),
                ),
              ))
          : Card(
              child: ListTile(
                title: Text(gridData.name!),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {},
                ),
              ),
            ),
    );
  }
}
