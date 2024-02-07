import "package:flutter_bloc/flutter_bloc.dart";

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState()) {
    getAllUsers();
  }

  UsersProvider _repository = UsersProvider();
  final _limit = 20;

  Future<void> refreshUsers() async {
    emit(state.refresh());
    await getAllUsers();
  }

  Future<void> getAllUsers() async {
    try {
      if (state.hasMax!) return;
      if (state.userStatus.initial)
        emit(state.copyWith(userStatus: UserStatus.initial));
      final listUser =
          await _repository.getUsers(page: state.page!, limit: _limit);
      final result =
          state.UserStatus.initial ? [...listUser] : [...state.data!, listUser];

      emit(
        state.copyWith(
          data: result,
          userStatus: UserStatus.success,
          page: state.page! + 1,
          hasMax: listUser.isEmpty,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          userStatus: UserStatus.failure, errorMessage: e.toString()));
    }
  }
}
