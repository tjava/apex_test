import 'package:apex_test/core/data/datasources/core_local_data_source.dart';
import 'package:apex_test/core/services/api_service.dart';
import 'package:apex_test/features/home/data/models/secret_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDatasource {
  Future<SecretModel> getSecret();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiService apiService;
  final CoreLocalDataSource coreLocalDataSource;
  HomeRemoteDatasourceImpl({required this.apiService, required this.coreLocalDataSource});

  @override
  Future<SecretModel> getSecret() async {
    final String accessToken = 'Bearer ${await coreLocalDataSource.getAccessToken()}';
    final SecretModel secretModel = await apiService.getSecret(token: accessToken);
    return secretModel;
  }
}
