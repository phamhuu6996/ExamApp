import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/data/datasource/work_exam/remote/remote.dart';
import 'package:exam/data/model/exam/detail_exam_model.dart';
import 'package:exam/domain/entities/exam/data_detail_exam.dart';
class WorkExamFireRemote implements WorkExamRemote {
  final FirebaseFirestore firestore;
  final collection = 'work_exam';
  CollectionReference? reference;

  WorkExamFireRemote(this.firestore);

  void _initReference() {
    reference ??= firestore.collection(collection).withConverter<DetailExamModel>(
          fromFirestore: (snapshot, _) => DetailExamModel.fromJson(snapshot.data()!),
          toFirestore: (exam, _) => exam.toJson(),
        );
  }

  @override
  Future<String> add(DetailExamModel data) async {
    _initReference();
    return (await reference!.add(data)).id;
  }

  @override
  Future<void> delete(query) async {
    _initReference();
    await reference!.doc(query).delete();
  }

  @override
  Future<List<DataDetailExam>> get(key, value) async {
    _initReference();
    List<DataDetailExam> dataPushExams = [];
    QuerySnapshot snapshot = await reference!.where(key, isEqualTo: value).get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      if (data is DetailExamModel) {
        dataPushExams.add(DataDetailExam(id: doc.id, pushExam: data));
      }
    }
    return dataPushExams;
  }
}
