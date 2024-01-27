import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileService {
  Future<void> saveProfileData(
      String name, String email, String institution) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('name', name);
    await preferences.setString('email', email);
    await preferences.setString('institution', institution);
  }

  Future<Map<String, String>> getProfileData() async {
    final preferences = await SharedPreferences.getInstance();
    return {
      'name': preferences.getString('name') ?? '',
      'email': preferences.getString('email') ?? '',
      'institution': preferences.getString('institution') ?? '',
    };
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/profile_photo.png');
  }

  Future<File> writeProfilePhoto(File image) async {
    final file = await _localFile;
    return file.writeAsBytes(await image.readAsBytes());
  }

  Future<File> readProfilePhoto() async {
    try {
      final file = await _localFile;
      return file;
    } catch (e) {
      // If encountering an error, return a default image
      // or handle the exception.
      return File('path_to_default_image');
    }
  }

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      return await writeProfilePhoto(imageFile);
    }
    return null;
  }

  Future<void> saveSkor(int skor) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('skor', skor);
  }

  Future<int> getSkor() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt('skor') ?? 0;
  }
}
