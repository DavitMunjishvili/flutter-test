import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return const MyHomePage(title: 'Flutter Demo Home Page');
        },
        '/about': (BuildContext context) {
          return Scaffold(appBar: AppBar(title: const Text('About Route')));
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "default";

  void _incrementCounter(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (n) =>
            _incrementCounter("Navigation item selected $n"),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: Center(
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
                  onPressed: () =>
                      _incrementCounter("Button $buttonIndex pressed"),
                  child: Text('Button $buttonIndex'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
