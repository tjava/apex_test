import 'package:apex_test/core/constants/assets_constant.dart';
import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/core/utils/snack_bar.dart';
import 'package:apex_test/core/widgets/column_sized_box.dart';
import 'package:apex_test/core/widgets/generic_button.dart';
import 'package:apex_test/core/widgets/generic_rich_text.dart';
import 'package:apex_test/core/widgets/generic_text.dart';
import 'package:apex_test/core/widgets/generic_text_form_field.dart';
import 'package:apex_test/core/widgets/row_sized_box.dart';
import 'package:apex_test/features/auth/auth_constants.dart';
import 'package:apex_test/features/auth/domain/entities/login_payload_entity.dart';
import 'package:apex_test/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:apex_test/features/auth/presentation/widgets/back_btn.dart';
import 'package:apex_test/features/auth/presentation/widgets/signin_with.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:apex_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit _loginCubit;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _loginCubit = locate<LoginCubit>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginCubit,
      child: BlocConsumer<LoginCubit, LoginState>(
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
            context.pushRoute(const HomeRoute());
          }

          if (state is ShowPassword) {
            _obscure = state.showPassword;
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
                      GenericText(
                        text: lblThere,
                        size: 24.sp,
                        weight: FontWeight.w600,
                      ),
                      ColumnSizedBox(3.h),
                      GenericRichText(
                        text: lblWelcome,
                        lineHeight: 1.4.sp,
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
                              ),
                              ColumnSizedBox(20.h),
                              GenericTextFormField(
                                editingController: _passwordController,
                                label: lblPass,
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                obscureText: _obscure,
                                onEditingComplete: () => _focusNode.nextFocus(),
                                suffixIcon: Icon(
                                  _obscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: grey,
                                ),
                                onSuffixIconClick: () {
                                  _loginCubit.showPassword(_obscure);
                                },
                              ),
                              ColumnSizedBox(15.h),
                              const GenericText(
                                text: lblForgotPass,
                                weight: FontWeight.w600,
                                color: deepGreen,
                              ),
                              ColumnSizedBox(25.h),
                              GenericButton(
                                label: lblSignIn,
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
                                  if (_formKey.currentState?.validate() ?? false) {
                                    _focusNode.unfocus();
                                    _loginCubit.login(LoginPayloadEntity(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      deviceName: 'web',
                                    ));
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
                      ColumnSizedBox(60.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const GenericText(
                            text: lblDntHaveAcct,
                            weight: FontWeight.w400,
                            color: grey,
                          ),
                          RowSizedBox(5.w),
                          InkWell(
                            onTap: () => context.pushRoute(const RegisterRoute()),
                            child: const GenericText(
                              text: lblSignUp,
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
