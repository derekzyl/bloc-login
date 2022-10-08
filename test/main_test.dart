import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener:
            (context, state) {
          if (state.wasIncrease) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('increased'),
                duration: Duration(milliseconds: 300),
              ),);
          }
          if (!state.wasIncrease) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('decreased'),
                duration: Duration(milliseconds: 300),
              ),);
          }
        },
        child: BlocConsumer<CounterCubit, CounterState>(
          listener:    (context, state) {
            if (state.wasIncrease) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('increased'),
                  duration: Duration(milliseconds: 300),
                ),);
            }
            if (!state.wasIncrease) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('decreased'),
                  duration: Duration(milliseconds: 300),
                ),);
            }
          },
          builder: (context, state) {
            return Center(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                Text(
                        state.counterVal.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4,
                      ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      FloatingActionButton(onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrease();
                      },
                        tooltip: 'decrease', child: Icon(Icons.remove),),

                      FloatingActionButton(onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increase();
                      }, tooltip: 'increase', child: Icon(Icons.add),)


                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
