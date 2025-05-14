import 'package:bino_kids/common/helpers/app_localization.dart';
import 'package:bino_kids/common/widgets/custom_back_btn.dart';
import 'package:bino_kids/features/branches/model/braches_model.dart';
import 'package:bino_kids/features/branches/view/elements/branches_item_widget.dart';
import 'package:bino_kids/features/branches/viewModel/branches_helper.dart';
import 'package:flutter/Material.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen>with BranchesHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SafeArea(child:
    Column(children: [
      CustomBackBtn(title:tr("our_braches"),),
      Container(color: Colors.grey[200],width: double.infinity,height: 1,),
      Expanded(child:
      FutureBuilder<List<Branch>?>(
        future: getBranches(),
        builder: (context, snapshot) {
          return snapshot.hasData?ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx,index){
                return BranchesItemWidget(branch: snapshot.data![index],);
              }):SizedBox();
        }
      ))
    ],),),);
  }
}
