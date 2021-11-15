import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';

class ContainerTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Image.asset(
              'assets/images/login/LambangKoperasi.png',
              height: 40.0,
              width: 40.0,
            ),
            color: Colors.transparent,
            elevation: 18.0,
            shape: CircleBorder(),
          ),
          SizedBox(width: 10.0,),
          CustomText('Simpin Syariah', 24.0, false)
        ],
      ),
    );
  }
}