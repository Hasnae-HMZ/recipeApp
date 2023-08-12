import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/user.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future create({required User user}) async {
    await _firestore.collection("users").doc(user.id).set(user.toJson());
  }

  Future update({required User user}) async {
    await _firestore.collection("users").doc(user.id).update(user.toJson());
  }

  Future delete({required String id}) async {
    await _firestore.collection("users").doc(id).delete();
  }
}
