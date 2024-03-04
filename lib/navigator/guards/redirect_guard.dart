import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/domain/repositories/core_repository.dart';
import 'package:apex_test/core/errors/failures.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:apex_test/navigator/router.gr.dart';

@lazySingleton
class RedirectGuard extends AutoRouteGuard {
  final CoreRepository coreRepository = locate<CoreRepository>();

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final Either<Failure, String?> result = await coreRepository.getAccessToken();
    result.fold(
      (Failure failure) async {
        resolver.next(true);
      },
      (String? value) {
        if (value != '' && value != null) {
          router.replaceAll([const HomeRoute()]);
        } else {
          resolver.next(true);
        }
      },
    );
  }
}
