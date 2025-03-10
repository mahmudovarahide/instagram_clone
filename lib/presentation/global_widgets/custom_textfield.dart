// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:instagram_app/core/constants/colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.size,
    required this.controller,
    required this.hint,
    this.prefixIcon,
    this.autoFocus,
    this.fieldSubmitted,
    this.textInputAction,
    this.validator,
    required this.borderRadius,
    this.onChanged,
    this.focusNode,
    this.suffixIcon,
  }) : super(key: key);
  final Size size;
  final TextEditingController controller;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final bool? autoFocus;
  final TextInputAction? textInputAction;
  final Function()? fieldSubmitted;
  final Function(String value)? onChanged;
  final Function(String? value)? validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator!(value);
      },
      onFieldSubmitted: (value) {
        if (fieldSubmitted != null) {
          fieldSubmitted!();
        }
      },
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      focusNode: focusNode,
      textInputAction: textInputAction ?? TextInputAction.done,
      autofocus: autoFocus ?? false,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none),
          prefixIcon: prefixIcon ?? const SizedBox(),
          suffixIcon: suffixIcon ?? const SizedBox(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          fillColor: primaryInputColor,
          filled: true),
    );
  }
}
