import 'package:dartz/dartz.dart';
import 'package:flutter_core_9615/core/error/failures.dart';
import 'package:flutter_core_9615/core/usecase/usecase.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/user.dart';
import 'package:flutter_core_9615/features/todo/domain/repositories/todos_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUsersUseCase implements UseCase<List<User>, NoParams> {
  final TodosRepository todosRepository;
  GetUsersUseCase(this.todosRepository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams noParams) async {
    return await todosRepository.getUsers();
  }
}
