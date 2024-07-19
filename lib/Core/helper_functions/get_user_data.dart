import 'package:firebase_auth/firebase_auth.dart';

User getUserData() {
  User user = FirebaseAuth.instance.currentUser!;
  return user;
}
