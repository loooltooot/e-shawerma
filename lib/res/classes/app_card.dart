import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Image image;
  final String title;

  const AppCard({
    Key? key,
    required this.title,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: image,
        title: Text(title),
        trailing: const Icon(Icons.add),
      ),
    );
  }
}
