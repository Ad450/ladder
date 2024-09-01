import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/gen/colors.gen.dart';
import 'package:ladder/gen/fonts.gen.dart';

class LadderFormField extends StatelessWidget {
  const LadderFormField({required this.controller, this.hintText, this.type, super.key});

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: double.infinity,
      child: TextField(
        controller: controller,
        keyboardType: type,
        textAlignVertical: TextAlignVertical.center,
        style: context.appTheme.textTheme.bodySmall?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: ColorName.onBackground,
        ),
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorName.textfield,
          hintStyle: const TextStyle(
            color: ColorName.hintColor,
            fontWeight: FontWeight.normal,
            fontFamily: FontFamily.publicSans,
            fontSize: 16,
            // textBaseline: TextBaseline.alphabetic
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
