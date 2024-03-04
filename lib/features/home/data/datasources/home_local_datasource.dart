import 'package:injectable/injectable.dart';

abstract class HomeLocalDatasource {}

@LazySingleton(as: HomeLocalDatasource)
class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  HomeLocalDatasourceImpl();
}
