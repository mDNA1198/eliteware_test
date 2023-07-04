import 'package:eliteware_test/generated/json/base/json_field.dart';
import 'dart:convert';
import 'package:eliteware_test/generated/json/login_response.g.dart';

@JsonSerializable()
class LoginResponse {
	int? code;
	String? message;
	LoginResponseData? data;

	LoginResponse();

	factory LoginResponse.fromJson(Map<String, dynamic> json) => $LoginResponseFromJson(json);

	Map<String, dynamic> toJson() => $LoginResponseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LoginResponseData {
	@JSONField(name: "Id")
	int? id;
	@JSONField(name: "Name")
	String? name;
	@JSONField(name: "Email")
	String? email;
	@JSONField(name: "Token")
	String? token;

	LoginResponseData();

	factory LoginResponseData.fromJson(Map<String, dynamic> json) => $LoginResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $LoginResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}