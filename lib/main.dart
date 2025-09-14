import 'package:bloc_example/src/feture/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/core/service/env_service.dart';

void main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await EnvService.loadEnv();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Example',
      home: HomeView(),
    );
  }
}
