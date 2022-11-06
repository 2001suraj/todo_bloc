// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/Presentation/pages/bin_page.dart';
import 'package:todo_app/Presentation/screen/tabs_screen.dart';

import '../../business_logic/blocs/bloc_exports.dart';

class Drawerpage extends StatelessWidget {
  static const String routeName = 'drawer-page';
  Drawerpage({Key? key}) : super(key: key);

  bool switchvalue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              color: Colors.grey,
              child: Text('Task Drawer'),
            ),
            BlocBuilder<TaskBloc, TaskInitialState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(TabsScreen.routename);
                  },
                  child: ListTile(
                    leading: Icon(Icons.folder_special),
                    title: Text('My Tasks'),
                    trailing: Text('${state.pendingTask.length}'),
                  ),
                );
              },
            ),
            Divider(),
            BlocBuilder<TaskBloc, TaskInitialState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(BinPage.routeName);
                  },
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Bin'),
                    trailing: Text('${state.removedTask.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                    value: state.switchValue,
                    onChanged: (newvalue) {
                      newvalue
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
