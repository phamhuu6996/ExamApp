import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/data/datasource/user_profile/remote/remote.dart';
import 'package:exam/data/model/profile/profile.dart';
import 'package:exam/domain/param/param.dart';

class ProfileFireRemote implements ProfileRemote<ProfileParam, Profile> {
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

  Future<void> _add(ProfileParam data) async {
    await reference!.doc(data.key).set(data.value);
  }

  Future<void> _delete(query) async {
    await reference!.doc(query).delete();
  }

  Future<Profile?> _get(query) async {
    DocumentSnapshot snapshot = await reference!.doc(query).get();
    if (snapshot.exists) {
      return (snapshot.data()!) as Profile;
    }
  }

  Future<void> _update(query, data) async {
    await reference!.doc(query).update(data);
  }

  @override
  Future<Profile?> getProfile(ProfileParam data) async {
    _initReference();
    Profile? profiles = await _get(data.key);
    if (profiles == null) {
      await _add(data);
    } else {
      return profiles;
    }
    return _get(data.key);
  }
}
