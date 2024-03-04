import 'package:apex_test/core/services/api_service.dart';
import 'package:apex_test/features/auth/data/models/email_token_model.dart';
import 'package:apex_test/features/auth/data/models/login_payload_model.dart';
import 'package:apex_test/features/auth/data/models/register_payload_model.dart';
import 'package:apex_test/features/auth/data/models/user_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDatasource {
  Future<UserResponseModel> login(LoginPayloadModel loginPayloadModel);
  Future<UserResponseModel> register(RegisterPayloadModel registerPayloadModel);
  Future<EmailTokenModel> getEmailToken(Map<String, dynamic> params);
  Future<EmailTokenModel> verifyEmailToken(Map<String, dynamic> params);
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiService apiService;
  AuthRemoteDatasourceImpl(this.apiService);

  @override
  Future<EmailTokenModel> getEmailToken(Map<String, dynamic> params) async {
    final EmailTokenModel emailTokenModel = await apiService.getEmailToken(params: params);
    return emailTokenModel;
  }

  @override
  Future<UserResponseModel> login(LoginPayloadModel loginPayloadModel) async {
    final UserResponseModel userResponseModel =
        await apiService.login(params: loginPayloadModel.toJson());
    return userResponseModel;
  }

  @override
  Future<UserResponseModel> register(RegisterPayloadModel registerPayloadModel) async {
    final UserResponseModel userResponseModel =
        await apiService.register(params: registerPayloadModel.toJson());
    return userResponseModel;
  }

  @override
  Future<EmailTokenModel> verifyEmailToken(Map<String, dynamic> params) async {
    final EmailTokenModel emailTokenModel = await apiService.verifyEmailToken(params: params);
    return emailTokenModel;
  }
}
