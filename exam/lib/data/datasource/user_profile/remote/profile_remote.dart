import 'package:exam/core/remote/base_remote.dart';
import 'package:exam/data/model/profile/data_profile.dart';

abstract class ProfileRemote extends BaseRemote {
  Future<void> add(DataProfile data);

  Future<void> delete(query);

  Future<DataProfile?> get(query);

  Future<void> update(query, data);
}
