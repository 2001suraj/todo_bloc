import 'package:flutter/material.dart';
import 'package:todo_app/Presentation/pages/add_task_bottom_page.dart';
import 'package:todo_app/Presentation/pages/drawer_page.dart';
import 'package:todo_app/Presentation/screen/complete_screen.dart';
import 'package:todo_app/Presentation/screen/favorite_screen.dart';
import 'package:todo_app/Presentation/screen/pending_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String routename = 'tabs-screen';
  TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> pageDetails = [
    {'PageName': PendingScreen(), 'title': 'Pending Tasks'},
    {'PageName': CompleteScreen(), 'title': 'Completed Task'},
    {'PageName': FavoriteScreen(), 'title': 'Favorite Task'}
  ];

  var selectedPageIndex = 0;

  void addTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageDetails[selectedPageIndex]['title']),
        actions: [
          IconButton(onPressed: () => addTask(context), icon: Icon(Icons.add))
        ],
      ),
      drawer: Drawerpage(),
      body: pageDetails[selectedPageIndex]['PageName'],
      floatingActionButton: selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => addTask(context),
              child: Icon(Icons.add),
              tooltip: 'Add Tasks',
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: (index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp),
              label: 'Pending Tasks '),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Complete task '),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Tasks '),
        ],
      ),
    );
  }
}
