import 'package:flutter/material.dart';
import 'package:internal_app/screens/search_api.dart';
import 'package:internal_app/widgets/category_box.dart';

import '../components/category_box_item.dart';
import '../data.dart';

class HomePageContents extends StatefulWidget {
  const HomePageContents({super.key});

  @override
  State<HomePageContents> createState() => _HomePageContentsState();
}

class _HomePageContentsState extends State<HomePageContents> {
  final List<Map<String, String>> categories = [
    {
      "primaryText": "FINXACT",
      "secondaryText": "/rcs/secure",
      "apiType": CredApiType.FINXACT.name
    },
    {
      "primaryText": "PLAID",
      "secondaryText": "rci/internal",
      "apiType": CredApiType.PLAID.name
    },
    {
      "primaryText": "PAYTRACE",
      "secondaryText": "rci/internal",
      "apiType": CredApiType.PAYTRACE.name
    },
    {
      "primaryText": "RCA",
      "secondaryText": "rca/general",
      "apiType": CredApiType.RCA.name
    },
    {
      "primaryText": "RCS",
      "secondaryText": "rcs/secure",
      "apiType": CredApiType.RCS.name
    },
    {
      "primaryText": "RCI",
      "secondaryText": "rci/internal",
      "apiType": CredApiType.RCI.name
    },
    {
      "primaryText": "I2C",
      "secondaryText": "rci/internal",
      "apiType": CredApiType.I2C.name
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Services",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryBoxItem(),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryBoxItem(),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryBoxItem(),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryBoxItem(),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryBoxItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
