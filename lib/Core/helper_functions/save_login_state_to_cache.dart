import 'package:tasks_app/Core/network/local/chache_helper.dart';
import 'package:tasks_app/Core/utils/app_constants.dart';

void saveLoginStateToCache() async {
  await CacheHelper.saveData(key: AppConstants.isLoginKey, value: true);
}
