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

  // This is a convenience method to make it easier
  // for descendant widgets to get an instance.
  static InheritedState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedState>()
          as InheritedState;

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
      title: 'InheritedWidget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // This wraps HomePage in InheritedState so
      // any descendant widgets can get the state.
      home: InheritedState(child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Demo'),
      ),
      body: Center(
        child: ChildWidget(),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = InheritedState.of(context).state;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('count = ${state.count}'),
        Text('name = ${state.name}'),
      ],
    );
  }
}
