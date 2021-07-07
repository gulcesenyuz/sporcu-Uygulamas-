import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future uploadToStorage() async {
  try {
    final file = await ImagePicker.pickVideo(source: ImageSource.gallery);
    print(file);

    FirebaseStorage storage = FirebaseStorage.instance;

    Reference ref = storage.ref().child('video');
    UploadTask uploadTask =
        ref.putFile(file, SettableMetadata(contentType: 'video/mp4'));

    var downloadUrl = await ref.getDownloadURL();

    final String url = downloadUrl.toString();

    print(url);
  } catch (error) {
    print(error);
  }
}

Future savePdf(customController) async {
  final databaseReference = FirebaseFirestore.instance;

  FirebaseStorage storage = FirebaseStorage.instance;
  final file = await ImagePicker.pickVideo(source: ImageSource.gallery);

  Reference ref = storage.ref().child(customController);

  UploadTask uploadTask =
      ref.putFile(file, SettableMetadata(contentType: 'video/mp4'));
  String url = await (await uploadTask).ref.getDownloadURL();
  final videdb = databaseReference.collection('Videos').doc(customController);

  videdb.set({'dataUrl': url, 'dataName': customController});
}
