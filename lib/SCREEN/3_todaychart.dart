import 'package:flutter/material.dart';
import 'package:hospitalnew/COMPONENTS/commoncolor.dart';
import 'package:hospitalnew/CONTROLLER/controller.dart';
import 'package:hospitalnew/SCREEN/3.1_todaydata.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// enum WidgetMarker {
//   dayone,
//   daytwo,
//   daythree,
// }

class Singlegraph extends StatefulWidget {
  String? from_date;
  String? to_date;

  Singlegraph({required this.from_date, required this.to_date});

  @override
  State<Singlegraph> createState() => _SinglegraphState();

  static void dispose() {}
}

class _SinglegraphState extends State<Singlegraph> {
  DateTime date = DateTime.now();
  String? selected;
  List<String> s = [];
  String? sid;

  var groupBarData = 1;
  // changeBody(int tabIndex) {
  //   print("tabindex----$tabIndex");
  //   switch (tabIndex) {
  //     case 0:
  //       return customContainer();
  //     case 1:
  //       return customWidget("haiiii");
  //     case 2:
  //       return customWidget("hellooo");
  //     case 3:
  //       return customWidget("fzdfd");
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("from Date.......${widget.from_date}--${widget.to_date}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer<Controller>(
        builder: (context, value, child) {
          print("length.........${value.branchList.length}");
          return Column(
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      DefaultTabController(
                          length: value.branchList.length, // length of tabs
                          initialIndex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                // color: P_Settings.bodyTabColor,
                                child: TabBar(
                                    physics: NeverScrollableScrollPhysics(),
                                    labelColor: Colors.red,
                                    indicatorWeight: 3,
                                    indicatorColor: Colors.red,
                                    unselectedLabelColor: Colors.black,
                                    tabs: value.branchList
                                        .map((e) => Tab(
                                              text: e['branch_code'],
                                            ))
                                        .toList()),
                              ),
                              Container(
                                height:
                                    size.height * 0.75, //height of TabBarView
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(
                                  physics: NeverScrollableScrollPhysics(),
                                  children: value.branchid.map((e) {
                                    return customContainer(e);
                                  }).toList(),
                                  // children: <Widget>[
                                  //   Container(
                                  //     child: Center(
                                  //       child: FirstBranch(
                                  //         branch_id: value.branchid[0],
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   Container(
                                  //     child: Center(
                                  //       child: FirstBranch(
                                  //         branch_id: value.branchid[1],
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   Container(
                                  //     child: Center(
                                  //       child: FirstBranch(
                                  //         branch_id: value.branchid[2],
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   Container(
                                  //     child: Center(
                                  //       child: FirstBranch(
                                  //         branch_id: value.branchid[3],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ],
                                ),
                              )
                            ],
                          ),
                          ),
                    ]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget customContainer(String e) {
    return Consumer<Controller>(
      builder: (context, value, child) {
        return Container(
          child: Center(
            child: FirstBranch(
              branch_id: e,
            ),
          ),
        );
      },
    );
  }
}
  //////////////////////////////////////////////////////////////////////

