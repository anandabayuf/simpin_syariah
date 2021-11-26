import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileImageContainer extends StatelessWidget{
  final String profileURL;

  ProfileImageContainer(this.profileURL);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CircleAvatar(
        backgroundImage: Image.file(
          File(this.profileURL),
          width: 100,
          height: 100,
        ).image,
        radius: 100.0,
        backgroundColor: Colors.transparent,
      ),
      color: Colors.transparent,
      elevation: 18.0,
      shape: CircleBorder(),
    );
  }
}