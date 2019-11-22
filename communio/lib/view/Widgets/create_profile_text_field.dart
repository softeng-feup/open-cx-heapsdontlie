import 'package:flutter/material.dart';

class CreateProfileTextField extends StatelessWidget {
  final Function validation;
  final String name;
  final IconData icon;

  CreateProfileTextField(this.validation, this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (value) {
          return validation(value);
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
          hintText: name,
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
            ),
          ),
        ),
        maxLines: 1,
      ),
    );
  }
}
