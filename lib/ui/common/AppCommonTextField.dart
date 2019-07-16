import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/style/AppStyle.dart';

class AppCommonTextField extends StatefulWidget {
  TextField textField;

  AppCommonTextField({
    @required this.textField,
  });

  @override
  _AppCommonTextField createState() {
    return _AppCommonTextField(this.textField);
  }
}

class _AppCommonTextField extends State<AppCommonTextField> {
  TextField textField;

  _AppCommonTextField(TextField textField) {
    this.textField = textField;
  }
  Widget counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
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
        labelText: textField.decoration.labelText,
        labelStyle: TextStyle(
          color: AppStyle.textFieldLabelColor,
        ),
        hintText: textField.decoration.hintText,
        hintStyle: TextStyle(
          color: AppStyle.textFieldHintColor,
        ),
        errorText: textField.decoration.errorText,
        errorStyle: TextStyle(
          color: AppStyle.textFieldErrorColor,
        ),
        helperText: textField.decoration.helperText,
        helperStyle: TextStyle(
          color: AppStyle.textFieldHelperColor,
        )
      ),
      buildCounter: counter,
    );
  }
}
