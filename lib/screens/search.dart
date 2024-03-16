import 'package:flutter/material.dart';
import 'package:internal_app/data.dart';
import 'package:internal_app/screens/search_api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final bool showTextField = false;
  @override
  void initState() {
    super.initState();
    print("object from search page");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "APIs",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchApiScreen(
                        apiType: CredApiType.ALL.name,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
          ),
          // Expanded(child: APiTabList())
        ],
      ),
    );
  }
}
