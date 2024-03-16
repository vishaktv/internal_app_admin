import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internal_app/bloc/auth/auth_bloc.dart';
import 'package:internal_app/screens/index.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(
        create: (BuildContext context) => AuthBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cred internal App',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: IndexPage(),
    );
  }
}