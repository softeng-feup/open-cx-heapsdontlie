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
              return validation(value);
            },
            keyboardType: TextInputType.text,
            obscureText: _obscureText,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
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
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1.5,
                  style: BorderStyle.solid,
                )),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: _toggle,
                ))));
  }
}
