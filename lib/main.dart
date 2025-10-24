import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';

void main() {
  setupDI();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
