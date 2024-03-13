import 'dart:convert';

import 'package:bino_kids/features/branches/model/braches_model.dart';
import 'package:bino_kids/features/branches/repository/branches_repository.dart';

mixin BranchesHelper{
  Future<List<Branch>?> getBranches()async{
    var response=await BranchesRepository().getBranches();
    List<Branch> branches=branchesModelFromJson(jsonEncode(response.data)).data.branches;
    return branches;
  }
}