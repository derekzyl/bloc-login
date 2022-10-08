class AuthRepository {
  Future<void> login() async {
    print('attempting login');

    Future.delayed(Duration(seconds: 5));
    print('login successful');
  }
}
