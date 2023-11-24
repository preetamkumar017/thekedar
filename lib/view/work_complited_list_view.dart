import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thekedar/data/response/status.dart';
import 'package:thekedar/models/thekedar_work_list_model.dart';
import 'package:thekedar/res/components/general_exception.dart';
import 'package:thekedar/res/components/internet_exceptions_widget.dart';
import 'package:thekedar/res/routes/routes_name.dart';
import 'package:thekedar/view/flutter_flow/flutter_flow_theme.dart';
import 'package:thekedar/view_models/controller/work/submit_progress_controller.dart';
import 'package:thekedar/view_models/controller/work/work_list_controller.dart';

class WorkCompletedListView extends StatefulWidget {
  const WorkCompletedListView({super.key});

  @override
  State<WorkCompletedListView> createState() => _WorkCompletedListViewState();
}

class _WorkCompletedListViewState extends State<WorkCompletedListView> {
  final wLController = Get.put(WorkListController());
  final spController = Get.put(SubmitProgressController());

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    wLController.getData();
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) selectedDate = picked;
    wLController.setDate = DateFormat("dd-MM-yyyy").format(selectedDate); //selectedDate.toLocal().toString().split(' ')[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Completed Work List"),
          centerTitle: true,
          backgroundColor: FlutterFlowTheme.of(context).tertiary),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8, 8, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: wLController.getDate,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                        labelText: 'Select Date',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                        border: InputBorder.none),
                    readOnly: true,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: wLController.getSiteName,
                    readOnly: true,
                    onTap: () async {
                      List<String> site =
                          await Get.toNamed(RouteName.selectSite);
                      if (site.length != 0) {
                        log("sf" + site[0]);
                        log(site[1]);
                        wLController.setSiteId = site[0];
                        wLController.setSiteNameText = site[1];
                        setState(() {});
                      }
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none, // This removes the border
                        hintText: 'Select Site',
                        contentPadding: EdgeInsets.only(left: 20)),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1, // You can adjust the thickness as needed
          ),
          Expanded(
            child: Obx(() {
              switch (wLController.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  if (wLController.error.value == 'No internet') {
                    return InterNetExceptionWidget(
                      onPress: () {
                        wLController.getData();
                      },
                    );
                  } else {
                    return GeneralExceptionWidget(onPress: () {
                      // homeController.refreshApi();

                      wLController.getData();
                    });
                  }
                case Status.COMPLETED:
                  if (wLController.workList.value.result != null) {
                    return Obx(() {
                      return ListView.builder(
                        itemCount: wLController.workList.value.result!.length,
                        itemBuilder: (context, index) {
                          Result result =
                              wLController.workList.value.result![index];

                          if (wLController.getDateText != "" && wLController.getSiteId != "") {

                            if (result.createDate.toString() == wLController.getDateText &&
                                result.siteId.toString() == wLController.getSiteId) {
                              return _myCard(result);
                            }
                          } else if (wLController.getDateText != "" &&
                              wLController.getSiteId == "") {
                            if (result.createDate.toString() ==
                                wLController.getDateText) {
                              return _myCard(result);
                            }
                          } else if (wLController.getDateText == "" &&
                              wLController.getSiteId != "") {
                            if (result.siteId.toString() ==
                                wLController.getSiteId) {
                              return _myCard(result);
                            }
                          } else {
                            return _myCard(result);
                          }
                          return Container(); // Return an empty container for other cases
                        },
                      );
                    });
                  } else {
                    return const Text("No data Found");
                  }
              }
            }),
          ),
        ],
      ),
    );
  }
  Widget _myCard(Result  result)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 1.5,bottom: 3),
      child: InkWell(
        onTap: () {
          if(result.isApproved!="1") {
            showBottom(result);
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                         Text("Site:-",style: FlutterFlowTheme.of(context).labelLarge,),
                        Text(result.siteName ?? "",style: FlutterFlowTheme.of(context).labelMedium,),
                      ],
                    ),
                    Row(
                      children: [
                         Text("Date:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Text(result.createDate ?? "",style: FlutterFlowTheme.of(context).labelMedium,),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                         Text("Work:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Text("${result.workComplete} ${result.rateUnit}",style: FlutterFlowTheme.of(context).labelMedium,),
                      ],
                    ),
                    Row(
                      children: [
                         Text("Rate:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Text("${result.thekaRate}/${result.rateUnit}",style: FlutterFlowTheme.of(context).labelMedium,),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                         Text("Total Amount:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Text("${result.workAmount}",style: FlutterFlowTheme.of(context).labelLarge,),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Remark:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Expanded(child: Text(result.remark ?? "",style: FlutterFlowTheme.of(context).labelLarge,
                        )),
                  ],
                ),
                if(result.isApproved=="1")Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Approved By:-",style: FlutterFlowTheme.of(context).labelLarge),
                            Text("${result.approveBy}",style: const TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                        const Row(
                          children: [
                            Text("Approved",style: TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Approval Remark:-",style: FlutterFlowTheme.of(context).labelLarge),
                            Text(result.approvalRemark ?? "",style: const TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                if(result.isApproved=="2")Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Disapprove By:-",style: FlutterFlowTheme.of(context).labelLarge),
                            Text("${result.approveBy}",style: const TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                        const Row(
                          children: [
                            Text("Disapproved",style: TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Approval Remark:-",style: FlutterFlowTheme.of(context).labelLarge),
                            Text(result.approvalRemark ?? "",style: const TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showBottom(Result result) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: () async{
                Get.back();
               await Get.toNamed(RouteName.editProgress,arguments: result);
                wLController.getData();
              }, child: const Row(
                children: [
                  Icon(Icons.edit,color: Color(0xff008500)),
                  SizedBox(width: 8,),
                  Text("Edit",style: TextStyle(color: Color(0xff008500)),),
                ],
              )),
              TextButton(onPressed: () async {
                await spController.deleteData(context,result.id ?? "0");
                wLController.getData();
              }, child: const Row(
                children: [
                  Icon(Icons.delete,color: Color(0xfff50000)),
                  SizedBox(width: 8,),
                  Text("Edit",style: TextStyle(color: Color(0xfff50000)),),
                ],
              )),

            ],
          ),
        );
      },
    );
  }

}

