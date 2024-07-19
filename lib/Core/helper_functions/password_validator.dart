import 'package:tasks_app/Core/utils/app_strings.dart';

String? passwordValidator(value) {
  if (value.isEmpty || value == null) {
    return AppStrings.requiredField;
  } else {
    if (value.toString().length < 8) {
      return AppStrings.invalidPass;
    }
  }
  return null;
}
