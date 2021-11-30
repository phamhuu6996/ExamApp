import 'package:exam/data/datasource/user_profile/remote/remote.dart';
import 'package:exam/data/model/profile/data_profile.dart';
import 'package:exam/domain/repositories/repositories.dart';

class ProfileFireRepo implements ProfileRepo {
  final ProfileRemote profileRemote;

  ProfileFireRepo(this.profileRemote);

  @override
  Future<DataProfile?> getProfile(String data) {
    return profileRemote.get(data);
  }

  @override
  Future<DataProfile?> addProfile(DataProfile data) async{
    await profileRemote.add(data);
    return data;
  }
}
