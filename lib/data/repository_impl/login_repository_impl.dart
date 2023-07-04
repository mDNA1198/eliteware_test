import 'package:eliteware_test/app/app_constants/api_constants.dart';
import 'package:eliteware_test/data/networking/dio_factory.dart';
import 'package:eliteware_test/data/remote_models/login_response.dart';
import 'package:logging/logging.dart';
import '../repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final Logger _logger = Logger('LoginRepositoryImpl');

  @override
  Future<LoginResponse> loginUser(String email, String password) async{
    _logger.fine('loginUser email = $email, password = $password');
    try{
      final request = {
        'email': email,
        'password': password
      };

      var loginAPIResponse = await DioFactory.dio.post(
        APIConstants.loginEndpoint,
        data: request,
      );
      final dataToIn = loginAPIResponse.data ?? <String, dynamic>{};
      final loginAPIResponseObj = LoginResponse.fromJson(dataToIn);
      return loginAPIResponseObj;
    }catch(e){
      throw DioFactory.parseError(e);
    }
  }
}
