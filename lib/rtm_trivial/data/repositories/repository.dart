import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rtm/error/failure.dart';
import 'package:rtm/network/network.dart';
import 'package:rtm/rtm_trivial/data/data_source/local_data_source.dart';
import 'package:rtm/rtm_trivial/data/data_source/remote_data_source.dart';
import 'package:rtm/rtm_trivial/data/models/loginmodel.dart';
import 'package:rtm/rtm_trivial/domain/repositories/repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final Dio dio;
  final LocalDataSourceImpl localDataSourseImpl;
  final RemoteDataSourceImpl remoteDataSourseImpl;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.dio,
      required this.localDataSourseImpl,
      required this.remoteDataSourseImpl,
      required this.networkInfo});

  @override
  Future<Either<Failure, Loginmodel>> getCreate(
      String name, String password) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await remoteDataSourseImpl.getPost(name, password);
        print("BU yerdan malumot ketdi");
        return Right(result);
      } on ServerFailure {
        return Left(ServerFailure("Post qilishda xatolik"));
      }
    } else {
      return Left(ServerFailure("Internet yoqku "));
    }
  }

  @override
  Future<Either<Failure, Loginmodel>> getFetch() async {
    if (await networkInfo.isConnected) {
      try {
        var result = await remoteDataSourseImpl.getFetch();
        localDataSourseImpl.setPost(result);
        return Right(result);
      } on ServerFailure {
        return Left(ServerFailure("Serverda xatolik"));
      }
    } else {
      try {
        final result = await localDataSourseImpl.getFetch();
        return Right(result);
      } on ServerFailure {
        return Left(ServerFailure("Serverda xatolik"));
      }
    }
  }
}
