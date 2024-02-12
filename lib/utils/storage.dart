import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future<void> readStorageFolder(Function addPokemonToSavedList) async {
  final appDir = await getExternalStorageDirectory();
  final path = Directory("${appDir?.path}/Pokemon");

  final subfolders = await path.list(recursive: false).toList();
  if (subfolders.isEmpty) {
    return;
  } else {
    final folderNames =
        subfolders.map((folder) => basename(folder.path)).toList();
    for (final name in folderNames) {
      await addPokemonToSavedList(name);
    }
  }
}

Future<void> readStoragePicturePaths(
    Function addPokemonPicturePath, String name) async {
  final appDir = await getExternalStorageDirectory();
  final path = Directory("${appDir?.path}/Pokemon/$name");
  final files = await path.list(recursive: false).toList();
  for (var file in files) {
    await addPokemonPicturePath(file.path);
  }
}

Future<File> loadStoragedPicture(String pathPicture) async {
   File imageFile = File(pathPicture);

    if (imageFile.existsSync()) {
      return imageFile;
    } else {
      return File('assets/default.jpeg');
    }
}
