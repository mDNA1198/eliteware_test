import 'package:eliteware_test/generated/json/base/json_convert_content.dart';
import 'package:eliteware_test/data/remote_models/login_response.dart';

LoginResponse $LoginResponseFromJson(Map<String, dynamic> json) {
	final LoginResponse loginResponse = LoginResponse();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		loginResponse.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		loginResponse.message = message;
	}
	final LoginResponseData? data = jsonConvert.convert<LoginResponseData>(json['data']);
	if (data != null) {
		loginResponse.data = data;
	}
	return loginResponse;
}

Map<String, dynamic> $LoginResponseToJson(LoginResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

LoginResponseData $LoginResponseDataFromJson(Map<String, dynamic> json) {
	final LoginResponseData loginResponseData = LoginResponseData();
	final int? id = jsonConvert.convert<int>(json['Id']);
	if (id != null) {
		loginResponseData.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['Name']);
	if (name != null) {
		loginResponseData.name = name;
	}
	final String? email = jsonConvert.convert<String>(json['Email']);
	if (email != null) {
		loginResponseData.email = email;
	}
	final String? token = jsonConvert.convert<String>(json['Token']);
	if (token != null) {
		loginResponseData.token = token;
	}
	return loginResponseData;
}

Map<String, dynamic> $LoginResponseDataToJson(LoginResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Email'] = entity.email;
	data['Token'] = entity.token;
	return data;
}