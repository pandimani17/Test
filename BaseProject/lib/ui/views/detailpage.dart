import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/common/colors.dart';
import 'package:newproject/common/toast.dart';
import 'package:newproject/core/viewmodel/homepageviewmodel.dart';
import 'package:stacked/stacked.dart';

class Detailpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onModelReady: (homepageviewmodel model) {
          model.getusers();
          // FlutterToast().showFlutterToast(context, "text", true);
        },
        builder: (context, homepageviewmodel homepage, child) => Scaffold(
          backgroundColor:AppCommonColors.white,
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
      child: SafeArea(
          child: viewModel.gettodo != null
              ? Center(
            child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: viewModel.gettodo.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(
                                0, 2), // changes position of shadow
                          ),
                        ]),
                    child: Text(
                      viewModel.gettodo[index].firstName,
                      style:
                      TextStyle(fontFamily: "poppins", fontSize: 30),
                    ),
                  );
                }),
          )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
