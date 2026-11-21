
import 'package:dio/dio.dart';
import 'package:user_management_app/features/user_list/data/models/user_list_model.dart';

import '../../../../../core/api/api_client.dart';

class UserApiService {
  final ApiClient apiClient;

  UserApiService(this.apiClient);

  Future<List<UserListModel>> fetchUsers() async {
    try {
      final response = await apiClient.dio.get('/users');

      if (response.statusCode == 200) {
        if (response.data is! List) {
          throw Exception('Invalid response format');
        }

        final List<dynamic> data = response.data;

        return data
            .map((json) => UserListModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load users');
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw Exception('Connection timed out. Please try again.');

        case DioExceptionType.connectionError:
          throw Exception('No internet connection. Please check your network.');

        case DioExceptionType.badResponse:
          final statusCode = e.response?.statusCode;

          throw Exception(
            'Server error: ${statusCode ?? 'Unknown status code'}',
          );

        case DioExceptionType.cancel:
          throw Exception('Request was cancelled.');

        default:
          throw Exception(
            e.message ?? 'Something went wrong. Please try again.',
          );
      }
    } catch (e) {
      rethrow;
    }
  }
}
