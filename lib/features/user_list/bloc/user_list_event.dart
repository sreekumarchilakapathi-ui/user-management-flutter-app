
abstract class UserListEvent {}

class FetchUsersEvent extends UserListEvent {}

class SearchUsersEvent extends UserListEvent {
  final String query;

  SearchUsersEvent({required this.query});
}
