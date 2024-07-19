import 'package:tasks_app/Core/utils/app_strings.dart';

String? emptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return AppStrings.requiredField;
  }
  return null;
}
