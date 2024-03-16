import 'package:flutter/material.dart';
import 'package:internal_app/data.dart';

import '../widgets/api_item.dart';

class BlockListScreen extends StatefulWidget {
  const BlockListScreen({super.key});

  @override
  State<BlockListScreen> createState() => _BlockListScreenState();
}

class _BlockListScreenState extends State<BlockListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Blocked APIs",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          // ListView.builder(itemBuilder: (context,index){}),
          Expanded(
              child: ListView.builder(
                  itemCount: blockedApiList.length,
                  itemBuilder: (context, index) {
                    final api = blockedApiList[index];
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: ApiItem(
                        apiName: api['apiName'],
                        apiUrl: api['apiUrl'],
                        blocked: api['blocked'],
                        id: api['id'],
                        onUnblock: (id) {
                          setState(() {
                            blockedApiList
                                .removeWhere((item) => item["id"] == id);
                          });
                        },
                      ),
                    );
                  })),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                blockedApiList.clear();
                setState(() {});
              },
              child: const Text('unblock all'),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
