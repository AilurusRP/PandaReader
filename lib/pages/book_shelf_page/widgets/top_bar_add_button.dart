import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';

class TopBarAddButton extends StatelessWidget {
  const TopBarAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.add),
      itemBuilder: (context) => [
        PopupMenuItem(
          padding: const EdgeInsets.all(0),
          child: Center(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.grey[200]),
              ),
              onPressed: () => addBook(context),
              child: Text("Import Book"),
            ),
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.all(0),
          child: Center(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.grey[200]),
              ),
              onPressed: () {},
              child: Text("Create Category"),
            ),
          ),
        ),
      ],
    );
  }

  addBook(BuildContext context) async {
    await Permission.manageExternalStorage.request();
    var homeDir = Directory("/storage/emulated/0/Documents/PandaReader");
    await homeDir.create();
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(
          type: FileType.custom,
          allowedExtensions: ["txt", "mobi", "epub"],
        )
        .onError((err, stackTrace) {
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text(err.toString()));
              },
            );
          }
          return null;
        });
    if (result != null && result.paths.isNotEmpty) {
      result.paths.forEach((bookFilePath) async {
        File bookFile = File(bookFilePath!);
        bookFile.copy("${homeDir.path}/${basename(bookFilePath)}");
      });
    }
  }
}
