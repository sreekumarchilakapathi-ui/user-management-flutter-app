
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management_app/features/user_list/data/models/user_list_model.dart';

import '../data/repository/user_list_repository.dart';
import 'user_list_event.dart';
import 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserRepository userRepository;

  UserListBloc(this.userRepository) : super(UserListState(status: UserListStatus.data)) {
    on<FetchUsersEvent>(_fetchUsers);
    on<SearchUsersEvent>(_searchUsers);
  }


  Future<void> _fetchUsers(FetchUsersEvent event, Emitter<UserListState> emit) async {
    emit(state.copyWith(status: UserListStatus.loading));
    try {
      final List<UserListModel> users =  await userRepository.getUsers();

      emit(
        state.copyWith(
          users: users,
          filteredUsers: users,
          status: UserListStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UserListStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _searchUsers(
      SearchUsersEvent event,
      Emitter<UserListState> emit,
      ) async {
    final query = event.query.toLowerCase().trim();

    final filteredUsers = (state.users ?? []).where((user) {
      return user.name.toLowerCase().contains(query) ||
          user.email.toLowerCase().contains(query);
    }).toList();

    emit(
      state.copyWith(
        filteredUsers: filteredUsers,
        searchQuery: event.query,
        status: UserListStatus.success,
      ),
    );
  }
}
