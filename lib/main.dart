// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/Presentation/screen/tabs_screen.dart';

import 'package:todo_app/data/services/app_route.dart';
import 'package:todo_app/data/services/app_theme.dart';

import 'business_logic/blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  // BlocOverrides.runZoned(
  // () =>
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchBloc())
      ],
      child: MyApp(appRouter: AppRouter()),
    ),
  );
  // );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: state.switchValue
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme],
          home: TabsScreen(),
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      },
    );
  }
}
