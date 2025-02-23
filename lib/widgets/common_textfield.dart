import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField(
      {super.key,
      this.textFormFieldController,
      this.labelName,
      this.prefixIcon});

  final TextEditingController? textFormFieldController;
  final String? labelName;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormFieldController,
      keyboardType: TextInputType.name,
      enabled: textFormFieldController != null,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        isCollapsed: true,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        labelText: labelName,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        counterText: "",
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          borderSide: BorderSide(width: 1, color: Color(0xFFCACACA)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          borderSide: BorderSide(width: 1, color: Color(0xFFCACACA)),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6, right: 10),
          child: prefixIcon,
        ),
      ),
    );
  }
}
