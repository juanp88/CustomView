import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:toggle_view/Ui/view_model/details_view_model.dart';

import 'Ui/view/home.dart';
import 'Ui/view_model/home_view_model.dart';

void main() async {
  final data = HomeViewModel();
  data.getUniversities;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => DetailsViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
