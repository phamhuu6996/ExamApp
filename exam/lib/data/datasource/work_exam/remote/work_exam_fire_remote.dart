import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/data/datasource/work_exam/remote/remote.dart';
import 'package:exam/data/model/exam/push_exam.dart';
import 'package:exam/domain/entities/entities.dart';
class WorkExamFireRemote implements WorkExamRemote<PushExam, DataPushExam> {
  final FirebaseFirestore firestore;
  final collection = 'work_exam';
  CollectionReference? reference;

  WorkExamFireRemote(this.firestore);

  void _initReference() {
    reference ??= firestore.collection(collection).withConverter<PushExam>(
          fromFirestore: (snapshot, _) => PushExam.fromJson(snapshot.data()!),
          toFirestore: (exam, _) => exam.toJson(),
        );
  }

  @override
  Future<String> add(PushExam data) async {
    _initReference();
    return (await reference!.add(data)).id;
  }

  @override
  Future<void> delete(query) async {
    _initReference();
    await reference!.doc(query).delete();
  }

  @override
  Future<List<DataPushExam>> get(query) async {
    List<DataPushExam> dataPushExams = [];
    QuerySnapshot snapshot = await reference!.where(query).get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      if (data is PushExam) {
        dataPushExams.add(DataPushExam(id: doc.id, pushExam: data));
      }
    }
    return dataPushExams;
  }
}
