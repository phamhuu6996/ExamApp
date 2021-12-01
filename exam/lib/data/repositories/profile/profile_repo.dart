import 'package:exam/data/datasource/user_profile/remote/remote.dart';
import 'package:exam/domain/entities/profile/data_profile.dart';
import 'package:exam/domain/repositories/repositories.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemote profileRemote;

  ProfileRepoImpl(this.profileRemote);

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
