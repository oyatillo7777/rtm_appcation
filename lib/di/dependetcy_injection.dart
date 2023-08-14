import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rtm/network/network.dart';
import 'package:rtm/rtm_trivial/data/data_source/local_data_source.dart';
import 'package:rtm/rtm_trivial/data/data_source/remote_data_source.dart';
import 'package:rtm/rtm_trivial/data/repositories/repository.dart';
import 'package:rtm/rtm_trivial/domain/repositories/repository.dart';
import 'package:rtm/rtm_trivial/domain/usec_case/rtm.dart';
import 'package:rtm/rtm_trivial/presitation/bloc/login_bloc.dart';

final diPost = GetIt.instance;

Future<void> initS() async {
  diPost.registerLazySingleton<Dio>(() => Dio());

  diPost.registerLazySingleton(() => InternetConnectionChecker());
  diPost.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(diPost()));

  diPost.registerLazySingleton<RemoteDataSourceImpl>(
      () => RemoteDataSourceImpl(dio: diPost()));

  diPost.registerLazySingleton(() => LocalDataSourceImpl());

  diPost.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      dio: diPost(),
      localDataSourseImpl: diPost(),
      networkInfo: diPost(),
      remoteDataSourseImpl: diPost()));

  diPost.registerLazySingleton(() => LoginUsesCase(diPost()));
  diPost.registerFactory(() => LoginBloc(usesCase: diPost()));
}
