// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onChanged;
  const SearchTextField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  // void onChangedHandler(String value) {
  //   widget.onChanged();
  // }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      onChanged: widget.onChanged,
      cursorHeight: 18,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8, right: 4),
          child: Icon(Icons.search),
        ),
        prefixIconColor: const Color.fromARGB(131, 158, 158, 158),
        prefixIconConstraints: BoxConstraints(minWidth: 20),
        contentPadding: EdgeInsets.all(14.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Color.fromARGB(255, 67, 67, 67),
        hintStyle: TextStyle(color: Color.fromARGB(210, 228, 228, 228)),
        hintText: "Enter api name".toString(),
      ),
    );
  }
}
