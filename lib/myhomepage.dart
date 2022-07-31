import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modeloffilepicker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  String fileString = "";
  String fileExtension = "";
 late List<File>? files;

  MyHomePage({Key? key}) : super(key: key);

  void singleFile(ModelOfFilePicker modelOfFilePicker) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      modelOfFilePicker.filePickerModelFunction(files);
    } else {}

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final modelOfFilePicker =
        Provider.of<ModelOfFilePicker>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 500,
              child: 
              
               Consumer<ModelOfFilePicker>(
              builder: (_, value, __) =>  modelOfFilePicker.files != null
                  ? ListView.builder(
                      itemCount: modelOfFilePicker.files?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.file(
                                File(modelOfFilePicker.files![index].path),
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      })
                  : const Text("There is no any image"),
              ),
              ),
              
            
            TextButton(
                onPressed: () {
                  singleFile(modelOfFilePicker);
                },
                child: const Text("File")),
          ],
        ),
      ),
    );
  }
}
