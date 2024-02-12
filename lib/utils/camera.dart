import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:pokedex/model/pokemon.dart';

void takePokemonPicture({Pokemon? pokemon}) async {
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

  if (pickedImage != null) {
    final imageFile = File(pickedImage.path);

    final externalDir = await getExternalStorageDirectory();
    final newPath = join(externalDir?.path ?? '', 'Pokemon', pokemon?.name);

    await Directory(newPath).create(recursive: true);

    final destinationPath =
        join(newPath, '${DateTime.now().millisecondsSinceEpoch}.jpg');

    final bytes = await imageFile.readAsBytes();

    await File(destinationPath).writeAsBytes(bytes);
  }
}
