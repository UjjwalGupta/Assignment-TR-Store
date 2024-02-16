class AppUrl{
// Singleton pattern
  AppUrl._internal();

  static final AppUrl _instance = AppUrl._internal();

  static AppUrl get instance => _instance;

  String baseUrl = 'https://jsonplaceholder.org';
  // String productUrl = '${instance.baseUrl}/posts';
  String productUrl = 'https://jsonplaceholder.org/posts';
}