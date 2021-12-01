import 'package:exam/domain/entities/profile/data_profile.dart';

abstract class ProfileRepo {
  Future<DataProfile?> getProfile(String data);

  Future<DataProfile?> addProfile(DataProfile data);
}
