import 'package:flutter_core_9615/features/todo/domain/entities/todos.dart';
import 'package:json_annotation/json_annotation.dart';
part 'todos_model.g.dart';

@JsonSerializable()
class TodosModel extends Todos {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  const TodosModel(this.userId, this.id, this.title, this.completed)
      : super(userId, id, title, completed);
  factory TodosModel.fromJson(Map<String, dynamic> json) =>
      _$TodosModelFromJson(json);
  Map<String, dynamic> toJson() => _$TodosModelToJson(this);
}
