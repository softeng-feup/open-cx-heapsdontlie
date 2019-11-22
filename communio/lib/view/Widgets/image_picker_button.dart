import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  takePic() async {
    final source = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Select profile picture source",
                  style: Theme.of(context).textTheme.body2),
              actions: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Camera'),
                            Icon(Icons.camera_alt),
                          ],
                        ),
                        onPressed: () =>
                            Navigator.pop(context, ImageSource.camera),
                      ),
                      MaterialButton(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Gallery'),
                            Icon(Icons.photo),
                          ],
                        ),
                        onPressed: () =>
                            Navigator.pop(context, ImageSource.gallery),
                      )
                    ]),
              ],
            ));

    onPressed(source);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius * 2,
        height: radius * 0.6,
        child: Opacity(
          opacity: 0.3,
          child: RawMaterialButton(
            fillColor: Theme.of(context).colorScheme.primaryVariant,
            shape: BeveledRectangleBorder(),
            elevation: 0.0,
            child: Icon(Icons.camera_alt, color: Theme.of(context).canvasColor),
            onPressed: takePic,
          ),
        ));
  }
}
