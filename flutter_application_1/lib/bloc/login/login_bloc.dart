import '../form_submission_status.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'login_event.dart';
import 'login_state.dart';
import '../auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc({required this.authRepo}) : super(LoginState());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (error) {
        yield state.copyWith(formStatus: SubmissionFailed(error));
      }
    }
  }

  // HomePage loginDataSource = HomePage();
  // LoginDataSource loginDataSource = LoginDataSource();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passController = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  // void login() async {
  //   emit(
  //     state.copyWith(
  //       true,
  //       false,
  //       false,
  //       null,
  //     ),
  //   );
  //   try {
  //     //await HomePage.sendPostRequest();
  //     await loginDataSource.login(
  //       emailController.text,
  //       passController.text,
  //     );
  //     emit(state.copyWith(
  //       false,
  //       false,
  //       true,
  //       null,
  //     ));
  //   } catch (error) {
  //     emit(state.copyWith(
  //       false,
  //       true,
  //       false,
  //       error.toString(),
  //     ));
  //   }
  // }
}
