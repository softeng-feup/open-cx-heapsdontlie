import 'package:flutter/material.dart';

class ProfilePasswordField extends StatefulWidget {
  final TextEditingController controller;
  ProfilePasswordField(this.controller);

  @override
  State<StatefulWidget> createState() {
    return _ProfilePasswordFieldState(this.controller);
  }
}

class _ProfilePasswordFieldState extends State<ProfilePasswordField> {
  final TextEditingController controller;
  _ProfilePasswordFieldState(this.controller);

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  validation(value) {
    if (value.trim().isEmpty) return 'Field is empty';
    return null;
  }

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
            keyboardType: TextInputType.text,
            obscureText: _obscureText,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
                hintText: 'Password',
                hintStyle: Theme.of(context).textTheme.caption,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).buttonColor,
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                ),
                errorStyle: Theme.of(context).textTheme.caption.apply(
                    fontSizeDelta: -5, color: Theme.of(context).errorColor),
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
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: _toggle,
                ))));
  }
}
