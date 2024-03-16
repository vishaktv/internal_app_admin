import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internal_app/bloc/auth/auth_bloc.dart';
import 'package:internal_app/components/cred_ai_title.dart';
import 'package:internal_app/page_contents/Home_page_contents.dart';
import 'package:internal_app/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = new FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> deleteToken() async {
    try {
      await storage.deleteAll();
      return true; // Deletion succeeded
    } catch (e) {
      print("Error deleting token: $e");
      return false; // Deletion failed
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is userIsNotLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        print(state);
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            scrolledUnderElevation: 2,
            backgroundColor: Colors.transparent,
            title: CredAiHeader(),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                size: 36,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    final bool tokendeleted = await deleteToken();
                    if (tokendeleted) {
                      context.read<AuthBloc>().add(AuthSessionHandlingEvent());
                    }
                  },
                  icon: Icon(Icons.login_outlined))
            ],
          ),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: HomePageContents(),
          ),
        );
      },
    );
  }
}
