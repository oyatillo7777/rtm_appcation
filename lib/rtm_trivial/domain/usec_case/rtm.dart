import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rtm/error/failure.dart';
import 'package:rtm/rtm_trivial/data/models/loginmodel.dart';
import 'package:rtm/rtm_trivial/domain/repositories/repository.dart';
import 'package:rtm/usecase/usecase.dart';

class LoginUsesCase extends UseCase<Loginmodel, PostParams> {
  final LoginRepository loginRepository;

  LoginUsesCase(this.loginRepository);

  @override
  Future<Either<Failure, Loginmodel>> call(params) {
    return loginRepository.getCreate(params.name, params.password);
  }
}

class PostParams extends Equatable {
  final String name;
  final String password;

  PostParams(this.name, this.password);

  @override
  List<Object?> get props => [name, password];
}
