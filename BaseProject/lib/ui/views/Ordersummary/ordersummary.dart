import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/common/colors.dart';
import 'package:newproject/core/viewmodel/Ordersummary/ordersummary.dart';
import 'package:stacked/stacked.dart';

class ordersummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ordersummaryviewmodel>.reactive(
        onModelReady: (ordersummaryviewmodel model) {
          model.initorders();
        },
        builder: (context, ordersummaryviewmodel model, child) => Scaffold(
              body: ordersummarylayout(),
              appBar: AppBar(
                title: Text(
                  "Order Summary",
                  style: TextStyle(color: AppCommonColors.myCustomBlack),
                ),
                backgroundColor: AppCommonColors.white,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
        viewModelBuilder: () => ordersummaryviewmodel());
  }
}

class ordersummarylayout extends ViewModelWidget<ordersummaryviewmodel> {
  @override
  Widget build(BuildContext context, ordersummaryviewmodel viewModel) {
    return Container();
  }
}
