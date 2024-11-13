import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:user_github_borwita/data/models/popular_model.dart';
import 'package:user_github_borwita/utils/api_client.dart';

abstract class RemoteDataSource {
  Future<List<PopularModel>> getPopularModelUsers();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const baseUrl = 'https://api.github.com';
  static const endpointPopularUsers =
      '/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users';
  final ApiClient client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<PopularModel>> getPopularModelUsers() async {
    final response =
        await client.get(Uri.parse('$baseUrl$endpointPopularUsers'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['items'];
      return jsonList.map((json) => PopularModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
