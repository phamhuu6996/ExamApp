import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/app/const.dart';
import 'package:exam/data/model/exam/exam_model.dart';
import 'package:exam/domain/entities/exam/data_exam.dart';

import 'exam_remote.dart';

class ExamFireRemote implements ExamRemote {
  final FirebaseFirestore firestore;
  final collection = 'exam';
  CollectionReference? reference;

  ExamFireRemote(this.firestore);

  void _initReference() {
    reference ??= firestore.collection(collection).withConverter<ExamModel>(
          fromFirestore: (snapshot, _) => ExamModel.fromJson(snapshot.data()!),
          toFirestore: (exam, _) => exam.toJson(),
        );
  }

  @override
  Future<bool> add(ExamModel data) async {
    _initReference();
    await reference!.add(data);
    return true;
  }

  @override
  Future<bool> delete(String query) async {
    _initReference();
    await reference!.doc(query).delete();
    return true;
  }

  @override
  Future<Stream<List<DataExam>>> get(query) async {
    _initReference();
    return reference!.snapshots().transform<List<DataExam>>(
        StreamTransformer<QuerySnapshot<ExamModel>, List<DataExam>>.fromHandlers(handleData: (event, sink) {
      List<DataExam> dataExams = event.docs
          .where((element) => element.data().pushed != (query == adminRole))
          .toList()
          .map((data) => DataExam(data.id, data.data()))
          .toList();
      sink.add(dataExams);
    }));
  }

  @override
  Future<bool> update(String key, Map<String, dynamic> value) async {
    _initReference();
    await reference!.doc(key).update(value);
    return true;
  }
}
