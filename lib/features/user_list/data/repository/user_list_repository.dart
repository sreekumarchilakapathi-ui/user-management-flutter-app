
import 'package:user_management_app/features/user_list/data/models/user_list_model.dart';

import '../services/user_list_services.dart';

class UserRepository {
  final UserApiService userApiService;

  UserRepository(this.userApiService);

  Future<List<UserListModel>> getUsers() async {
    return await userApiService.fetchUsers();
  }
  Future<UserListModel> addUser(UserListModel user) async {
    return await userApiService.addUser(user);
  }
}
