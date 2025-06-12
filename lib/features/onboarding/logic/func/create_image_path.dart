
import 'dart:io';
import 'package:path_provider/path_provider.dart';



Future<void> createImagePath(String pickedFilePath) async {
    var directory = await getApplicationDocumentsDirectory();
    String imagePath = '${directory.path}/profile_image.png';
    final imageFile = File(pickedFilePath);
    final savedImage = await imageFile.copy(imagePath);

    // File profileImage = File(imagePath);
    //  = imageFile.copy(profileImage);
  }
  
