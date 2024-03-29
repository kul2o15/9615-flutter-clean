import 'package:flutter_core_9615/core/constants/api_path.dart';
import 'package:flutter_core_9615/features/todo/data/models/todos_model.dart';
import 'package:flutter_core_9615/features/todo/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiPaht.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(ApiPaht.todos)
  Future<List<TodosModel>> getTodos();

  @GET(ApiPaht.users)
  Future<List<UserModel>> getUsers();
}
