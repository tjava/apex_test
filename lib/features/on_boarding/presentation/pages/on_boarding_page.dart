import 'package:apex_test/core/widgets/generic_button.dart';
import 'package:apex_test/core/widgets/generic_text.dart';
import 'package:apex_test/features/on_boarding/on_boarding_constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:apex_test/features/on_boarding/presentation/widgets/on_boarding_first.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/features/on_boarding/presentation/cubits/on_boarding/on_boarding_cubit.dart';
import 'package:apex_test/features/on_boarding/presentation/widgets/on_boarding_second.dart';
import 'package:apex_test/locator/locate.dart';
import 'package:apex_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late OnBoardingCubit _onBoardingCubit;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _onBoardingCubit = locate<OnBoardingCubit>();
    _onBoardingCubit.isUserFirstTimer();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnBoardingCubit>.value(value: _onBoardingCubit),
      ],
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingStatus && !state.isFirstTimer) {
            context.replaceRoute(const LoginRoute());
          } else if (state is UserCached) {
            context.replaceRoute(const LoginRoute());
          }
        },
        builder: (context, state) {
          if (state is CheckingIsUserFirstTimer) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: Scaffold(
              backgroundColor: white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 15.h),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GenericText(
                        text: 'Skip',
                        size: 16.sp,
                        weight: FontWeight.w600,
                        color: lightGreen,
                      ),
                    ),
                    PageView(
                      controller: _pageController,
                      children: const [
                        OnBoardingFirst(),
                        OnBoardingSecound(),
                      ],
                    ),
                    Align(
                      alignment: const Alignment(0, .62),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 2,
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 40,
                          activeDotColor: black,
                          dotColor: grey,
                        ),
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, .88),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: GenericButton(
                          label: lblGetStarted,
                          width: MediaQuery.of(context).size.width,
                          backgroundColor: black,
                          labelStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: white,
                          ),
                          fulCurve: false,
                          isBusy: state is CachingFirstTimer ? true : false,
                          onClick: () {
                            context.read<OnBoardingCubit>().cacheFirstTimer();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
