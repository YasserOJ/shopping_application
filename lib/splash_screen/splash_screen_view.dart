import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_application/core/utils/navigation_setup/app_router.gr.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config_manager.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/splash_screen/bloc/splash_screen_bloc.dart';

@RoutePage()
class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late StackRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final SplashScreenBloc splashScreenBloc =
          BlocProvider.of<SplashScreenBloc>(context);
      splashScreenBloc.add(GetAllProducts());
      if (mounted) {
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            if (splashScreenBloc.state is SplashScreenLoading) {
              _controller
                ..reset()
                ..forward();
            } else {
              _appRouter.replace(const ShopHomeRoute());
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConfigManager(
        initializeConfig: true,
        builder: (BuildContext context, Config config, StackRouter appRouter) {
          _appRouter = appRouter;
          return Container(
            color: whiteFFFFFF,
            width: config.screenWidth,
            height: config.screenHeight,
            child: Center(
              child: Lottie.asset(
                'assets/splash_animation.zip',
                controller: _controller,
                onLoaded: (LottieComposition composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
