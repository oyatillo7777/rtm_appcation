import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rtm/error/failure.dart';
import 'package:rtm/rtm_trivial/data/models/loginmodel.dart';
import 'package:rtm/rtm_trivial/domain/usec_case/rtm.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsesCase usesCase;

  LoginBloc({required this.usesCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<GetPostEvent>(getPost);
  }

  FutureOr<void> getPost(GetPostEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    final result = await usesCase(PostParams(event.name, event.password));
    result.fold((left) {
      if (Left is NoConnectionFailure) {
        emit(LoginNoConnectionState());
      } else if (Left is ServerFailure) {
        emit(LoginFailureState());
      }
    }, (right) {
      emit(LoginSuccessState(right));
    });
  }
}
