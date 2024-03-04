// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:apex_test/core/cubits/connectivity/connectivity_cubit.dart'
    as _i6;
import 'package:apex_test/core/data/datasources/core_local_data_source.dart'
    as _i14;
import 'package:apex_test/core/data/repositories/core_repository_impl.dart'
    as _i16;
import 'package:apex_test/core/domain/repositories/core_repository.dart'
    as _i15;
import 'package:apex_test/core/domain/usecases/logout_usecase.dart' as _i23;
import 'package:apex_test/core/services/api_service.dart' as _i3;
import 'package:apex_test/core/services/third_party_services_module.dart'
    as _i40;
import 'package:apex_test/features/auth/data/datasources/auth_local_datasource.dart'
    as _i10;
import 'package:apex_test/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i5;
import 'package:apex_test/features/auth/data/repositories/auth_repository_impl.dart'
    as _i12;
import 'package:apex_test/features/auth/domain/repositories/auth_repository.dart'
    as _i11;
import 'package:apex_test/features/auth/domain/usecases/cache_pin_usecase.dart'
    as _i13;
import 'package:apex_test/features/auth/domain/usecases/get_email_token_usecase.dart'
    as _i17;
import 'package:apex_test/features/auth/domain/usecases/get_pin_usecase.dart'
    as _i18;
import 'package:apex_test/features/auth/domain/usecases/login_usecase.dart'
    as _i22;
import 'package:apex_test/features/auth/domain/usecases/register_usecase.dart'
    as _i27;
import 'package:apex_test/features/auth/domain/usecases/verify_email_token_usecase.dart'
    as _i29;
import 'package:apex_test/features/auth/presentation/cubits/get_email_token/get_email_token_cubit.dart'
    as _i32;
import 'package:apex_test/features/auth/presentation/cubits/login/login_cubit.dart'
    as _i35;
import 'package:apex_test/features/auth/presentation/cubits/register/register_cubit.dart'
    as _i37;
import 'package:apex_test/features/auth/presentation/cubits/setup_pin/setup_pin_cubit.dart'
    as _i28;
import 'package:apex_test/features/auth/presentation/cubits/verify_email_token/verify_email_token_cubit.dart'
    as _i38;
import 'package:apex_test/features/home/data/datasources/home_local_datasource.dart'
    as _i7;
import 'package:apex_test/features/home/data/datasources/home_remote_datasource.dart'
    as _i19;
import 'package:apex_test/features/home/data/repositories/home_repository_impl.dart'
    as _i21;
import 'package:apex_test/features/home/domain/repositories/home_repository.dart'
    as _i20;
import 'package:apex_test/features/home/domain/usecases/get_secret_usecase.dart'
    as _i33;
import 'package:apex_test/features/home/presentation/cubits/check_pin/check_pin_cubit.dart'
    as _i31;
import 'package:apex_test/features/home/presentation/cubits/get_secret/get_secret_cubit.dart'
    as _i39;
import 'package:apex_test/features/on_boarding/data/datasources/on_boarding_local_datasource.dart'
    as _i24;
import 'package:apex_test/features/on_boarding/data/repositories/on_boarding_repository_impl.dart'
    as _i26;
import 'package:apex_test/features/on_boarding/domain/repositories/on_boarding_repository.dart'
    as _i25;
import 'package:apex_test/features/on_boarding/domain/usecases/cache_first_timer_usecase.dart'
    as _i30;
import 'package:apex_test/features/on_boarding/domain/usecases/is_user_first_timer_usecase.dart'
    as _i34;
import 'package:apex_test/features/on_boarding/presentation/cubits/on_boarding/on_boarding_cubit.dart'
    as _i36;
