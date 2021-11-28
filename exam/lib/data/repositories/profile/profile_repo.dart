import 'package:exam/data/datasource/user_profile/remote/remote.dart';
import 'package:exam/domain/repositories/repositories.dart';

class ProfileFireRepo implements ProfileRepo {
  final ProfileRemote profileRemote;

  ProfileFireRepo(this.profileRemote);

  @override
  Future getProfile(data) {
    return profileRemote.getProfile(data);
  }
}
