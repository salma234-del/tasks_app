import 'package:flutter/widgets.dart';
import 'package:tasks_app/Core/helper_functions/empty_validator.dart';
import 'package:tasks_app/Core/utils/app_colores.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';
import 'package:tasks_app/Core/utils/app_strings.dart';
import 'package:tasks_app/Core/utils/app_styles.dart';
import 'package:tasks_app/Core/widgets/custom_button.dart';
import 'package:tasks_app/Core/widgets/custom_text_form_field.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: TextEditingController(),
          validator: emptyValidator,
          filledColor: AppColors.bgEnd,
          hintText: AppStrings.taskTitle,
          hintStyle: AppStyles.styleRegular16,
          textColor: AppColors.white1,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 34),
        CustomTextFormField(
          controller: TextEditingController(),
          validator: emptyValidator,
          filledColor: AppColors.bgEnd,
          hintText: AppStrings.taskDescription,
          hintStyle: AppStyles.styleRegular16,
          textColor: AppColors.white1,
          maxLines: AppConstants.taskDescriptionMaxLines,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                bgColor: AppColors.white1,
                radiusColor: AppColors.primary,
                textColor: AppColors.bgEnd,
                text: AppStrings.cancel,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: CustomButton(
                text: AppStrings.add,
                onPressed: () {},
              ),
            )
          ],
        ),
      ],
    );
  }
}
