import 'package:dartz/dartz.dart';
import 'package:rtm/error/failure.dart';
import 'package:rtm/rtm_trivial/data/models/loginmodel.dart';

abstract class LoginRepository {
  Future<Either<Failure, Loginmodel>> getFetch();

  Future<Either<Failure, Loginmodel>> getCreate(String name, String password);
}
