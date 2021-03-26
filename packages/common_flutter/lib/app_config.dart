/*
* This class pretends to use like environments on Android, for this case must be
* implemented with IDE or Visual Studio Code like on this example:
* https://medium.com/flutter-community/flutter-ready-to-go-e59873f9d7de
* WARNING: This class is only for development, don't use it on production environment
*/
class AppConfig {
  late String flavorName;
  late String baseUrl;
  static late AppConfig _instance;

  factory AppConfig({required String flavorName, required String baseUrl}) {
    _instance = AppConfig._internal(flavorName, baseUrl);

    return _instance;
  }

  AppConfig._internal(this.flavorName, this.baseUrl);

  static AppConfig get instance => _instance;
}
