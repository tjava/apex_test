import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/core/constants/string_constant.dart';
import 'package:apex_test/core/utils/globa_keys.dart';
import 'package:apex_test/core/widgets/generic_text.dart';
import 'package:apex_test/core/widgets/row_sized_box.dart';

part 'connectivity_state.dart';

@injectable
class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivityStreamSubscription;

  ConnectivityCubit() : super(ConnectivityInitial()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 16.sp,
                  color: white,
                ),
                RowSizedBox(10.w),
                GenericText(
                  text: errNoInternet,
                  size: 12.sp,
                  color: white,
                ),
              ],
            ),
            backgroundColor: red,
            duration: const Duration(days: 1),
          ),
        );
      } else {
        scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
