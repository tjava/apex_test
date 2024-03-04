import 'package:apex_test/core/constants/string_constant.dart';
import 'package:apex_test/core/errors/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  Future<bool>? cacheAccessToken(String accessToken);
  Future<bool>? cachePin(String pin);
  Future<bool>? clearAccessToken();
  Future<String?> getAccessToken();
  Future<String?> getPin();
}

@LazySingleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> cacheAccessToken(String accessToken) async {
    try {
      return await sharedPreferences.setString(kAccessToken, accessToken);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> cachePin(String pin) async {
    try {
      return await sharedPreferences.setString(kPin, pin);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> clearAccessToken() async {
    return await sharedPreferences.remove(kAccessToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return sharedPreferences.getString(kAccessToken);
  }

  @override
  Future<String?> getPin() async {
    return sharedPreferences.getString(kPin);
  }
}
