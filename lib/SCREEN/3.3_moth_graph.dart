import 'package:flutter/material.dart';
import 'package:hospitalnew/CONTROLLER/controller.dart';
import 'package:hospitalnew/SCREEN/3.1_todaydata.dart';
import 'package:hospitalnew/SCREEN/3.2_day_multigraph.dart';
import 'package:hospitalnew/components/commoncolor.dart';
import 'package:provider/provider.dart';

class MonthwiseGraph extends StatefulWidget {
  String? from_date;
  String? to_date;

  MonthwiseGraph({required this.from_date, required this.to_date});

  @override
  State<MonthwiseGraph> createState() => _MonthwiseGraphState();
}

class _MonthwiseGraphState extends State<MonthwiseGraph> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Consumer<Controller>(
        builder: (context, value, child) {
          print("length..czxcx.......${value.branchList.length}");
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
                                      // indicatorColor: Colors.red,
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
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.grey, width: 0.5))),
                                  child: TabBarView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: value.branchid
                                          .map((e) => customContainer(e))
                                          .toList()
                                      // children: <Widget>[
                                      //   Consumer<Controller>(
                                      //     builder: (context, value, child) {
                                      //       return Container(
                                      //         child: MultiDayOne(
                                      //           branch_id: value.branchid[0],
                                      //           fromDate: widget.from_date!,
                                      //           todate: widget.to_date!,
                                      //           period: "1",
                                      //         ),
                                      //       );
                                      //     },
                                      //   ),
                                      //   Container(
                                      //     child: MultiDayOne(
                                      //       fromDate: widget.from_date!,
                                      //       todate: widget.to_date!,
                                      //       branch_id: value.branchid[1],
                                      //       period: "1",
                                      //     ),
                                      //   ),
                                      //   Container(
                                      //     child: MultiDayOne(
                                      //       fromDate: widget.from_date!,
                                      //       todate: widget.to_date!,
                                      //       branch_id: value.branchid[2],
                                      //       period: "1",
                                      //     ),
                                      //   ),
                                      //   Container(
                                      //     child: MultiDayOne(
                                      //       fromDate: widget.from_date!,
                                      //       todate: widget.to_date!,
                                      //       branch_id: value.branchid[3],
                                      //       period: "1",
                                      //     ),
                                      //   ),
                                      // ],
                                      ),
                                ),
                              ])),
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
            child: Container(
              child: MultiDayOne(
                fromDate: widget.from_date!,
                todate: widget.to_date!,
                branch_id: e,
                period: "1",
              ),
            ),
          ),
        );
      },
    );
  }
}
