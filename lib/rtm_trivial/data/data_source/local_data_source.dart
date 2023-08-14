import 'package:rtm/rtm_trivial/data/data_source/remote_data_source.dart';
import 'package:rtm/rtm_trivial/data/models/loginmodel.dart';

abstract class LocalDataSource {
  Future<Loginmodel> getFetch();

  Future<Loginmodel> setPost(Loginmodel post);
}

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<Loginmodel> getFetch() {
    return Future.value();
  }

  @override
  Future<Loginmodel> setPost(Loginmodel post) {
    return Future.value();
  }
}
