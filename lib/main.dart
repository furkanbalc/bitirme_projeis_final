import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/feature/app_main/view_model/base_provider.dart';
import 'package:bende_fazla/feature/app_main/view_model/home_provider.dart';
import 'package:bende_fazla/feature/app_main/view_model/product_view_model.dart';
import 'package:bende_fazla/feature/app_main/view_model/profile_provider.dart';
import 'package:bende_fazla/feature/auth/view_model/index.dart';
import 'package:bende_fazla/feature/on_boarding/view_model/on_boarding_provider.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/constants/navigator_key.dart';
import 'package:bende_fazla/product/initialize/app_start.dart';
import 'package:bende_fazla/product/service/location_service.dart';
import 'package:bende_fazla/product/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await ApplicationStart.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationService>(create: (context) => LocationService()),
        ChangeNotifierProvider<OnBoardingProvider>(create: (context) => OnBoardingProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
        ChangeNotifierProvider<SignupProvider>(create: (context) => SignupProvider()),
        ChangeNotifierProvider<ForgotPasswordProvider>(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider<UserInfoProvider>(create: (context) => UserInfoProvider()),
        ChangeNotifierProvider<BaseProvider>(create: (context) => BaseProvider(context)),
        ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
        ChangeNotifierProvider<ProfileProvider>(create: (context) => ProfileProvider()),
        ChangeNotifierProvider<AddProductProvider>(create: (context) => AddProductProvider()),
        ChangeNotifierProvider<ProductViewProvider>(create: (context) => ProductViewProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.kAppName,
      theme: lightTheme(),
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.splash,
    );
  }
}
