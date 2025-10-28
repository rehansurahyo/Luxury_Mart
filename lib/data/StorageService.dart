import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _store = FirebaseStorage.instance;

  Future<String> uploadProductImage(File file, String id) async {
    final ref = _store.ref().child('products/$id.jpg');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }
}
