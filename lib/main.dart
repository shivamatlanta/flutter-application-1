import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/counter_bloc.dart';
import 'package:flutter_application_1/bloc/counter_event.dart';
import 'package:flutter_application_1/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(home: CounterPage()),
    ),
  );
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Counter with BLoC')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (_, state) =>
              Text('Count: ${state.count}', style: TextStyle(fontSize: 24)),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => bloc.add(IncrementEvent()),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => bloc.add(DecrementEvent()),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );

  }
}
