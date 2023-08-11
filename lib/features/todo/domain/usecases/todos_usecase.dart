import 'package:dartz/dartz.dart';
import 'package:flutter_core_9615/core/error/failures.dart';
import 'package:flutter_core_9615/core/usecase/usecase.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/todos.dart';
import 'package:flutter_core_9615/features/todo/domain/repositories/todos_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTodosUseCase implements UseCase<List<Todos>, NoParams> {
  final TodosRepository todosRepository;
  GetTodosUseCase(this.todosRepository);

  @override
  Future<Either<Failure, List<Todos>>> call(NoParams noParams) async {
    return await todosRepository.getTodos();
  }
}
