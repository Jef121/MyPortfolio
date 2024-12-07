import 'package:flutter/material.dart';

class TodoMenuItem {
  TodoMenuItem({required this.title, required this.icon});
  final String title;
  final Icon icon;
}

List<TodoMenuItem> foodMenuList = [
  TodoMenuItem(title: 'Me', icon: const Icon(Icons.person_2_outlined)),
  TodoMenuItem(title: 'Movies', icon: const Icon(Icons.movie)),
  TodoMenuItem(title: 'Remind Me', icon: const Icon(Icons.add_alarm)),
  TodoMenuItem(title: 'Music', icon: const Icon(Icons.audiotrack)),
];

class PopupMenuButtonWidget extends StatelessWidget implements PreferredSizeWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen.shade100,
      height: 50.0, 
      width: double.infinity,
      child: Center(
        child: PopupMenuButton<TodoMenuItem>(
          icon: const Icon(
            Icons.view_list,
            size: 16.0,
            color: Colors.black87,
          ),
          onSelected: (valueSelected) {
            print('valueSelected: ${valueSelected.title}');
          },
          itemBuilder: (BuildContext context) {
            return foodMenuList.map((TodoMenuItem todoMenuItem) {
              return PopupMenuItem<TodoMenuItem>(
                value: todoMenuItem,
                child: Row(
                  children: <Widget>[
                    Icon(
                      todoMenuItem.icon.icon,
                      size: 14.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      todoMenuItem.title,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
