import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/core/utils/snack_bar.dart';
import 'package:apex_test/core/widgets/column_sized_box.dart';
import 'package:apex_test/core/widgets/generic_button.dart';
import 'package:apex_test/core/widgets/generic_rich_text.dart';
import 'package:apex_test/features/home/home_constants.dart';
import 'package:apex_test/features/home/presentation/cubits/get_secret/get_secret_cubit.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetSecretCubit _getSecretCubit;

  @override
  void initState() {
    super.initState();

    _getSecretCubit = locate<GetSecretCubit>();

    _getSecretCubit.getSecret();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getSecretCubit,
      child: BlocConsumer<GetSecretCubit, GetSecretState>(
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(
                context: context,
                message: state.message,
                color: red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state is Loaded
                      ? GenericRichText(
                          text: state.secretEntity.secret,
                          size: 18.sp,
                          weight: FontWeight.w400,
                        )
                      : const SizedBox(),
                  ColumnSizedBox(30.h),
                  GenericButton(
                    label: lblSecret,
                    labelStyle: TextStyle(
                      color: white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    backgroundColor: black,
                    width: MediaQuery.of(context).size.width,
                    fulCurve: false,
                    isBusy: state is Loading ? true : false,
                    onClick: () async {
                      _getSecretCubit.getSecret();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
