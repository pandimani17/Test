import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/common/colors.dart';
import 'package:newproject/core/viewmodel/userhomeviewmodel/Userhomeviewmodel.dart';
import 'package:stacked/stacked.dart';

class userhomee extends StatefulWidget {
  @override
  _userhomeeState createState() => _userhomeeState();
}

class _userhomeeState extends State<userhomee>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<userhomeviewmodel>.reactive(
        onModelReady: (userhomeviewmodel model) {
          model.Apicall();
        },
        builder: (context, userhomeviewmodel model, child) =>
            AppMainLayout(tabcontroller),
        viewModelBuilder: () => userhomeviewmodel());
  }
}

class AppMainLayout extends ViewModelWidget<userhomeviewmodel> {
  TabController tanc;
  AppMainLayout(this.tanc);
  @override
  Widget build(BuildContext context, userhomeviewmodel viewModel) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppCommonColors.white,
            actions: [
              IconButton(
                icon: new Icon(
                  Icons.shopping_cart,
                  color: AppCommonColors.myCustomBlack,
                ),
              ),
            ],
            bottom: TabBar(
              controller: tanc,
              onTap: (index) {
                viewModel.Notify();
              },
              indicatorColor: AppCommonColors.selectedcolor,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(top: 10),
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    viewModel.tablemenulist.restaurantId != null
                        ? viewModel.tablemenulist.tableMenuList[0].menuCategory
                            .toString()
                        : "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: tanc.index == 0
                            ? AppCommonColors.selectedcolor
                            : AppCommonColors.unselectedcolor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    viewModel.tablemenulist.restaurantId != null
                        ? viewModel.tablemenulist.tableMenuList[1].menuCategory
                            .toString()
                        : "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: tanc.index == 1
                            ? AppCommonColors.selectedcolor
                            : AppCommonColors.unselectedcolor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    viewModel.tablemenulist.restaurantId != null
                        ? viewModel.tablemenulist.tableMenuList[2].menuCategory
                            .toString()
                        : "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: tanc.index == 2
                            ? AppCommonColors.selectedcolor
                            : AppCommonColors.unselectedcolor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    viewModel.tablemenulist.restaurantId != null
                        ? viewModel.tablemenulist.tableMenuList[3].menuCategory
                            .toString()
                        : "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: tanc.index == 3
                            ? AppCommonColors.selectedcolor
                            : AppCommonColors.unselectedcolor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    viewModel.tablemenulist.restaurantId != null
                        ? viewModel.tablemenulist.tableMenuList[4].menuCategory
                            .toString()
                        : "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: tanc.index == 4
                            ? AppCommonColors.selectedcolor
                            : AppCommonColors.unselectedcolor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    viewModel.tablemenulist.restaurantId != null
                        ? viewModel.tablemenulist.tableMenuList[5].menuCategory
                            .toString()
                        : "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: tanc.index == 5
                            ? AppCommonColors.selectedcolor
                            : AppCommonColors.unselectedcolor),
                  ),
                )
              ],
            ),
          ),
          body: new TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tanc,
            children: <Widget>[
              dishes(viewModel, 0),
              dishes(viewModel, 1),
              dishes(viewModel, 2),
              dishes(viewModel, 3),
              dishes(viewModel, 4),
              dishes(viewModel, 5),
            ],
          ),
        ));
  }

  Widget dishes(userhomeviewmodel model, int indexx) => Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        child: model.tablemenulist.restaurantId != null
            ? ListView.builder(
                itemCount: model
                    .tablemenulist.tableMenuList[indexx].categoryDishes.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  model.newcategoryDishes =
                      model.tablemenulist.tableMenuList[indexx].categoryDishes;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.newcategoryDishes[index].dishName,
                            style: TextStyle(
                                color: AppCommonColors.myCustomBlack,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Text(
                              model.newcategoryDishes[index].dishCurrency,
                              style: TextStyle(
                                  color: AppCommonColors.myCustomBlack,
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Text(
                              model.newcategoryDishes[index].dishDescription,
                              style: TextStyle(
                                  color: AppCommonColors.myCustomBlack,
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ));
}
