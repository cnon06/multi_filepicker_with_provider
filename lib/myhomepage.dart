import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fileString = "";
  String fileExtension = "";
  List<File>? files = null;
  

  void singleFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
  allowedExtensions: ['jpg', 'png', 'jpeg'],
  );

    if (result != null) {
     
      files = result.paths.map((path) => File(path!)).toList();
     
    } else {
     
    }

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
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
              child: files != null
                  ? ListView.builder(
                      itemCount: files?.length,
                      itemBuilder: (context, index) {
                        return Column(

                              children: [
                          
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.file(
                                  File(files![index].path),
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

            TextButton(
                onPressed: () {
                  singleFile();
                },
                child: const Text("File")),
          ],
        ),
      ),
    );
  }
}
