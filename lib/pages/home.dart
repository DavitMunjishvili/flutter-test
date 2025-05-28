import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _message = "default";

  void _changeMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            Text(_message, style: theme.textTheme.headlineMedium),
            ...List.generate(3, (index) {
              int buttonIndex = index + 1;
              return FilledButton.tonal(
                onPressed: () => _changeMessage("Button $buttonIndex pressed"),
                child: Text('Button $buttonIndex'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
