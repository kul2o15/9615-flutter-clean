import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core_9615/core/config/DI/configure_dependencies.dart';
import 'package:flutter_core_9615/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:flutter_core_9615/features/todo/presentation/pages/todos_page.dart';
import 'package:flutter_core_9615/root_page.dart';

class AppRoute {
  static const String initialRoute = "/";
  static const String todosRoute = "/todos";
  static Route<dynamic>? routeGenerate(
      RouteSettings settings, TickerProvider tickerProvider) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const RootPage());
      case todosRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<TodoCubit>(param1: tickerProvider)..getTodos(),
            child: const TodosPage(),
          ),
          fullscreenDialog: true,
        );
      default:
        return null;
    }
  }
}
