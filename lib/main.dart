import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_application/core/utils/dependency_injection/component/app_component.dart';
import 'package:shopping_application/core/utils/navigation_setup/app_router.dart';
import 'package:shopping_application/core/utils/ui_utils/values/app_colors.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/product_details_bloc/product_details_bloc.dart';
import 'package:shopping_application/modules/shop/presentation/bloc/shop_home_bloc/shop_home_bloc.dart';
import 'package:shopping_application/splash_screen/bloc/splash_screen_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AssetLottie('assets/splash_animation.zip').load();
  await initAppComponentLocator();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashScreenBloc>(
          create: (BuildContext context) => locator<SplashScreenBloc>(),
        ),
        BlocProvider<ShopHomeBloc>(
          create: (BuildContext context) => locator<ShopHomeBloc>(),
        ),
        BlocProvider<ProductDetailsBloc>(
          create: (BuildContext context) => locator<ProductDetailsBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => locator<CartBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: blue1C43CB),
          useMaterial3: true,
        ),
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          Localized.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const AppLocalizationDelegate().supportedLocales,
      ),
    );
  }
}
