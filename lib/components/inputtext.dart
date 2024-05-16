import 'package:flutter/material.dart';
import 'package:mynotes/themes/textstyles.dart';

class InputText extends StatelessWidget {
  final TextEditingController txtController;
  final String? label;
  final String? hint;
  final Icon? icon;
  final double iconSpacing;
  final int maxLine;
  final TextInputType? inputType;

  const InputText(
      {super.key,
      required this.txtController,
      this.label,
      this.icon,
      this.hint,
      this.iconSpacing = 0,
      this.maxLine = 1,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        keyboardType: inputType,
        maxLines: maxLine,
        controller: txtController,
        style: TextStyles.sm,
        validator: (value) {
          if (value == '' || value == null) {
            return 'please fill the column';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: label,
          hintText: hint,
          prefixIcon: icon,
          prefixIconConstraints: BoxConstraints(minWidth: iconSpacing),
          labelStyle: TextStyles.formLabel,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: TextStyles.formHint,
          errorStyle: TextStyles.formError,
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 2, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
