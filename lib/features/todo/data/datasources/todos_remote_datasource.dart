import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_core_9615/core/error/exception.dart';
import 'package:flutter_core_9615/core/services/api_client.dart';
import 'package:flutter_core_9615/core/util/response_helper.dart';
import 'package:flutter_core_9615/features/todo/data/models/todos_model.dart';
import 'package:flutter_core_9615/features/todo/data/models/user_model.dart';
import 'package:flutter_core_9615/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

abstract class TodosRemoteDatasource {
  Future<List<TodosModel>> getTodos();
  Future<List<UserModel>> getUsers();
}

@LazySingleton(as: TodosRemoteDatasource)
class TodosRemoteDatasourceImpl extends TodosRemoteDatasource {
  final ApiClient apiClient;
  TodosRemoteDatasourceImpl(this.apiClient);

  //send the resposne from Remote database or some third party, if error throw our exception here or you can throw on services.
  @override
  Future<List<TodosModel>> getTodos() async {
    try {
      return await apiClient.getTodos();
    } on DioError catch (e) {
      throw ResponseHelper.returnResponse(e);
    } catch (e) {
      throw ServerException(LocaleKeys.somethingWrong.tr());
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      return await apiClient.getUsers();
    } on DioError catch (e) {
      throw ResponseHelper.returnResponse(e);
    } catch (e) {
      throw ServerException(LocaleKeys.somethingWrong.tr());
    }
  }
}
