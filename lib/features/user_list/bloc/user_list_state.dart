
import 'package:user_management_app/features/user_list/data/models/user_list_model.dart';

enum UserListStatus {
  success,
  failure,
  loading,
  data,
  addSuccess,
}

class UserListState {
  final List<UserListModel>? users;
  final List<UserListModel>? filteredUsers;
  final String? searchQuery;
  final UserListStatus? status;
  final String? errorMessage;

  UserListState({
    this.users,
    this.filteredUsers,
    this.searchQuery,
    this.errorMessage,
    required this.status,
  });

  UserListState copyWith({
    List<UserListModel>? users,
    List<UserListModel>? filteredUsers,
    String? searchQuery,
    String? errorMessage,
    required UserListStatus? status,
  }) {
    return UserListState(
      status: status ?? this.status,
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
