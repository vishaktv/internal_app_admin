import 'package:flutter/material.dart';
import 'package:internal_app/screens/search_api.dart';
import 'package:internal_app/widgets/category_box.dart';
import 'package:internal_app/widgets/glass_frosted_container.dart';

import '../components/category_box_item.dart';
import '../components/service_section.dart';
import '../data.dart';
import '../widgets/bar_chart.dart';

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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: ServiceSection(),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Onboarding Statatics",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 5),
            child: Text(
              "last 7 days",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          GlassMorphismFrostedContainer(
            start: 0.2,
            end: 0.1,
            height: 350,
            width: double.infinity,
            child: BarChartSample(),
          ),
        ],
      ),
    );
  }
}
