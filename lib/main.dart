import 'package:ecommerce_seller/presentation/on_boarding_section/splash_screen/splash_screen.dart';
import 'package:ecommerce_seller/utilz/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("mainBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backGroundColor,
          appBarTheme: const AppBarTheme()
              .copyWith(color: Colors.white, surfaceTintColor: Colors.white),
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      );
    });
  }
}
