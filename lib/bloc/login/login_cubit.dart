import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  loginWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading(loadingMessage: "Starting login"));

    try {
      //  we log in the users someway

      await Future.delayed(Duration(seconds: 3), () {
        emit(LoginSuccessState());
      });
    } catch (e, s) {
      emit(LoginErrorState(errorMessage: e.toString()));
    }
  }
}
