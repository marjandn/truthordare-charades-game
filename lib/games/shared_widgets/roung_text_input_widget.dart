import 'package:flutter/material.dart';
import 'package:truth_or_dare/core/views/colors.dart';

class RoundedTextInputWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditController;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int minLines, maxLines;
  final TextStyle? textStyle;
  final AutovalidateMode? validateMode;
  final bool isEnable;
  final EdgeInsetsGeometry textPadding;
  final TextAlign textAlign;

  const RoundedTextInputWidget({
    Key? key,
    required this.textEditController,
    this.textPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.textAlign = TextAlign.right,
    this.hintText = '',
    this.obscureText,
    this.isEnable = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.black),
    this.suffixIcon,
    this.validateMode = AutovalidateMode.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      controller: textEditController,
      autovalidateMode: validateMode,
      validator: (value) {
        if (value!.isEmpty) return "this field is required";
        return null;
      },
      style: textStyle,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.grayDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.grayDark,
          ),
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        hintText: hintText,
        fillColor: Colors.white70,
        suffixIcon: suffixIcon,
        contentPadding: textPadding,
      ),
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textAlign: textAlign,
      obscureText: obscureText ?? false,
    );
  }
}
