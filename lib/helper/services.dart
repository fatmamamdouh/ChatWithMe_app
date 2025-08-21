import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerWithEmailAndPassword({
  required String email,
  required String password,
}) async
{
  UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}

Future<void> loginWithEmailAndPassword({
  required String email,
  required String password,
}) async
{
  UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}

CollectionReference messages = FirebaseFirestore.instance.collection('Messages');


Future<void> addMessage(String message, String email) {
  // Call the user's CollectionReference to add a new user
  return messages
      .add({
    'messageText': message,
    'email' : email,
    'createdAt' : DateTime.now(),
  }).then((onValue)
  {
    print("Message is added to database");
  }).catchError((error)
  {
    print(error.toString());
  });
}