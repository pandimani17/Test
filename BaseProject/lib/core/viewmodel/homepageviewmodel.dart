import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/ui/views/Userhome/userhomee.dart';
import 'package:stacked/stacked.dart';

class homepageviewmodel extends BaseViewModel {
  Navigation(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => userhomee()));
  }
}
