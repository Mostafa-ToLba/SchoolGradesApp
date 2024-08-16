import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tkwinsa_task/business_logic/setup/provider_setup.dart';
import 'package:tkwinsa_task/data/cache_helper/cache_helper.dart';
import 'package:tkwinsa_task/presentation/screens/home_page/home_page.dart';
import 'package:tkwinsa_task/presentation/screens/login_screen/login_screen.dart';
import 'package:tkwinsa_task/utils/color_resource/color_resources.dart';

 main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupLocator();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'tkwinsa_task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorResources.mainColor),
            useMaterial3: true,
          ),
          home: CacheHelper.getData(key: PrefKeys.TOKEN) == null? const LoginScreen():const HomePage(),
        ),
      ),
    );
  }
}
