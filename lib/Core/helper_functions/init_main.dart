import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Core/bloc/bloc_observer.dart';
import 'package:tasks_app/Core/network/local/chache_helper.dart';
import 'package:tasks_app/Core/services/services_locator.dart';
import 'package:tasks_app/firebase_options.dart';

Future<void> initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  ServicesLocator.setup();
  await CacheHelper.init();
}
