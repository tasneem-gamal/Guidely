import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: "gs://guidely-90d79.appspot.com");

Future<String> getImageUrl(String imgName) async {
  Reference storageRef = storage.ref();
  Reference imgRef = storageRef.child('/images/$imgName');
  String downloadUrl = await imgRef.getDownloadURL();
  return downloadUrl;
}