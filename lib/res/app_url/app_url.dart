class AppUrl{
// Singleton pattern
  AppUrl._internal();

  static final AppUrl _instance = AppUrl._internal();

  static AppUrl get instance => _instance;

  String productUrl = 'https://jsonplaceholder.org/posts';
}