import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter/material.dart';

//import data source
import '../EmailLogin.dart';

import '/api/login_data_source.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          LoginState(
            hasData: false,
            hasError: false,
            isLoading: false,
          ),
        );

  // HomePage loginDataSource = HomePage();
  LoginDataSource loginDataSource = LoginDataSource();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    emit(
      state.copyWith(
        true,
        false,
        false,
        null,
      ),
    );
    try {
      //await HomePage.sendPostRequest();
      await loginDataSource.login(
        emailController.text,
        passController.text,
      );
      emit(state.copyWith(
        false,
        false,
        true,
        null,
      ));
    } catch (error) {
      emit(state.copyWith(
        false,
        true,
        false,
        error.toString(),
      ));
    }
  }
}
