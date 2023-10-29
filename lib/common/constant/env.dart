class Env {
  final String baseUrl;

  Env({required this.baseUrl});
}

class EnvValue {
  static final Env development = Env(
    baseUrl: "https://jsonplaceholder.typicode.com",
  );

  static final Env production = Env(
    baseUrl: "https://jsonplaceholder.typicode.com",
  );
}
