import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:me_leva_ali/firebase_options.dart';

registerUser(profilePicture, vehiclePicture, vehicleType, vehicleModel, name,
    phone, email, password) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore db = FirebaseFirestore.instance;

  Reference profileRef = FirebaseStorage.instance
      .ref()
      .child(name)
      .child('${DateTime.now().microsecondsSinceEpoch}.jpg');
  await profileRef.putFile(File(profilePicture.path));
  String userUrl = await profileRef.getDownloadURL();

  dynamic vehicleUrl;

  if (vehiclePicture != null) {
    Reference vehicleRef = FirebaseStorage.instance
        .ref()
        .child(name)
        .child('${DateTime.now().microsecondsSinceEpoch}.jpg');
    await vehicleRef.putFile(File(vehiclePicture.path));
    vehicleUrl = await vehicleRef.getDownloadURL();
  }

  db.collection('Users').add(
    {
      'profilePicture': userUrl,
      'vehiclePicture': vehicleUrl ?? '',
      'vehicleType': vehicleType,
      'vehicleModel': vehicleModel,
      'name': name,
      'phone': phone,
      'email': email,
      'status': true
    },
  );

  var auth = FirebaseAuth.instance;
  await auth.createUserWithEmailAndPassword(email: email, password: password);
}

login(email, password) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isAtutheticated = false;
  await auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((value) {
        print('logado');
        isAtutheticated = true;
      })
      .catchError((onError) {
        print('Falha');
        isAtutheticated = false;
      });

      return isAtutheticated;
}



isAuthenticated() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth auth = FirebaseAuth.instance;
  var user = auth.currentUser;
  return user;
}


logout() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.signOut();
}
