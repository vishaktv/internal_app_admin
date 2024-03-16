// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:internal_app/data.dart';

class ApiItem extends StatefulWidget {
  final String apiName;
  final String apiUrl;
  final bool blocked;
  final int id;
  final Function(int)? onUnblock;
  ApiItem(
      {Key? key,
      this.blocked = false,
      required this.id,
      required this.apiName,
      this.onUnblock = null,
      required this.apiUrl})
      : super(key: key);

  @override
  State<ApiItem> createState() => _ApiItemState();
}

class _ApiItemState extends State<ApiItem> {
  bool isCLicked = false;
  bool showProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(114, 57, 57, 57),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wrapText(widget.apiName) ?? "getFundingDetails",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(wrapText(widget.apiUrl) ?? "rcs/genearl/api",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200))
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: isCLicked | widget.blocked
                      ? Colors.red
                      : Color.fromARGB(217, 66, 66, 66),
                  foregroundColor: Colors.white),
              child: showProgressIndicator
                  ? Container(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        strokeAlign: 1.3,
                        color: Colors.white,
                      ))
                  : Text(isCLicked | widget.blocked ? "Unblock" : "Block"),
              onPressed: () async {
                setState(() {
                  showProgressIndicator = true;
                });
                if (!widget.blocked) {
                  await Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      showProgressIndicator = false;
                      if (isCLicked) {
                        isCLicked = false;
                      } else {
                        isCLicked = true;
                      }
                    });
                  });
                } else {
                  if (widget.onUnblock != null) {
                    await Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        showProgressIndicator = false;
                      });
                      widget.onUnblock!(widget.id);
                    });
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  String wrapText(String? text) {
    if (text != null && text.length > 25) {
      if (text.contains('/')) {
        int splitIndex = text.lastIndexOf('/') + 1;
        splitIndex =
            splitIndex > 25 ? splitIndex : text.indexOf('/', splitIndex) + 1;
        splitIndex = splitIndex > 0 ? splitIndex : 25;

        return '${text.substring(0, splitIndex)}\n${text.substring(splitIndex)}';
      } else {
        int midIndex = text.length ~/ 1.5;
        return '${text.substring(0, midIndex)}\n${text.substring(midIndex)}';
      }
    } else {
      return text ?? '';
    }
  }
}
