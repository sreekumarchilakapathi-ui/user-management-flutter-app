
import 'package:user_management_app/features/user_list/data/models/user_list_model.dart';

abstract class UserListEvent {}

class FetchUsersEvent extends UserListEvent {}

class SearchUsersEvent extends UserListEvent {
  final String query;

  SearchUsersEvent({required this.query});
}

class AddUserEvent extends UserListEvent{
  final UserListModel user;

  AddUserEvent({
    required this.user
});
}