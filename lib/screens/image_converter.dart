import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageConverter{

  static Future<String> base64(PickedFile image)async{
    Uint8List list = await image.readAsBytes();
    return base64Encode(list);
  }

  static base64Decode(String base64Image)async{
    final decodedBytes = base64Decode(base64Image);
    var fileImg= File("testImage.png");
    fileImg..writeAsBytesSync(decodedBytes);
    return fileImg;
  }

}