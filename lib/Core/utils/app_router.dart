import 'package:go_router/go_router.dart';
import 'package:tasks_app/Core/helper_functions/get_login_state_from_cache.dart';
import 'package:tasks_app/Features/auth/presentation/views/forget_password_view.dart';
import 'package:tasks_app/Features/auth/presentation/views/login_view.dart';
import 'package:tasks_app/Features/auth/presentation/views/register_view.dart';
import 'package:tasks_app/Features/tasks/presentation/views/tasks_view.dart';

abstract class AppRouter {
  static const String initial = '/';
  static const String loginView = '/login';
  static const String registerView = '/register';
  static const String forgetPasswordView = '/forget-password';
  static const String tasksView = '/tasks';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: initial,
        builder: (context, state) =>
            !getLoginStateFromCache() ? const LoginView() : const TasksView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: registerView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: tasksView,
        builder: (context, state) => const TasksView(),
      ),
    ],
  );
}
