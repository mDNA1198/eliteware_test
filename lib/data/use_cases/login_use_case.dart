import 'package:eliteware_test/data/remote_models/login_response.dart';
import 'package:eliteware_test/data/repository/login_repository.dart';

class LoginUseCase{
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<LoginResponse> loginUser(String email, String password) async{
    return await _loginRepository.loginUser(email, password);
  }
}