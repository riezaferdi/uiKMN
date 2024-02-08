import "package:flutter_bloc/flutter_bloc.dart";
import 'user_state.dart';
//import '../controller/userprovider.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState()) {
    getAllUsers();
  }

  // UsersProvider _repository = UsersProvider();
  // final _limit = 12;

  Future<void> refreshUsers() async {
    emit(state.refresh());
    await getAllUsers();
  }

  Future<void> getAllUsers() async {
    try {
      if (state.hasMax!) return;
      if (state.userStatus == UserStatus.initial) {
        emit(
          state.copyWith(userStatus: UserStatus.initial),
        );
      }
      //final listUser = await _repository.getUsers(page: state.page!, limit: _limit);

      // final listUser = await _repository.selectedFamily;
      // final result = state.userStatus == UserStatus.initial
      //     ? [...listUser]
      //     : [...state.data!, listUser];

      // emit(
      //   state.copyWith(
      //     data: result,
      //     userStatus: UserStatus.success,
      //     page: state.page! + 1,
      //     hasMax: listUser.isEmpty,
      //   ),
      // );
    } catch (e) {
      emit(state.copyWith(
          userStatus: UserStatus.failure, errorMessage: e.toString()));
    }
  }
}
