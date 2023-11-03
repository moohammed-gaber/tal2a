import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.leading,
      required this.title,
      required this.onTap,
      required this.onTabDelete})
      : super(key: key);
  final String leading, title;
  final VoidCallback onTabDelete;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        trailing: IconButton(
            onPressed: onTabDelete,
            icon: Icon(
              Icons.delete_outline,
              color: Colors.red,
            )),
        leading: Text(leading),
        title: Text(title));
  }
}
