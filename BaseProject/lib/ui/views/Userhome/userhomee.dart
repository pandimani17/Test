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
              Container(
                child: Center(
                  child: (Text("1")),
                ),
              ),
              Container(
                child: Center(
                  child: (Text("1")),
                ),
              ),
              Container(
                child: Center(
                  child: (Text("1")),
                ),
              ),
              Container(
                child: Center(
                  child: (Text("1")),
                ),
              ),
              Container(
                child: Center(
                  child: (Text("1")),
                ),
              ),
              Container(
                child: Center(
                  child: (Text("1")),
                ),
              ),
            ],
          ),
        ));
  }
}
