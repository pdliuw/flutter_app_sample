import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/style/app_style.dart';

///@Air 此类在外部更新状态时无法即使的更新，待修正！
class AppCommonTextField extends StatefulWidget {
  TextField textField;

  AppCommonTextField({
    required this.textField,
  });

  @override
  _AppCommonTextField createState() {
    return _AppCommonTextField(this.textField);
  }
}

class _AppCommonTextField extends State<AppCommonTextField> {
  final TextField textField;

  _AppCommonTextField(this.textField) {}

  Widget? counter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    return Text(
      "${currentLength}/${maxLength}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textField.textAlign,
      maxLength: textField.maxLength,
      decoration: InputDecoration(
          labelText: textField.decoration!.labelText,
          labelStyle: TextStyle(
            color: AppStyle.textFieldLabelColor,
          ),
          hintText: textField.decoration!.hintText,
          hintStyle: TextStyle(
            color: AppStyle.textFieldHintColor,
          ),
          errorText: textField.decoration!.errorText,
          errorStyle: TextStyle(
            color: AppStyle.textFieldErrorColor,
          ),
          helperText: textField.decoration!.helperText,
          helperStyle: TextStyle(
            color: AppStyle.textFieldHelperColor,
          )),
      buildCounter: counter,
      onChanged: (String text) {
        if (textField.onChanged != null) {
          setState(() {
            textField.onChanged!(text);
          });
        }
      },
      onTap: () {
        if (textField.onTap != null) {
          textField.onTap!();
        }
      },
    );
  }
}
