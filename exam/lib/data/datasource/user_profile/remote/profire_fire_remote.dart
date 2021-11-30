import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/data/datasource/user_profile/remote/remote.dart';
import 'package:exam/data/model/profile/data_profile.dart';
import 'package:exam/data/model/profile/profile.dart';

class ProfileFireRemote implements ProfileRemote {
  final FirebaseFirestore firestore;
  final collection = 'profile';
  CollectionReference? reference;

  ProfileFireRemote(this.firestore);

  void _initReference() {
    reference ??= firestore.collection(collection).withConverter<Profile>(
          fromFirestore: (snapshot, _) => Profile.fromJson(snapshot.data()!),
          toFirestore: (profile, _) => profile.toJson(),
        );
  }

  @override
  Future<void> add(DataProfile data) async {
    _initReference();
    await reference!.doc(data.key).set(data.profile);
  }

  @override
  Future<void> delete(query) async {
    _initReference();
    await reference!.doc(query).delete();
  }

  @override
  Future<DataProfile?> get(query) async {
    _initReference();
    DocumentSnapshot snapshot = await reference!.doc(query).get();
    if (snapshot.exists) {
      return DataProfile(key: snapshot.id, profile: (snapshot.data()!) as Profile);
    }
  }

  @override
  Future<void> update(query, data) async {
    _initReference();
    await reference!.doc(query).update(data);
  }
}
