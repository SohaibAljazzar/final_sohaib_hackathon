import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_sohaib_hackathon/models/course.dart';
import 'package:final_sohaib_hackathon/models/fb_response.dart';
import '../utils/firebase_helper.dart';

class FbFirestoreController with FirebaseHelper {
  ///Functions
  ///1) Create
  ///2) Read
  ///3) Update
  ///4) Delete

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FbResponse> create(Course course) async {
    return _firestore
        .collection('Courses')
        .add(course.toMap())
        .then((value) => successResponse)
        .catchError((error) => errorResponse);
  }

  Future<FbResponse> update(Course course) async {
    return _firestore
        .collection('Courses')
        .doc(/*course.id*/)
        .update(course.toMap())
        .then((value) => successResponse)
        .catchError((error) => errorResponse);
  }

  Future<FbResponse> delete(String id) async {
    return _firestore
        .collection('Courses')
        .doc(id)
        .delete()
        .then((value) => successResponse)
        .catchError((error) => errorResponse);
  }

  Stream<QuerySnapshot<Course>> read() async* {
    yield* _firestore
        .collection('Courses')
        .withConverter<Course>(
          fromFirestore: (snapshot, options) => Course.fromMap(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots();
  }
}
