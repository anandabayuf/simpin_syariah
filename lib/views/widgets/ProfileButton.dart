import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/widgets/CustomText.dart';

class ProfileButton extends StatefulWidget{
  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  final _key = GlobalKey<PopupMenuButtonState>();
  late bool _isButtonClicked;

  @override
  void initState() {
    _isButtonClicked = false;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166.0,
      child: Card(
        elevation: 10.0,
        color: HexColor('#F8B50F'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29.0),
        ),
        child: PopupMenuButton<int>(
          color: HexColor('#F8B50F'),
          onSelected: (item) => onSelected(context, item),
          elevation: 10.0,
          offset: Offset(0, 65),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          key: _key,
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Versi Aplikasi',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: 'Comfortaa'
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem<int>(
              value: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'Comfortaa'
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/appbar/ava-mock.png'),
                radius: 30.0,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 5.0,),
              CustomText('Andini', 15.0, false),
              _isButtonClicked ? Icon(
                Icons.arrow_drop_up,
                size: 32.0,
                color: Colors.white,
              ) : Icon(
                Icons.arrow_drop_down,
                size: 32.0,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    setState(() {
      this._isButtonClicked = !this._isButtonClicked;
    });
  }
}