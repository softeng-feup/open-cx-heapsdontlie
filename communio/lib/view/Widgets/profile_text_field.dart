import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final Function validation;
  final String name;
  final IconData icon;
  final bool sensitive;
  final TextEditingController controller;
  final TextInputType inputType;

  ProfileTextField(
      {@required this.validation,
      @required this.name,
      @required this.icon,
      this.sensitive = false,
      this.controller = null,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: TextFormField(
            controller: this.controller,
            validator: (value) {
              return " " + validation(value);
            },
            style: Theme.of(context)
                .textTheme
                .body1
                .apply(fontSizeDelta: -5, heightDelta: -5),
            keyboardType: inputType,
            obscureText: sensitive,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0.0),
              helperStyle:
                  Theme.of(context).textTheme.caption.apply(fontSizeDelta: -7),
              prefixIcon: Icon(
                icon,
                color: Theme.of(context).colorScheme.primaryVariant,
                size: 20,
              ),
              hintText: name,
              hintStyle: Theme.of(context).textTheme.caption,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Theme.of(context).buttonColor,
                width: 1.5,
                style: BorderStyle.solid,
              )),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              errorStyle: Theme.of(context).textTheme.caption.apply(
                  fontSizeDelta: -5, color: Theme.of(context).errorColor,
                  
                  ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            maxLines: 1,
          ),
        );
  }
}
