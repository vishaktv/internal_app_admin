import 'package:flutter/material.dart';
import 'package:internal_app/data.dart';
import 'package:internal_app/widgets/api_item.dart';
import 'package:internal_app/widgets/tab_panel_section.dart';

class APiTabList extends StatefulWidget {
  const APiTabList({super.key});

  @override
  State<APiTabList> createState() => _APiTabListState();
}

class _APiTabListState extends State<APiTabList> {
  TabBar get _tabBar => TabBar(
        tabs: [
          Container(
            width: 50,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Tab(
                text: "RCA",
              ),
            ),
          ),
          Container(
            width: 50,
            child: Tab(
              text: "RCS",
            ),
          ),
          Container(
            width: 50,
            child: Tab(
              text: "RCI",
            ),
          ),
          Container(
            width: 75,
            child: Tab(
              text: "PAYTRACE",
            ),
          ),
          Container(
            width: 50,
            child: Tab(
              text: "PLAID",
            ),
          ),
          Container(
            width: 50,
            child: Tab(
              text: "I2C",
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabBar.tabs.length,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 15),
            PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Container(
                height: 40,
                child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.grey,
                    indicatorWeight: 2.0,
                    unselectedLabelColor: Colors.grey.shade600,
                    labelColor: Colors.white,
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color.fromARGB(
                              255, 255, 255, 1); //<-- SEE HERE
                        return null;
                      },
                    ),
                    tabs: _tabBar.tabs),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: TabBarView(
                  children: [
                    // TabPanelSection(
                    //   apiType: CredApiType.RCA.name,
                    // ),
                    // TabPanelSection(
                    //   apiType: CredApiType.RCS.name,
                    // ),
                    // TabPanelSection(
                    //   apiType: CredApiType.RCI.name,
                    // ),
                    // TabPanelSection(
                    //   apiType: CredApiType.PAYTRACE.name,
                    // ),
                    // TabPanelSection(
                    //   apiType: CredApiType.PLAID.name,
                    // ),
                    // TabPanelSection(
                    //   apiType: CredApiType.I2C.name,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
