// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app/data/model/task_model.dart';

PopupMenuButton<dynamic> cusotmPopUpMenuButton(
    {required delete,
    required TaskModel task,
    required favbtn,
    required restorebtn,
    required editbtn}) {
  return PopupMenuButton(
      itemBuilder: task.isdelete == false
          ? ((context) => [
                //edit
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: editbtn,
                    icon: Icon(Icons.edit),
                    label: Text('edit'),
                  ),
                ),
                //add to bookmark
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: task.isfav == false
                        ? Icon(Icons.bookmark_add_outlined)
                        : Icon(
                            Icons.bookmark_remove,
                          ),
                    label: task.isfav == false
                        ? Text('Add to Bookmarks')
                        : Text('Remove from Bookmarks'),
                  ),
                  onTap: favbtn,
                ),
                //delete
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.delete),
                    label: Text('delete'),
                  ),
                  onTap: delete,
                ),
              ])
          : (context) => [
                //restore
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.restore_from_trash),
                    label: Text('Restore'),
                  ),
                  onTap: restorebtn,
                ),
                //delete forever
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.delete_forever),
                    label: Text('Delete Forever'),
                  ),
                  onTap: delete,
                ),
              ]);
}
