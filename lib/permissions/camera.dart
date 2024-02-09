import 'package:permission_handler/permission_handler.dart';

import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/utils/camera.dart';

Future<void> requestCameraPermission({Pokemon? pokemon}) async {
  final status = await Permission.camera.request();

  if (status == PermissionStatus.granted) {
      takePokemonPicture(pokemon:pokemon);   
    }
  }
