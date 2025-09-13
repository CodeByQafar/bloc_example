class EnvException implements Exception {
  String? messsage;

  EnvException([this.messsage]);

  @override
  String toString() {
    return "EnvException: $messsage";
  }
}