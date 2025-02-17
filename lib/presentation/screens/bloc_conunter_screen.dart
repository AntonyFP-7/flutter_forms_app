import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/bloc/counter_bloc.dart';

class BlocConunterScreen extends StatelessWidget {
  const BlocConunterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void incrementCounterBy(BuildContext context, [int value = 1]) {
    //context.read<CounterBloc>().add(CounterIncreased(value: value));
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) =>
            Text('Bloc Counter: ${counterBloc.state.transactionCount}')),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SettingsScreen()));
              //context.read<CounterBloc>().add(CounterReset());
              context.read<CounterBloc>().resetCounter();
            },
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text('Counter value: ${counterBloc.state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => incrementCounterBy(context, 3),
            tooltip: 'Increment',
            child: const Text('+3'),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => incrementCounterBy(context, 2),
            tooltip: 'Increment',
            child: const Text('+2'),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => incrementCounterBy(context),
            tooltip: 'Increment',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
