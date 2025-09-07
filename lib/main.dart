import 'package:flutter/material.dart';

import 'pages/book_shelf_page/book_shelf_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,),
      ),
      home: const BookShelfPage(),
    );
  }
}
