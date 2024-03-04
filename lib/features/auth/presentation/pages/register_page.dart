import 'package:apex_test/core/constants/assets_constant.dart';
import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/core/utils/snack_bar.dart';
import 'package:apex_test/core/widgets/column_sized_box.dart';
import 'package:apex_test/core/widgets/generic_button.dart';
import 'package:apex_test/core/widgets/generic_text.dart';
import 'package:apex_test/core/widgets/generic_text_form_field.dart';
import 'package:apex_test/core/widgets/row_sized_box.dart';
import 'package:apex_test/features/auth/auth_constants.dart';
import 'package:apex_test/features/auth/presentation/cubits/get_email_token/get_email_token_cubit.dart';
import 'package:apex_test/features/auth/presentation/widgets/back_btn.dart';
import 'package:apex_test/features/auth/presentation/widgets/signin_with.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:apex_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late GetEmailTokenCubit _getEmailTokenCubit;

  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _validated = false;

  @override
  void initState() {
    super.initState();
    _getEmailTokenCubit = locate<GetEmailTokenCubit>();

    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getEmailTokenCubit,
      child: BlocConsumer<GetEmailTokenCubit, GetEmailTokenState>(
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
            context.pushRoute(VerifyEmailRoute(param: {
              "email": _emailController.text,
              "token": state.emailTokenEntity.token!,
            }));
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
                      ColumnSizedBox(5.h),
                      const BackBtn(),
                      ColumnSizedBox(20.h),
                      Row(
                        children: [
                          GenericText(
                            text: 'Create a ',
                            size: 24.sp,
                            weight: FontWeight.w700,
                          ),
                          GenericText(
                            text: 'Smartpay',
                            size: 24.sp,
                            weight: FontWeight.w700,
                            color: deepGreen,
                          ),
                        ],
                      ),
                      GenericText(
                        text: 'account',
                        size: 24.sp,
                        weight: FontWeight.w700,
                      ),
                      ColumnSizedBox(30.h),
                      Form(
                        key: _formKey,
                        child: FocusScope(
                          node: _focusNode,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenericTextFormField(
                                  editingController: _emailController,
                                  label: lblEmail,
                                  textCapitalization: TextCapitalization.none,
                                  inputType: TextInputType.emailAddress,
                                  isRequired: true,
                                  isBusy: state is Loading ? true : false,
                                  onEditingComplete: () => _focusNode.nextFocus(),
                                  onChanged: (val) {
                                    if (_formKey.currentState?.validate() ?? false) {
                                      _validated = true;
                                    } else {
                                      _validated = false;
                                    }
                                    setState(() {});
                                  }),
                              ColumnSizedBox(25.h),
                              GenericButton(
                                label: lblSignUp,
                                labelStyle: TextStyle(
                                  color: white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                backgroundColor: _validated ? black : grey,
                                width: MediaQuery.of(context).size.width,
                                fulCurve: false,
                                isBusy: state is Loading ? true : false,
                                onClick: () async {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    _focusNode.unfocus();
                                    _getEmailTokenCubit.getEmailToken(_emailController.text);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      ColumnSizedBox(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                color: grey.withOpacity(.3),
                              ),
                            ),
                          ),
                          RowSizedBox(10.w),
                          GenericText(
                            text: lblOr,
                            size: 14.sp,
                            color: grey,
                          ),
                          RowSizedBox(10.w),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                color: grey.withOpacity(.3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ColumnSizedBox(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(child: SigninWith(image: google)),
                          RowSizedBox(15.w),
                          const Expanded(child: SigninWith(image: apple)),
                        ],
                      ),
                      ColumnSizedBox(80.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const GenericText(
                            text: lblHaveAcct,
                            weight: FontWeight.w400,
                            color: grey,
                          ),
                          RowSizedBox(5.w),
                          InkWell(
                            onTap: () => context.pushRoute(const LoginRoute()),
                            child: const GenericText(
                              text: lblSignIn,
                              weight: FontWeight.w600,
                              color: deepGreen,
                            ),
                          ),
                        ],
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
