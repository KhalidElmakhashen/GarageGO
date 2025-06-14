
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/core/di/dependency_injection.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/core/init/init_hive.dart';
import 'package:legarage/core/routing/app_router.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/core/services/notification_service.dart';
import 'package:legarage/core/services/signalR_service.dart';
import 'package:legarage/core/theming/light_mode.dart';
import 'package:legarage/core/helpers/extensions.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await initHive();                
  await NotificationService().init();
  await SignalRService().init();
  // await SignalRService().invokSpot();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lighMode,
        initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  // just for development purposes i switch the condition , after done make true--> then false
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}