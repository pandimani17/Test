import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/common/colors.dart';
import 'package:newproject/core/viewmodel/homepageviewmodel.dart';
import 'package:stacked/stacked.dart';

class Detailpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onModelReady: (homepageviewmodel model) {
          // model.getusers();
          // FlutterToast().showFlutterToast(context, "text", true);
        },
        builder: (context, homepageviewmodel homepage, child) => Scaffold(
              backgroundColor: AppCommonColors.white,
              body: mainlayout(),
            ),
        viewModelBuilder: () => homepageviewmodel());
  }
}

class mainlayout extends ViewModelWidget<homepageviewmodel> {
  @override
  Widget build(BuildContext context, homepageviewmodel viewModel) {
    return RefreshIndicator(
        onRefresh: viewModel.onRefresh,
        child: Container(
          child: Text("test"),
        ));
  }
}
