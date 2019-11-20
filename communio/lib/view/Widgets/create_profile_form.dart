import 'package:communio/view/Widgets/image_upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProfileForm extends StatefulWidget {

  @override
  CreateProfileFormState createState() {
    return CreateProfileFormState();
  }

}

class CreateProfileFormState extends State<CreateProfileForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField( validator: (value) {
              if (value.isEmpty) return 'Please enter some text';
              return null;
            }
          ),
          ImageUpload(),
          /**
           * Pontos a incluir:
           * - Nome (First Name, Last Name)
           * - E-mail
           * - Redes Sociais
           * - Interests and other tags (profile page)
           * - Photo?
           */
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit'),
          )
        ]
      ) 
    );
  }

}