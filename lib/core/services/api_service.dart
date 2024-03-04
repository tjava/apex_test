import 'package:apex_test/features/auth/data/models/email_token_model.dart';
import 'package:apex_test/features/home/data/models/secret_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:apex_test/core/constants/api_constant.dart';
import 'package:apex_test/features/auth/data/models/user_response_model.dart';

part 'api_service.g.dart';

@retrofit.RestApi(baseUrl: baseUrl)
abstract class ApiService {
  static Future<ApiService> getInstance() async {
    return ApiService(Dio());
  }

  factory ApiService(Dio dio) = _ApiService;

  @retrofit.POST(loginEndpoint)
  Future<UserResponseModel> login({
    @retrofit.Body() required Map<String, dynamic> params,
  });

  @retrofit.POST(registerEndpoint)
  Future<UserResponseModel> register({
    @retrofit.Body() required Map<String, dynamic> params,
  });

  @retrofit.POST(getEmailTokenEndpoint)
  Future<EmailTokenModel> getEmailToken({
    @retrofit.Body() required Map<String, dynamic> params,
  });

  @retrofit.POST(verifyEmailTokenEndpoint)
  Future<EmailTokenModel> verifyEmailToken({
    @retrofit.Body() required Map<String, dynamic> params,
  });

  @retrofit.GET(homeEndpoint)
  Future<SecretModel> getSecret({
    @retrofit.Header('Authorization') required String token,
  });
}
