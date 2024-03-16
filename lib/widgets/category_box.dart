// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback onTap;
  const CategoryBox({
    Key? key,
    required this.primaryText,
    required this.secondaryText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 13),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.width / 3.5,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.white,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.7, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            border: Border.all(
                color: Color.fromARGB(207, 255, 255, 255), width: 0.3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                // blurRadius: 10.0,
                spreadRadius: 0.0,
              ),
            ],
            color: Color.fromARGB(50, 73, 73, 73).withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          primaryText,
                          style: TextStyle(
                            color: Color.fromARGB(207, 180, 180, 200),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("baseUrl: $secondaryText")
                      ],
                    ),
                    IconButton(
                        onPressed: null, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
