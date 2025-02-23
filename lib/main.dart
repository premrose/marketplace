import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/dashboard/bloc/dashboard_bloc.dart';
import 'modules/dashboard/view/dashboard_screen.dart';
import 'modules/post_details/bloc/post_details_bloc.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
            create: (BuildContext context) => DashboardBloc()),
        BlocProvider<PostDetailsBloc>(
            create: (BuildContext context) => PostDetailsBloc())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.dark,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: child);
        },
        child: DashboardScreen(),
      ),
    );
  }
}
