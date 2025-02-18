import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintext;
  final String? errorMesague;
  final bool obscureText;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    this.label,
    this.hintext,
    this.errorMesague,
    this.onChange,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      //borderSide:BorderSide(color: colors.primary) ,
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      onChanged: onChange,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label == null ? null : Text(label!),
        hintText: hintext,
        errorText: errorMesague,
        focusColor: colors.primary,
        /*  prefixIcon: Icon(
          Icons.supervised_user_circle_outlined,
          color: colors.primary,
        ), */
      ),
    );
  }
}
