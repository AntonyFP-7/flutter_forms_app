import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/count_cubit/counter_cubit.dart';

class CubitConunterScreen extends StatelessWidget {
  const CubitConunterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();
  void incrementCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    //final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => context.read<CounterCubit>().reset(),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          //buildWhen: (previous, current) => current.counter!=previous.counter,
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
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
