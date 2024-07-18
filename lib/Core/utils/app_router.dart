import 'package:go_router/go_router.dart';
import 'package:tasks_app/Features/auth/presentation/views/login_view.dart';
import 'package:tasks_app/Features/auth/presentation/views/register_view.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String loginView = '/login';
  static const String registerView = '/register';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: registerView,
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
