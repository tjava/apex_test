import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apex_test/core/constants/string_constant.dart';
import 'package:apex_test/core/errors/exceptions.dart';
import 'package:apex_test/core/data/models/user_info_model.dart';

abstract class CoreLocalDataSource {
  Future<String?> getAccessToken();
  Future<void> cacheUserInfo(UserInfoModel userInfoModel);
  Future<UserInfoModel> getCachedUserInfo();
  Future<bool> logout();
}

@LazySingleton(as: CoreLocalDataSource)
class CoreLocalDataSourceImpl implements CoreLocalDataSource {
  final SharedPreferences sharedPreferences;

  CoreLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<String?> getAccessToken() async {
    try {
      return sharedPreferences.getString(kAccessToken);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> cacheUserInfo(UserInfoModel userInfoModel) async {
    try {
      await sharedPreferences.setString(kUserInfoKey, json.encode(userInfoModel.toJson()));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<UserInfoModel> getCachedUserInfo() {
    try {
      final String data = sharedPreferences.getString(kUserInfoKey)!;
      return Future<UserInfoModel>.value(UserInfoModel.fromJson(json.decode(data)));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> logout() async {
    try {
      return await sharedPreferences.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
