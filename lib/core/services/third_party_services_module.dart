// import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apex_test/core/services/api_service.dart';

@Injectable()
@module
abstract class ThirdPartyServicesModule {
  @LazySingleton()
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @LazySingleton()
  @preResolve
  Future<ApiService> get apiService => ApiService.getInstance();
}
