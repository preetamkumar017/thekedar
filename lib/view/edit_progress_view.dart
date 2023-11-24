import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thekedar/models/thekedar_work_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thekedar/data/response/status.dart';
import 'package:thekedar/models/login/login_model.dart' as login;
import 'package:thekedar/res/components/general_exception.dart';
import 'package:thekedar/res/components/internet_exceptions_widget.dart';
import 'package:thekedar/res/routes/routes_name.dart';
import 'package:thekedar/utils/utils.dart';
import 'package:thekedar/view/flutter_flow/flutter_flow_theme.dart';
import 'package:thekedar/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:thekedar/view_models/controller/work/submit_progress_controller.dart';

class EditProgressView extends StatefulWidget {
  const EditProgressView({Key? key}) : super(key: key);

  @override
  _EditProgressViewState createState() => _EditProgressViewState();
}

class _EditProgressViewState extends State<EditProgressView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final spc = Get.put(SubmitProgressController());
  final Result data = Get.arguments as Result;

  @override
  void initState() {
    spc.getThekaType();
    spc.setSiteNameText = data.siteName ?? "";
    spc.setSiteId = data.siteId ?? "";
    spc.setProgressText = data.workComplete ?? "";
    spc.setRemarkText = data.remark ?? "";
    spc.setRate = data.thekaRate ?? "";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<login.Result> getData() async {
    login.Result result = login.Result();
    SharedPreferences sp = await SharedPreferences.getInstance();
    final resultJsonString = sp.getString('result');

    if (resultJsonString != null) {
      final resultJson = jsonDecode(resultJsonString);
      result = login.Result.fromJson(resultJson);
      spc.setThekedarId = result.id ?? "";
      spc.setThekedarName= result.fullName ?? "";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Obx(() {
              getData();
              switch (spc.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  if (spc.error.value == 'No internet') {
                    return InterNetExceptionWidget(
                      onPress: () {
                        spc.getData();
                      },
                    );
                  } else {
                    return GeneralExceptionWidget(onPress: () {
                      // homeController.refreshApi();

                      spc.getData();
                    });
                  }
                case Status.COMPLETED:
                  if (spc.thekaType.value.result != null) {

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 25, 0, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 40, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(30, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Hello!',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primary,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Text(
                                                    spc.getThekedarName ,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 30, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width:
                                                  MediaQuery.sizeOf(context)
                                                      .width *
                                                      0.25,
                                                  height:
                                                  MediaQuery.sizeOf(context)
                                                      .height *
                                                      0.03,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondary,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        15),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Icon(
                                                        Icons.update,
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primary,
                                                        size: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            2, 0, 0, 0),
                                                        child: Text(
                                                          DateFormat(
                                                              "dd-MMM-yyyy")
                                                              .format(DateTime
                                                              .now()),
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Poppins',
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primary,
                                                            fontSize: 11,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Row(
                                    //   mainAxisSize: MainAxisSize.max,
                                    //   mainAxisAlignment:
                                    //   MainAxisAlignment.center,
                                    //   children: [
                                    //     Text(
                                    //       'Daily Work Status',
                                    //       textAlign: TextAlign.center,
                                    //       style: FlutterFlowTheme.of(context)
                                    //           .bodyMedium
                                    //           .override(
                                    //         fontFamily: 'Poppins',
                                    //         color:
                                    //         FlutterFlowTheme.of(context)
                                    //             .primary,
                                    //         fontSize: 14,
                                    //         fontWeight: FontWeight.w500,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${spc.thekaType.value.result!.thekaName} [ ${data.remark}/${spc.thekaType.value.result!.rateUnit} ]",
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Select Site',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: ' *', // Add asterisk
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold, // Make the asterisk bold
                                                    color: Colors.red, // Set asterisk color to red
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30, 5, 30, 0),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 0),
                                            )
                                          ],
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: spc.getSiteName,
                                          readOnly: true,
                                          onTap: () async {
                                            List<String> site = await Get.toNamed(RouteName.selectSite) ;
                                            if(site.length != 0)
                                            {
                                              log("sf"+site[0]);
                                              log(site[1]);
                                              spc.setSiteId = site[0];
                                              spc.setSiteNameText = site[1];
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              border: InputBorder
                                                  .none, // This removes the border
                                              // hintText: 'Enter text',
                                              contentPadding:
                                              EdgeInsets.only(left: 20)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Progress',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: ' *', // Add asterisk
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold, // Make the asterisk bold
                                                    color: Colors.red, // Set asterisk color to red
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30, 5, 30, 0),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 0),
                                            )
                                          ],
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: spc.getProgress,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              border: InputBorder
                                                  .none, // This removes the border
                                              // hintText: 'Enter ',
                                              contentPadding:
                                              EdgeInsets.only(left: 20)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Remark',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text: ' ', // Add asterisk
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold, // Make the asterisk bold
                                                    color: Colors.red, // Set asterisk color to red
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30, 5, 30, 0),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 0),
                                            )
                                          ],
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: spc.getRemark,
                                          maxLines: null,
                                          decoration: const InputDecoration(
                                              border: InputBorder
                                                  .none, // This removes the border
                                              // hintText: 'Enter text',
                                              contentPadding:
                                              EdgeInsets.all(20)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if(spc.siteName.value.text=="")
                                              {
                                                Utils.flushBarErrorMessage("Site Name Can not be Empty", context);
                                              }else if(spc.progress.value.text=="")
                                              {
                                                Utils.flushBarErrorMessage("Progress Can not be Empty", context);
                                              }else
                                              {

                                                spc.editData(context,data.id.toString());
                                              }
                                            },
                                            text: 'Next',
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 40,
                                              padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              iconPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                              textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                              elevation: 2,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text("No data Found");
                  }
              }
            }),
          ),
        ),
      ),
    );
  }
}
