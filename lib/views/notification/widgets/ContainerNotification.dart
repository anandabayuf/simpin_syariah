import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_simpin_syariah/models/notifikasi/Notifikasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class ContainerNotification extends StatefulWidget{
  late List<Notifikasi> listDataNotifikasi;

  ContainerNotification(this.listDataNotifikasi);

  @override
  _ContainerNotificationState createState() => _ContainerNotificationState(
      this.listDataNotifikasi
  );
}

class _ContainerNotificationState extends State<ContainerNotification> {
  late List<Notifikasi> listDataNotifikasi;

  List<Notifikasi> temp = [];

  _ContainerNotificationState(this.listDataNotifikasi);

  @override
  void initState() {
    super.initState();

    temp = this.listDataNotifikasi;
    timeago.setLocaleMessages('id', timeago.IdMessages());
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context){
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 15,
        color: Colors.white,
        thickness: 1,
      ),
      itemCount: listDataNotifikasi.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          minLeadingWidth: 10,
          horizontalTitleGap: 10,
          contentPadding: EdgeInsets.zero,
          leading: this.temp[index].read ? null : Badge(
            badgeColor: Colors.red,
            animationType: BadgeAnimationType.scale,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText("${this.temp[index].kategori}", 15.0, true),
              Tooltip(
                showDuration: Duration(seconds: 5),
                triggerMode: TooltipTriggerMode.tap,
                message: "${DateFormat('EEEE, dd MMMM y - HH.mm', 'id').format(this.temp[index].waktu)}",
                decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: StadiumBorder()
                ),
                child: Text(
                  "${timeago.format(
                    new DateTime.now().subtract(
                        new Duration(
                            seconds: DateTime.now().difference(this.temp[index].waktu).inSeconds
                        )
                    ),
                    locale: 'en_short',
                  )}",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white.withOpacity(0.5),
                      fontFamily: 'Comfortaa',
                      decoration: TextDecoration.underline
                  ),
                ),
              )
            ],
          ),
          subtitle: Column(
            children: [
              SizedBox(height: 10.0,),
              CustomText("${this.temp[index].detail}", 15.0, false),
            ],
          ),
        );
      },
    );
  }
}