import 'package:flutter/material.dart';
import 'package:newproject/app/locator.dart';
import 'package:newproject/core/data/api/apicall/dishesapicall.dart';
import 'package:newproject/core/data/api/models/api_response.dart';
import 'package:newproject/core/data/api_model/dishesreponsemodel/dishesresponsemodel.dart';
import 'package:stacked/stacked.dart';

class userhomeviewmodel extends BaseViewModel {
  Autogenerated tablemenulist = Autogenerated();
  TabController tabcontroller;

  Apicall() async {
    ApiResponse response = await locator<dishesapicall>().getdishes();
    if (response != null) {
      tablemenulist = Autogenerated.fromJson(response.jsonArray[0]);
      print(tablemenulist.toString());
      notifyListeners();
    }
  }

  Notify() {
    notifyListeners();
  }
}
