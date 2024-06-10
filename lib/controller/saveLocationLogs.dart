import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class saveLogs {
  Future<String?> createFolder() async {
    final dir = Directory((Platform.isAndroid
                ? await getExternalStorageDirectory() //FOR ANDROID
                : await getApplicationSupportDirectory()) //FOR iOS
            !
            .path +
        '/LocationLogs');

    if (await dir.exists()) {
      return dir.path;
    } else {
      dir.create();
      return dir.path;
    }
  }

  Future<File> localFile(String fileName) async {
    final path = await createFolder();
    return File('$path/$fileName.text');
  }

  Future<File?> writeCounter(var exceptionLog, String fileName) async {
    final file = await localFile(fileName);
    try {
      file.writeAsString('$exceptionLog').then((value) {});
    } catch (e) {
      print('error.....${e}');
    }
  }

  Future read(String fileName) async {
    try {
      final file = await localFile(fileName);
      final contents = await file.readAsString();
      var decodeList = json.decode(contents);
      return decodeList;
    } catch (e) {
      print('errorrrrr${e}');
      return null;
    }
  }
}
