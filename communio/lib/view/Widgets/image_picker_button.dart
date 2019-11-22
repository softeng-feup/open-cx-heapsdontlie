import 'package:flutter/material.dart';

class ImagePickerButton extends StatefulWidget {

  final Function onPressed;
  final radius;

  ImagePickerButton(this.onPressed, this.radius);

  @override
  _ImagePickerButtonState createState() =>
    _ImagePickerButtonState(this.onPressed, this.radius);

}

class _ImagePickerButtonState extends State<ImagePickerButton> {

  final Function onPressed;
  final radius;
  
  _ImagePickerButtonState(this.onPressed, this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 0.6,
      child: RawMaterialButton(
        fillColor: Theme.of(context)
                    .colorScheme.secondaryVariant,
        shape: BeveledRectangleBorder(),
        elevation: 0.0,
        child: Icon(Icons.camera_alt,
          color: Theme.of(context).canvasColor),
        onPressed: onPressed,
      ),
    );
  }

}
