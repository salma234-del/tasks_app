import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/Core/helper_functions/clear_cache.dart';
import 'package:tasks_app/Core/helper_functions/get_user_data.dart';
import 'package:tasks_app/Core/helper_functions/show_custom_snack_bar.dart';
import 'package:tasks_app/Core/utils/app_assets.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_router.dart';
import 'package:tasks_app/Core/utils/app_sizes.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/logout_cubit/logout_cubit.dart';
import 'package:tasks_app/Features/tasks/presentation/views/view_model/logout_cubit/logout_state.dart';

class CustomTasksViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomTasksViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = getUserData();

    return AppBar(
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: AppSizes.defaultHorizontalPadding,
        ),
        child: Image.asset(
          AppAssets.userLogo,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.displayName!,
            style: AppStyles.styleSemiBold18,
          ),
          Text(
            user.email!,
            style: AppStyles.styleMedium14,
          ),
        ],
      ),
      actions: [
        BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              _buildLogoutSuccess(context);
            } else if (state is LogoutFailure) {
              _buildLogoutFailure(context, state);
            }
          },
          builder: (context, state) {
            var cubit = BlocProvider.of<LogoutCubit>(context);
            return IconButton(
              icon: const Icon(
                Icons.logout,
                color: AppColors.white1,
                size: 24,
              ),
              onPressed: () {
                cubit.logout();
              },
            );
          },
        ),
      ],
    );
  }

  void _buildLogoutFailure(BuildContext context, LogoutFailure state) {
    showCustomSnackBar(
      context: context,
      message: state.errorMessage,
      isSuccess: false,
    );
  }

  void _buildLogoutSuccess(BuildContext context) {
    clearCache();
    GoRouter.of(context).go(AppRouter.loginView);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
