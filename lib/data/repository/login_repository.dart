import 'package:eliteware_test/data/remote_models/login_response.dart';

abstract class LoginRepository{
  Future<LoginResponse> loginUser(String email, String password);
}