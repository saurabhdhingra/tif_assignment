import 'package:flutter/material.dart';
import 'package:tif_assignment/views/home_view.dart';
import 'package:tif_assignment/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeView(),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
