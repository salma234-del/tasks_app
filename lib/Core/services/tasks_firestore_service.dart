import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks_app/Core/helper_functions/get_user_data.dart';
import 'package:tasks_app/Core/utils/firebase_constants.dart';

class TasksFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = getUserData();

  Future<void> setData({required final Map<String, dynamic> data}) async {
    await _firestore
        .collection(FirebaseConstants.usersTasksCollection)
        .doc(user.uid)
        .collection(FirebaseConstants.tasksCollection)
        .doc(data['id'])
        .set(data);
  }
}
