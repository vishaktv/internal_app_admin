import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internal_app/bloc/auth/auth_bloc.dart';
import 'package:internal_app/screens/block_screen.dart';
import 'package:internal_app/screens/home.dart';
import 'package:internal_app/screens/login_screen.dart';
import 'package:internal_app/screens/search.dart';
import '../repository/api.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final storage = new FlutterSecureStorage();
  final ApiRepository apiCall = ApiRepository();
  int currentPage = 0;
  final PageController pageController = PageController();
  final List<Widget> pages = [HomeScreen(), SearchScreen(), BlockListScreen()];
  @override
  void initState() {
    super.initState();
    print("index page");
    context.read<AuthBloc>().add(AuthSessionHandlingEvent());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is userIsLoggedIn) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
