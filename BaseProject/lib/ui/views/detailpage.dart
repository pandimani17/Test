import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/common/colors.dart';
import 'package:newproject/core/viewmodel/homepageviewmodel.dart';
import 'package:progress_indicator_button/progress_button.dart';
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
    return Scaffold(
      /* appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/firebase_logo.png",
              height: 200,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 54,
                  child: ProgressButton(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    strokeWidth: 2,
                    child: Row(
                      children: [
                        Image.network(
                            'http://pngimg.com/uploads/google/google_PNG19635.png'),
                        Spacer(),
                        Text(
                          "Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Padding(padding: const EdgeInsets.only(right: 20.0))
                      ],
                    ),
                    color: Colors.blue,
                    onPressed: (AnimationController controller) async {
                      viewModel.Navigation(context);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 54,
                  child: ProgressButton(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    strokeWidth: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 32,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Text(
                          "Phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Padding(padding: const EdgeInsets.only(right: 20.0))
                      ],
                    ),
                    color: Colors.green,
                    onPressed: (AnimationController controller) async {
                      viewModel.Navigation(context);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Detailpage(),
              ));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
