import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:royal_class_app/support/app_theme.dart';
import 'package:royal_class_app/support/app_theme_provider.dart';
import 'package:royal_class_app/modules/login/view/log_in_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      theme: getAppTheme(
          context,
          ref.watch(
              appThemeProvider)), // Get app theme based on current context and theme provider state
      home: const LoginPage(), // Set LoginPage as the home screen
    );
  }
}
