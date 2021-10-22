import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/common/colors.dart';
import 'package:newproject/core/viewmodel/Ordersummary/ordersummary.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:stacked/stacked.dart';

class ordersummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ordersummaryviewmodel>.reactive(
        onModelReady: (ordersummaryviewmodel model) {
          model.initorders();
          // model.Totalamount();
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
    return Column(
      children: [
        Container(
          height: 550,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: AppCommonColors.Darkgreen,
                      height: 40,
                      child: Center(
                        child: Text(
                          viewModel.newcategoryDishes.length.toString() +
                              " " +
                              "Dishes" +
                              "-" +
                              viewModel.newcategoryDishes.length.toString() +
                              " " +
                              "Items",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: viewModel.newcategoryDishes.length,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 15, left: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            viewModel.newcategoryDishes[index]
                                                .dishName,
                                            style: TextStyle(
                                                color: AppCommonColors
                                                    .myCustomBlack,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 15),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 14.0),
                                            child: Text(
                                              viewModel.newcategoryDishes[index]
                                                      .dishCurrency +
                                                  " " +
                                                  viewModel
                                                      .newcategoryDishes[index]
                                                      .dishPrice
                                                      .toString(),
                                              style: TextStyle(
                                                  color: AppCommonColors
                                                      .myCustomBlack,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 14.0, right: 10),
                                            child: Text(
                                              viewModel.newcategoryDishes[index]
                                                      .dishCalories
                                                      .toString() +
                                                  "Calories",
                                              style: TextStyle(
                                                  color: AppCommonColors
                                                      .myCustomBlack,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          viewModel.newcategoryDishes[index]
                                                      .addonCat !=
                                                  null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 14.0),
                                                  child: Text(
                                                    "Customizations Availbale",
                                                    style: TextStyle(
                                                        color: AppCommonColors
                                                            .selectedcolor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 10),
                                      child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: AppCommonColors.Darkgreen,
                                              border: Border.all(
                                                color:
                                                    AppCommonColors.Darkgreen,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                                onTap: () {
                                                  // viewModel.deleteitem(
                                                  //     viewModel, index)();
                                                },
                                              ),
                                              Spacer(),
                                              Text(
                                                viewModel
                                                            .newcategoryDishes[
                                                                index]
                                                            .quantity ==
                                                        null
                                                    ? "0"
                                                    : viewModel
                                                        .newcategoryDishes[
                                                            index]
                                                        .quantity
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                                onTap: () {
                                                  // viewModel.additem(index)();
                                                },
                                              ),
                                            ],
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        viewModel.newcategoryDishes[index]
                                                .dishCurrency +
                                            " " +
                                            viewModel.newcategoryDishes[index]
                                                .dishPrice
                                                .toString(),
                                        style: TextStyle(
                                            color:
                                                AppCommonColors.myCustomBlack,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(
                                color: AppCommonColors.myCustomBlack,
                                fontSize: 15),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "INR" + " " + viewModel.totalamount.toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Container(
            height: 54,
            child: ProgressButton(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              strokeWidth: 2,
              child: Text(
                "Place Order",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              color: AppCommonColors.Darkgreen,
              onPressed: (AnimationController controller) async {
                MangementDeletePopup(context, viewModel);
              },
            ),
          ),
        ),
      ],
    );
  }

  void MangementDeletePopup(BuildContext context, ordersummaryviewmodel model) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: contentDeleteBox(context, model),
          );
        });
  }

  contentDeleteBox(context, ordersummaryviewmodel model) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, 3), blurRadius: 2),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Confrim Your Order',
                style: TextStyle(
                    color: AppCommonColors.Darkgreen,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              // isclickDelete == true
              Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () => {
                        Navigator.of(context).pop(),
                        model.PlaceOrder(context)
                      },
                      textColor: Colors.green,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          Text('Ok',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        side: new BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/images/popup_close.png",
                    width: 50,
                    height: 50,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
