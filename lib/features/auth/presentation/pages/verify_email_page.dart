import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/core/utils/snack_bar.dart';
import 'package:apex_test/core/widgets/column_sized_box.dart';
import 'package:apex_test/core/widgets/generic_button.dart';
import 'package:apex_test/core/widgets/generic_rich_text.dart';
import 'package:apex_test/core/widgets/generic_text.dart';
import 'package:apex_test/core/widgets/generic_text_form_field.dart';
import 'package:apex_test/features/auth/auth_constants.dart';
import 'package:apex_test/features/auth/presentation/cubits/verify_email_token/verify_email_token_cubit.dart';
import 'package:apex_test/features/auth/presentation/widgets/back_btn.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:apex_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class VerifyEmailPage extends StatefulWidget {
  final Map<String, dynamic> param;
  const VerifyEmailPage({super.key, required this.param});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late VerifyEmailTokenCubit _verifyEmailTokenCubit;

  late TextEditingController _verifyCode1Controller;
  late TextEditingController _verifyCode2Controller;
  late TextEditingController _verifyCode3Controller;
  late TextEditingController _verifyCode4Controller;
  late TextEditingController _verifyCode5Controller;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _validated = false;

  @override
  void initState() {
    super.initState();
    _verifyEmailTokenCubit = locate<VerifyEmailTokenCubit>();

    _verifyCode1Controller = TextEditingController();
    _verifyCode2Controller = TextEditingController();
    _verifyCode3Controller = TextEditingController();
    _verifyCode4Controller = TextEditingController();
    _verifyCode5Controller = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _verifyCode1Controller.dispose();
    _verifyCode2Controller.dispose();
    _verifyCode3Controller.dispose();
    _verifyCode4Controller.dispose();
    _verifyCode5Controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _verifyEmailTokenCubit,
      child: BlocConsumer<VerifyEmailTokenCubit, VerifyEmailTokenState>(
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

          if (state is Loaded) {
            context.pushRoute(RegisterSecondRoute(email: state.emailTokenEntity.email!));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnSizedBox(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BackBtn(),
                          GenericText(
                            text: 'Enter: ${widget.param['token']}',
                            size: 20.sp,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      ColumnSizedBox(20.h),
                      GenericText(
                        text: lblVerify,
                        size: 24.sp,
                        weight: FontWeight.w600,
                      ),
                      ColumnSizedBox(10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: GenericRichText(
                          text: lblVerifyDesc,
                          lineHeight: 1.4.sp,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ColumnSizedBox(30.h),
                      Form(
                        key: _formKey,
                        child: FocusScope(
                          node: _focusNode,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ColumnSizedBox(5.h),
                                  SizedBox(
                                    height: 48.h,
                                    width: 48.w,
                                    child: GenericTextFormField(
                                      editingController: _verifyCode1Controller,
                                      label: '',
                                      inputType: TextInputType.number,
                                      isRequired: true,
                                      isBusy: state is Loading ? true : false,
                                      showErrorMsg: false,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        if (_formKey.currentState?.validate() ?? false) {
                                          _validated = true;
                                        } else {
                                          _validated = false;
                                        }
                                        if (value.length == 1) {
                                          _focusNode.nextFocus();
                                        }
                                        setState(() {});
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48.h,
                                    width: 48.w,
                                    child: GenericTextFormField(
                                      editingController: _verifyCode2Controller,
                                      label: '',
                                      inputType: TextInputType.number,
                                      isRequired: true,
                                      isBusy: state is Loading ? true : false,
                                      showErrorMsg: false,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        if (_formKey.currentState?.validate() ?? false) {
                                          _validated = true;
                                        } else {
                                          _validated = false;
                                        }
                                        if (value.length == 1) {
                                          _focusNode.nextFocus();
                                        }
                                        setState(() {});
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48.h,
                                    width: 48.w,
                                    child: GenericTextFormField(
                                      editingController: _verifyCode3Controller,
                                      label: '',
                                      inputType: TextInputType.number,
                                      isRequired: true,
                                      isBusy: state is Loading ? true : false,
                                      showErrorMsg: false,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        if (_formKey.currentState?.validate() ?? false) {
                                          _validated = true;
                                        } else {
                                          _validated = false;
                                        }
                                        if (value.length == 1) {
                                          _focusNode.nextFocus();
                                        }
                                        setState(() {});
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48.h,
                                    width: 48.w,
                                    child: GenericTextFormField(
                                      editingController: _verifyCode4Controller,
                                      label: '',
                                      inputType: TextInputType.number,
                                      isRequired: true,
                                      isBusy: state is Loading ? true : false,
                                      showErrorMsg: false,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        if (_formKey.currentState?.validate() ?? false) {
                                          _validated = true;
                                        } else {
                                          _validated = false;
                                        }
                                        if (value.length == 1) {
                                          _focusNode.nextFocus();
                                        }
                                        setState(() {});
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48.h,
                                    width: 48.w,
                                    child: GenericTextFormField(
                                      editingController: _verifyCode5Controller,
                                      label: '',
                                      inputType: TextInputType.number,
                                      isRequired: true,
                                      isBusy: state is Loading ? true : false,
                                      showErrorMsg: false,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        if (_formKey.currentState?.validate() ?? false) {
                                          _validated = true;
                                        } else {
                                          _validated = false;
                                        }
                                        if (value.length == 1) {
                                          _focusNode.nextFocus();
                                        }
                                        setState(() {});
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              ColumnSizedBox(20.h),
                              const GenericText(
                                text: 'Resend Code 30 secs',
                                weight: FontWeight.w700,
                                color: grey,
                              ),
                              ColumnSizedBox(50.h),
                              GenericButton(
                                label: lblConfirm,
                                labelStyle: TextStyle(
                                  color: white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                backgroundColor: _validated ? black : grey,
                                width: MediaQuery.of(context).size.width,
                                isBusy: state is Loading ? true : false,
                                fulCurve: false,
                                onClick: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    _focusNode.unfocus();
                                    final code =
                                        '${_verifyCode1Controller.text}${_verifyCode2Controller.text}${_verifyCode3Controller.text}${_verifyCode4Controller.text}${_verifyCode5Controller.text}';
                                    // print(code);
                                    _verifyEmailTokenCubit.verifyEmailToken({
                                      "email": widget.param['email'],
                                      "token": code,
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
