import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/core/utils/snack_bar.dart';
import 'package:apex_test/core/utils/text_field_validators.dart';
import 'package:apex_test/core/widgets/column_sized_box.dart';
import 'package:apex_test/core/widgets/generic_button.dart';
import 'package:apex_test/core/widgets/generic_text.dart';
import 'package:apex_test/core/widgets/generic_text_form_field.dart';
import 'package:apex_test/features/auth/auth_constants.dart';
import 'package:apex_test/features/auth/domain/entities/register_payload_entity.dart';
import 'package:apex_test/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:apex_test/features/auth/presentation/widgets/back_btn.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:apex_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class RegisterSecondPage extends StatefulWidget {
  final String email;
  const RegisterSecondPage({super.key, required this.email});

  @override
  State<RegisterSecondPage> createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
  late RegisterCubit _registerCubit;

  late TextEditingController _fullNameController;
  late TextEditingController _userNameController;
  late TextEditingController _emailNameController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _registerCubit = locate<RegisterCubit>();

    _fullNameController = TextEditingController();
    _userNameController = TextEditingController();
    _emailNameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _emailNameController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _registerCubit,
      child: BlocConsumer<RegisterCubit, RegisterState>(
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
            context.pushRoute(const SetupPinRoute());
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
                        text: 'Hey there! tell us a bit ',
                        size: 24.sp,
                        weight: FontWeight.w700,
                      ),
                      Row(
                        children: [
                          GenericText(
                            text: 'about ',
                            size: 24.sp,
                            weight: FontWeight.w700,
                          ),
                          GenericText(
                            text: 'yourself',
                            size: 24.sp,
                            weight: FontWeight.w700,
                            color: deepGreen,
                          ),
                        ],
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
                                editingController: _fullNameController,
                                label: lblFullName,
                                textCapitalization: TextCapitalization.words,
                                inputType: TextInputType.text,
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                onEditingComplete: () => _focusNode.nextFocus(),
                              ),
                              ColumnSizedBox(20.h),
                              GenericTextFormField(
                                editingController: _userNameController,
                                label: lblUserName,
                                textCapitalization: TextCapitalization.words,
                                inputType: TextInputType.text,
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                onEditingComplete: () => _focusNode.nextFocus(),
                              ),
                              ColumnSizedBox(20.h),
                              GenericTextFormField(
                                editingController: _emailNameController,
                                label: widget.email,
                                textCapitalization: TextCapitalization.words,
                                inputType: TextInputType.text,
                                isBusy: true,
                                onEditingComplete: () => _focusNode.nextFocus(),
                              ),
                              ColumnSizedBox(20.h),
                              GenericTextFormField(
                                editingController: _passwordController,
                                label: lblPass,
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                obscureText: _obscure,
                                validators: [
                                  containsLowercaseValidator,
                                  containsUppercaseValidator,
                                  containsNumericValidator,
                                  containsCharacterValidator,
                                  notContainWhiteSpace,
                                  charactersLengthValidator(6),
                                ],
                                onEditingComplete: () => _focusNode.nextFocus(),
                                suffixIcon: Icon(
                                  _obscure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: grey,
                                ),
                                onSuffixIconClick: () {
                                  _registerCubit.showPassword(_obscure);
                                },
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
                                    _registerCubit.register(RegisterPayloadEntity(
                                      fullName: _fullNameController.text,
                                      username: _userNameController.text,
                                      email: widget.email,
                                      country: 'NG',
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
