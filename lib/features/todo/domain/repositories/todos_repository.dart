import 'package:dartz/dartz.dart';
import 'package:flutter_core_9615/core/error/failures.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/todos.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/user.dart';

abstract class TodosRepository {
  Future<Either<Failure, List<Todos>>> getTodos();
  Future<Either<Failure, List<User>>> getUsers();
}
