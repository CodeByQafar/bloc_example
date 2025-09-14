import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../exception/env_exception.dart';

class EnvService {
static Future<void> loadEnv() async {
  try {
      await dotenv.load(fileName: ".env");

  } catch (e) {
    throw EnvException('Failed to load .env file: ');
  }
}
static String get token => dotenv.env['TOKEN'] ?? '';
}