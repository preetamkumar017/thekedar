import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thekedar/data/response/status.dart';
import 'package:thekedar/models/login/login_model.dart';
import 'package:thekedar/res/components/general_exception.dart';
import 'package:thekedar/res/components/internet_exceptions_widget.dart';
import 'package:thekedar/view/flutter_flow/flutter_flow_theme.dart';
import 'package:thekedar/view_models/controller/work/submit_progress_controller.dart';

class SelectSiteView extends StatefulWidget {
  const SelectSiteView({super.key});

  @override
  State<SelectSiteView> createState() => _SelectSiteViewState();
}

class _SelectSiteViewState extends State<SelectSiteView> {
final tdc = Get.put(SubmitProgressController());

@override
  void initState() {
    // TODO: implement initState
  tdc.getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select Site"),
          centerTitle: true,
        ),

        body: Container(
          child: Obx(() {
            switch (tdc.rxRequestStatusSite.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                if (tdc.error.value == 'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {
                      tdc.getData();
                    },
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {
                    // homeController.refreshApi();

                    tdc.getData();
                  });
                }
              case Status.COMPLETED:
                if (tdc.siteList.value.result != null) {
                  String numbers = tdc.siteList.value.result!.assignSite ?? "";
                  String names = tdc.siteList.value.result!.siteNames ?? "";

                  List<String> numberList = numbers.isNotEmpty ? numbers.split(',') : [];
                  List<String> nameList = names.isNotEmpty ? names.split(',') : [];


                  Map<String, String> keyValuePairs = {};

                  for (int i = 0; i < numberList.length; i++) {
                    if (i < nameList.length) {
                      keyValuePairs[numberList[i]] = nameList[i];
                    } else {
                      // Handle case where numberList has more elements than nameList (if needed)
                      keyValuePairs[numberList[i]] = '';
                    }
                  }

                  return  ListView.builder(
                    itemCount: numberList.length,
                    itemBuilder: (context, index) {

                      final bool isEven = index % 2 == 0;
                      Color? color = isEven ? Colors.white : Colors.grey[100];

                      return Container(
                        color: color,
                        child: ListTile(
                          onTap: () {
                            Get.back(result: [numberList[index],nameList[index]]);
                           },
                          title: Text( nameList[index] ?? "",style: FlutterFlowTheme.of(context).subtitle1,),
                          iconColor: FlutterFlowTheme.of(context).primaryBackground,
                          trailing: const Icon(Icons.arrow_forward,weight: 2.0,size: 30),
                          leading: const Icon(Icons.home),
                          splashColor: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                      );
                    },
                  );
                } else {
                  return Text("No data Found");
                }
            }
          }),
        ),
      ),
    );
  }
}
