import 'dart:async';
import 'dart:convert';

import 'package:newproject/app/locator.dart';
import 'package:newproject/core/data/api/apicall/userapicall.dart';
import 'package:newproject/core/data/api/models/api_response.dart';
import 'package:newproject/core/data/api_model/usersmodel.dart';
import 'package:newproject/core/services/database_service.dart';
import 'package:stacked/stacked.dart';

class homepageviewmodel extends BaseViewModel {
  bool apiloading = false;
  Data usersmodel = Data();
  List<Data> datalist;
  List<Data> gettodo;

  final _databaseService = locator<DatabaseService>();

  getusers() async {
    apiloading = true;
    gettodo = await _databaseService.getTodos();
    if (gettodo == null || gettodo.length == 0) {
      Apicall();
    }
    notifyListeners();
    //  Apicall();
  }

  Apicall() async {
    ApiResponse response = await locator<Userapi>().getusers("page=2");
    if (response != null) {
      List<Map<String, dynamic>> dataa = response.jsonArray;
      List<Data> userdata = [];
      userdata =
          List<Data>.from(response.json['data'].map((x) => Data.fromJson(x)));
      var jsonn = jsonEncode(userdata.map((e) => e.toJson()).toList());
      Map<String, Object> values = Map();
      values = {"Data": json.decode(jsonn)};
      List finish = json.decode(jsonn);
      _databaseService.addTodo(finish);
      gettodo = userdata;
      apiloading = false;
      notifyListeners();
    }
    // Message data = Message();
    // data.text = "testing1";
    // data.date = DateTime.now();
    // locator<Firebaseservice>().pushmessage("test", data);
    // apiloading = false;
    // notifyListeners();
  }

  Future<dynamic> onRefresh() {
    Completer completer = new Completer();
    Timer timer = new Timer(new Duration(seconds: 1), () {
      Apicall();
      if (!completer.isCompleted) {
        completer.complete();
      }
    });
    return completer.future;
  }
}
