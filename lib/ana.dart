import 'package:ana/app/config/app_color.dart';
import 'package:ana/app/routes/app_pages.dart';
import 'package:ana/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Ana extends StatelessWidget {
  const Ana({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Fixing App Orientation.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: primaryColor,
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(dark);

    return  ScreenUtilInit(
      designSize: const Size(375,812),
      builder : ()=> GetMaterialApp(
        title: 'Ana',
        theme: ThemeData(

          //primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.login,
        getPages: AppPages.list,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
