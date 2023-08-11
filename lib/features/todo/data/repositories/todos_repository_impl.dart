import 'package:dartz/dartz.dart';
import 'package:flutter_core_9615/core/error/exception.dart';
import 'package:flutter_core_9615/core/error/failures.dart';
import 'package:flutter_core_9615/features/todo/data/datasources/todos_local_datasource.dart';
import 'package:flutter_core_9615/features/todo/data/datasources/todos_remote_datasource.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/todos.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/user.dart';
import 'package:flutter_core_9615/features/todo/domain/repositories/todos_repository.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';

@LazySingleton(as: TodosRepository)
class TodosRepositoryImpl implements TodosRepository {
  final TodosRemoteDatasource todosRemoteDatasource;
  // final TodosLocalDatasource todosLocalDatasource;

  TodosRepositoryImpl(
    this.todosRemoteDatasource,
    // this.todosLocalDatasource,
  );

  @override
  Future<Either<Failure, List<Todos>>> getTodos() async {
    try {
      List<Todos> data = await todosRemoteDatasource.getTodos();
      //save to local
      // await todosLocalDatasource.createTodos(data);
      return Right(data);
    }
    // on SocketException catch (_) {
    //   final offlineData = todosLocalDatasource.getTodos();
    //   return Right(offlineData);
    // }
    on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      List<User> data = await todosRemoteDatasource.getUsers();
      //save to local
      // await todosLocalDatasource.createUsers(data);
      return Right(data);
    }
    // on SocketException catch (_) {
    //   final offlineData = todosLocalDatasource.getUsers();
    //   return Right(offlineData);
    // }
    on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message.toString()));
    }
  }
}
