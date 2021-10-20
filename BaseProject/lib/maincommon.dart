import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'app/locator.dart';
import 'app.dart';

void maincommon(Function() initializeEnvironmentViarables) {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() async {
    setupLocator();
    Firebase.initializeApp();
    await initializeEnvironmentViarables();
    runApp(App());
  }, (error, stack) {});
}
