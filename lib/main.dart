import 'package:flutter/material.dart';
import 'package:h_tick_test/features/open_features/users_dummy/presentation/notifiers/ui_notifiers/users_dummy_notifier/users_dummy_notifier.dart';
import 'package:provider/provider.dart';

import 'features/open_features/users_dummy/presentation/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UsersDummyNotifiers>(
              create: (_) => UsersDummyNotifiers()),
        ],
        builder: (context, _) {
          return MaterialApp(
            title: 'Dummy User',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          );
        });
  }
}
