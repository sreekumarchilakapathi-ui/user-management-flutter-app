
enum UserListStatus {
  success,
  failure,
  loading,
  data,
}

class UserListState {
  List<dynamic>? users;
  List<dynamic>? filteredUsers;
  String? searchQuery;
  UserListStatus? status;
  String? errorMessage;

  UserListState({
    this.users,
    this.filteredUsers,
    this.searchQuery,
    this.errorMessage,
    required this.status,
  });

  UserListState copyWith({
    List<dynamic>? users,
    List<dynamic>? filteredUsers,
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