import 'package:apex_test/navigator/guards/auth_guard.dart' as _i4;
import 'package:apex_test/navigator/guards/redirect_guard.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  await gh.lazySingletonAsync<_i3.ApiService>(
    () => thirdPartyServicesModule.apiService,
    preResolve: true,
  );
  gh.lazySingleton<_i4.AuthGuard>(() => _i4.AuthGuard());
  gh.lazySingleton<_i5.AuthRemoteDatasource>(
      () => _i5.AuthRemoteDatasourceImpl(gh<_i3.ApiService>()));
  gh.factory<_i6.ConnectivityCubit>(() => _i6.ConnectivityCubit());
  gh.lazySingleton<_i7.HomeLocalDatasource>(
      () => _i7.HomeLocalDatasourceImpl());
  gh.lazySingleton<_i8.RedirectGuard>(() => _i8.RedirectGuard());
  await gh.lazySingletonAsync<_i9.SharedPreferences>(
    () => thirdPartyServicesModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i10.AuthLocalDatasource>(() => _i10.AuthLocalDatasourceImpl(
      sharedPreferences: gh<_i9.SharedPreferences>()));
  gh.lazySingleton<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
        authRemoteDatasource: gh<_i5.AuthRemoteDatasource>(),
        authLocalDataSource: gh<_i10.AuthLocalDatasource>(),
      ));
  gh.lazySingleton<_i13.CachePinUsecase>(
      () => _i13.CachePinUsecase(authRepository: gh<_i11.AuthRepository>()));
  gh.lazySingleton<_i14.CoreLocalDataSource>(() => _i14.CoreLocalDataSourceImpl(
      sharedPreferences: gh<_i9.SharedPreferences>()));
  gh.lazySingleton<_i15.CoreRepository>(() => _i16.CoreRepositoryImpl(
      coreLocalDataSource: gh<_i14.CoreLocalDataSource>()));
  gh.lazySingleton<_i17.GetEmailTokenUsecase>(() =>
      _i17.GetEmailTokenUsecase(authRepository: gh<_i11.AuthRepository>()));
  gh.lazySingleton<_i18.GetPinUsecase>(
      () => _i18.GetPinUsecase(authRepository: gh<_i11.AuthRepository>()));
  gh.lazySingleton<_i19.HomeRemoteDatasource>(
      () => _i19.HomeRemoteDatasourceImpl(
            apiService: gh<_i3.ApiService>(),
            coreLocalDataSource: gh<_i14.CoreLocalDataSource>(),
          ));
  gh.lazySingleton<_i20.HomeRepository>(
      () => _i21.HomeRepositoryImpl(gh<_i19.HomeRemoteDatasource>()));
  gh.lazySingleton<_i22.LoginUsecase>(
      () => _i22.LoginUsecase(authRepository: gh<_i11.AuthRepository>()));
  gh.lazySingleton<_i23.LogoutUsecase>(
      () => _i23.LogoutUsecase(coreRepository: gh<_i15.CoreRepository>()));
  gh.lazySingleton<_i24.OnBoardingLocalDatasource>(
      () => _i24.OnBoardingLocalDatasourceImpl(gh<_i9.SharedPreferences>()));
  gh.lazySingleton<_i25.OnBoardingRepository>(() =>
      _i26.OnBoardingRepositoryImpl(gh<_i24.OnBoardingLocalDatasource>()));
  gh.lazySingleton<_i27.RegisterUsecase>(
      () => _i27.RegisterUsecase(authRepository: gh<_i11.AuthRepository>()));
  gh.factory<_i28.SetupPinCubit>(
      () => _i28.SetupPinCubit(gh<_i13.CachePinUsecase>()));
  gh.lazySingleton<_i29.VerifyEmailTokenUsecase>(() =>
      _i29.VerifyEmailTokenUsecase(authRepository: gh<_i11.AuthRepository>()));
  gh.lazySingleton<_i30.CacheFirstTimerUsecase>(() =>
      _i30.CacheFirstTimerUsecase(
          onBoardingRepository: gh<_i25.OnBoardingRepository>()));
  gh.factory<_i31.CheckPinCubit>(
      () => _i31.CheckPinCubit(gh<_i18.GetPinUsecase>()));
  gh.factory<_i32.GetEmailTokenCubit>(
      () => _i32.GetEmailTokenCubit(gh<_i17.GetEmailTokenUsecase>()));
  gh.lazySingleton<_i33.GetSecretUsecase>(
      () => _i33.GetSecretUsecase(homeRepository: gh<_i20.HomeRepository>()));
  gh.lazySingleton<_i34.IsUserFirstTimerUsecase>(() =>
      _i34.IsUserFirstTimerUsecase(
          onBoardingRepository: gh<_i25.OnBoardingRepository>()));
  gh.factory<_i35.LoginCubit>(() => _i35.LoginCubit(gh<_i22.LoginUsecase>()));
  gh.factory<_i36.OnBoardingCubit>(() => _i36.OnBoardingCubit(
        cacheFirstTimerUsecase: gh<_i30.CacheFirstTimerUsecase>(),
        isUserFirstTimerUsecase: gh<_i34.IsUserFirstTimerUsecase>(),
      ));
  gh.factory<_i37.RegisterCubit>(
      () => _i37.RegisterCubit(gh<_i27.RegisterUsecase>()));
  gh.factory<_i38.VerifyEmailTokenCubit>(
      () => _i38.VerifyEmailTokenCubit(gh<_i29.VerifyEmailTokenUsecase>()));
  gh.factory<_i39.GetSecretCubit>(
      () => _i39.GetSecretCubit(gh<_i33.GetSecretUsecase>()));
  return getIt;
}

class _$ThirdPartyServicesModule extends _i40.ThirdPartyServicesModule {}
