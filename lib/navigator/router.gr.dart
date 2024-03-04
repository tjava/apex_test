// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:apex_test/features/auth/presentation/pages/login_page.dart'
    as _i3;
import 'package:apex_test/features/auth/presentation/pages/register_page.dart'
    as _i5;
import 'package:apex_test/features/auth/presentation/pages/register_second_page.dart'
    as _i6;
import 'package:apex_test/features/auth/presentation/pages/setup_pin_page.dart'
    as _i7;
import 'package:apex_test/features/auth/presentation/pages/verify_email_page.dart'
    as _i8;
import 'package:apex_test/features/home/presentation/pages/check_pin_page.dart'
    as _i1;
import 'package:apex_test/features/home/presentation/pages/home_page.dart'
    as _i2;
import 'package:apex_test/features/on_boarding/presentation/pages/on_boarding_page.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CheckPinRoute.name: (routeData) {
      final args = routeData.argsAs<CheckPinRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CheckPinPage(
          key: args.key,
          onClick: args.onClick,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnBoardingPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterPage(),
      );
    },
    RegisterSecondRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterSecondRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RegisterSecondPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    SetupPinRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SetupPinPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyEmailRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.VerifyEmailPage(
          key: args.key,
          param: args.param,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CheckPinPage]
class CheckPinRoute extends _i9.PageRouteInfo<CheckPinRouteArgs> {
  CheckPinRoute({
    _i10.Key? key,
    required Function onClick,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CheckPinRoute.name,
          args: CheckPinRouteArgs(
            key: key,
            onClick: onClick,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckPinRoute';

  static const _i9.PageInfo<CheckPinRouteArgs> page =
      _i9.PageInfo<CheckPinRouteArgs>(name);
}

class CheckPinRouteArgs {
  const CheckPinRouteArgs({
    this.key,
    required this.onClick,
  });

  final _i10.Key? key;

  final Function onClick;

  @override
  String toString() {
    return 'CheckPinRouteArgs{key: $key, onClick: $onClick}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OnBoardingPage]
class OnBoardingRoute extends _i9.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterSecondPage]
class RegisterSecondRoute extends _i9.PageRouteInfo<RegisterSecondRouteArgs> {
  RegisterSecondRoute({
    _i10.Key? key,
    required String email,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          RegisterSecondRoute.name,
          args: RegisterSecondRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterSecondRoute';

  static const _i9.PageInfo<RegisterSecondRouteArgs> page =
      _i9.PageInfo<RegisterSecondRouteArgs>(name);
}

class RegisterSecondRouteArgs {
  const RegisterSecondRouteArgs({
    this.key,
    required this.email,
  });

  final _i10.Key? key;

  final String email;

  @override
  String toString() {
    return 'RegisterSecondRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i7.SetupPinPage]
class SetupPinRoute extends _i9.PageRouteInfo<void> {
  const SetupPinRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SetupPinRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupPinRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.VerifyEmailPage]
class VerifyEmailRoute extends _i9.PageRouteInfo<VerifyEmailRouteArgs> {
  VerifyEmailRoute({
    _i10.Key? key,
    required Map<String, dynamic> param,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          VerifyEmailRoute.name,
          args: VerifyEmailRouteArgs(
            key: key,
            param: param,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i9.PageInfo<VerifyEmailRouteArgs> page =
      _i9.PageInfo<VerifyEmailRouteArgs>(name);
}

class VerifyEmailRouteArgs {
  const VerifyEmailRouteArgs({
    this.key,
    required this.param,
  });

  final _i10.Key? key;

  final Map<String, dynamic> param;

  @override
  String toString() {
    return 'VerifyEmailRouteArgs{key: $key, param: $param}';
  }
}
