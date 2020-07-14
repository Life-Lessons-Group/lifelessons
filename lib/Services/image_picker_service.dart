import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final _picker = ImagePicker();

  Future<PickedFile> pickImage({@required ImageSource source}) async {
    return _picker.getImage(source: source);
  }
}
