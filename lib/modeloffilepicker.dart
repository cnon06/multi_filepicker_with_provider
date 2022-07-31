import 'dart:io';

import 'package:flutter/material.dart';

class ModelOfFilePicker with ChangeNotifier {
  List<File>? files = null;

  void filePickerModelFunction(files) {
    this.files = files;
    notifyListeners();
  }


}
