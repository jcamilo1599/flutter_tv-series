import 'package:flutter/material.dart';

class AtomAlert extends StatelessWidget {
  final String title;
  final String description;

  const AtomAlert({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(
        description,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
