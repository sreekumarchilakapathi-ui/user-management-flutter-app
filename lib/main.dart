
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/api/api_client.dart';
import 'features/user_list/bloc/user_list_bloc.dart';
import 'features/user_list/bloc/user_list_event.dart';
import 'features/user_list/data/repository/user_list_repository.dart';
import 'features/user_list/data/services/user_list_services.dart';
import 'features/user_list/screen/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
        create: (context) => UserRepository(
          UserApiService(ApiClient()),
        ),
        child: Builder(
          builder: (context) {
            return BlocProvider(
              create: (context) => UserListBloc(
                context.read<UserRepository>(),
              )..add(FetchUsersEvent()),
              child: const UserListWidget(),
            );
          },
        ),
      ),
    );
  }
}
