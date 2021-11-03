import 'package:flutter/cupertino.dart';

class ContainerIconImage extends StatelessWidget {
  late String iconImageLocation;

  ContainerIconImage(String iconImageLocation){
    this.iconImageLocation = iconImageLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      this.iconImageLocation,
      width: 250,
      height: 250,
    );
  }
}