import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apex_test/core/cubits/connectivity/connectivity_cubit.dart';
import 'package:apex_test/core/utils/globa_keys.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:apex_test/navigator/router.dart';

class MainApexTest extends StatefulWidget {
  const MainApexTest({super.key});

  static final appRouter = AppRouter();

  @override
  State<MainApexTest> createState() => _MainApexTestState();
}

class _MainApexTestState extends State<MainApexTest> {
  late ConnectivityCubit _connectivityCubit;

  @override
  void initState() {
    super.initState();
    _connectivityCubit = locate<ConnectivityCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>.value(value: _connectivityCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Apex Test',
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: white,
            ),
            scaffoldMessengerKey: scaffoldMessengerKey,
            routerConfig: MainApexTest.appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
