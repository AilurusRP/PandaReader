import 'package:flutter/material.dart';
import 'package:panda_reader/pages/book_shelf_page/widgets/top_bar_add_button.dart';

class BookShelfPage extends StatefulWidget {
  const BookShelfPage({super.key});

  @override
  State<BookShelfPage> createState() => _BookShelfPageState();
}

class _BookShelfPageState extends State<BookShelfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panda Reader"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [TopBarAddButton()],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(10, (_) => Placeholder()),
      ),
    );
  }
}
