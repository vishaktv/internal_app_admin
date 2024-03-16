import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool? enabled;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextCapitalization? textCapitalization;

  const CustomTextField({
    Key? key,
    this.enabled,
    required this.controller,
    required this.focusNode,
    this.obscureText,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.onTap,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey.shade400,
      autocorrect: false,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      textCapitalization: textCapitalization ??
          TextCapitalization.none, // changed to none if not provided
      enabled: enabled ?? true,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
          suffixIcon: keyboardType == TextInputType.visiblePassword
              ? GestureDetector(
                  onTap: onTap,
                  child: Icon(
                      obscureText! ? Icons.visibility_off : Icons.visibility))
              : null,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 18.0, horizontal: 14.0), // changed to symmetric
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color.fromARGB(177, 54, 54, 54).withOpacity(0.3),
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(206, 194, 188, 188),
          ),
          hintText: hintText,
          errorStyle: TextStyle(color: Color.fromARGB(173, 106, 29, 24))),
      obscureText: obscureText ?? false, // changed to false if not provided
      validator: validator,
    );
  }
}
