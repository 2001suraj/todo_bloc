// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/Presentation/pages/add_task_bottom_page.dart';
import 'package:todo_app/Presentation/pages/bin_page.dart';
import 'package:todo_app/Presentation/pages/drawer_page.dart';
import 'package:todo_app/Presentation/screen/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
     
      case Drawerpage.routeName:
        return MaterialPageRoute(builder: (context) => Drawerpage());
      case AddTaskBottomPage.routeName:
        return MaterialPageRoute(builder: (context) => AddTaskBottomPage());
      case BinPage.routeName:
        return MaterialPageRoute(builder: (context) => BinPage());
      case TabsScreen.routename:
        return MaterialPageRoute(builder: (context) => TabsScreen());
    }
  }
}
