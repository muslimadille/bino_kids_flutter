import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/widgets/costum_bottom_sheet.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/settings/view/widgets/change_language_widget.dart';
import 'package:bino_kids/features/settings/view/widgets/settinng_list_item.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child:
      Column(children: [
        CustomBackBtn(title: tr("Settings"),),
        Expanded(child: Container(
          color: Colors.grey[200],
          child: ListView(children: [
            SettingListItem(title:tr("CHANGE_LANGUAGE"), onclick: (){
              CustomBottomSheet().displayModalBottomSheet(widget: ChangeLanguageWidget());
            },)
          ],),
        ))
      ],),),);
  }
}
