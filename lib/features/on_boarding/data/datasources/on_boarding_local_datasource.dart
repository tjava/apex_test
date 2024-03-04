import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apex_test/core/errors/exceptions.dart';

import 'package:apex_test/features/on_boarding/on_boarding_constants.dart';

abstract class OnBoardingLocalDatasource {
  Future<void> cacheFirstTimer();
  Future<bool> isUserFirstTimer();
}

@LazySingleton(as: OnBoardingLocalDatasource)
class OnBoardingLocalDatasourceImpl extends OnBoardingLocalDatasource {
  final SharedPreferences sharedPreferences;
  OnBoardingLocalDatasourceImpl(
    this.sharedPreferences,
  );

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await sharedPreferences.setBool(kFirstTimerKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isUserFirstTimer() async {
    try {
      return sharedPreferences.getBool(kFirstTimerKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
