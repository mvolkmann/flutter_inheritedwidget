import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class AppState {
  var count = 19;
  var name = 'Mark';
}

class InheritedState extends InheritedWidget {
  final state = AppState();

  InheritedState({
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static InheritedState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedState>();

  @override
  bool updateShouldNotify(InheritedState oldWidget) {
    return oldWidget.state != state;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InheritedState(child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = InheritedState.of(context)!.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO: Learn how to update state in InheritedWidget
            //TODO: and trigger other widgets that use it to rebuild.
            Text('count = ${state.count}'),
            Text('name = ${state.name}'),
          ],
        ),
      ),
    );
  }
}
