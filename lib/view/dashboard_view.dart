import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:thekedar/models/dashboard_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thekedar/data/response/status.dart';
import 'package:thekedar/res/components/general_exception.dart';
import 'package:thekedar/res/components/internet_exceptions_widget.dart';
import 'package:thekedar/res/routes/routes_name.dart';
import 'package:thekedar/view/flutter_flow/flutter_flow_theme.dart';
import 'package:thekedar/view_models/controller/work/dashboard_controller.dart';

import '../models/login/login_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final wLController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    wLController.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF5FBFB),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0x4C06D5CD),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF06D5CD),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.profileView);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?w=1280&h=720',
                                width: 36,
                                height: 36,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Text(
                          'Hello, ',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: const Color(0xFF101518),
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                      FutureBuilder(
                          future: _getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    2, 0, 0, 0),
                                child: Text(
                                  snapshot.data!.fullName ?? "",
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF101518),
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 310,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 16, 16, 16),
                        child: Obx(() {
                          switch (wLController.rxRequestStatus.value) {
                            case Status.LOADING:
                              return const Center(
                                  child: CircularProgressIndicator());
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
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dashboard',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFF101518),
                                          fontSize: 24,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                    child: Text(
                                      'Welcome to your dashboard.',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFF57636C),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: const Color(0xFFDFEDEC),
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24, 0, 24, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 16, 0),
                                                child: Icon(
                                                  Icons.trending_up_rounded,
                                                  color: Color(0xFF18AA99),
                                                  size: 32,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Current Rate',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: const Color(
                                                                0xFF57636C),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  0, 4, 4, 0),
                                                          child: Text(
                                                            wLController
                                                                    .dashboardData
                                                                    .value
                                                                    .thekaRate ??
                                                                "",
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: const Color(
                                                                      0xFF101518),
                                                                  fontSize:
                                                                      36,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  0, 4, 0, 0),
                                                          child: Text(
                                                            '(per ${wLController.dashboardData.value.rateUnit})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: const Color(
                                                                      0xFF18AA99),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, -1.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 0),
                                                  child: Icon(
                                                    Icons.more_vert,
                                                    color: Color(0xFF57636C),
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            RouteName.workCompletedListView);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: const Color(0xFFDFEDEC),
                                            width: 2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24, 0, 24, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 16, 0),
                                                child: Icon(
                                                  Icons.trending_up_rounded,
                                                  color: Color(0xFF18AA99),
                                                  size: 32,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Total Approved',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: const Color(
                                                                0xFF57636C),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                    0, 4, 4, 0),
                                                            child: Text(
                                                              wLController
                                                                      .dashboardData
                                                                      .value
                                                                      .totalWorkComplete ??
                                                                  "",
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: const Color(
                                                                        0xFF101518),
                                                                    fontSize:
                                                                        30,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, -1.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 0),
                                                  child: Icon(
                                                    Icons.more_vert,
                                                    color: Color(0xFF57636C),
                                                    size: 20,
                                                  ),
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
                          }
                        }),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 260,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 4, 0, 0),
                              child: Text(
                                'Work Progress List',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF101518),
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 4, 0, 0),
                              child: Text(
                                'Below is a list of your work progress.',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: const Color(0xFF57636C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Obx(() {
                              switch (wLController.rxRequestStatus.value) {
                                case Status.LOADING:
                                  return const Center(
                                      child: CircularProgressIndicator());
                                case Status.ERROR:
                                  if (wLController.error.value ==
                                      'No internet') {
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
                                  if(wLController.dashboardData.value.thekaList != null) {
                                    return Expanded(
                                      child: ListView.builder(
                                          itemCount: wLController.dashboardData
                                              .value.thekaList!.length,
                                          itemBuilder: (context, index) {
                                            ThekaList data = wLController
                                                .dashboardData
                                                .value
                                                .thekaList![index];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 16, 1),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(8, 12, 8, 12),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 36,
                                                        height: 36,
                                                        decoration:
                                                        const BoxDecoration(
                                                          color:
                                                          Color(0xFF06D5CD),
                                                          shape: BoxShape
                                                              .circle,
                                                        ),
                                                        alignment:
                                                        const AlignmentDirectional(
                                                            0.00, 0.00),
                                                        child: Text(
                                                          data.siteName !=
                                                              null &&
                                                              data.siteName!
                                                                  .isNotEmpty
                                                              ? data.siteName!
                                                              .substring(0, 1)
                                                              : "",
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'Inter',
                                                            color:
                                                            Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight
                                                                .normal,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              12, 0, 0, 0),
                                                          child: Text(
                                                            data.siteName ?? "",
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyLarge
                                                                .override(
                                                              fontFamily:
                                                              'Inter',
                                                              color: const Color(
                                                                  0xFF101518),
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        data.createDate ?? "",
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .labelMedium
                                                            .override(
                                                          fontFamily: 'Inter',
                                                          color: const Color(
                                                              0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  }else
                                    {
                                      return Text("No Data Found");
                                    }
                              }
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Add Today's Work",
          onPressed: () {
            Get.toNamed(RouteName.submitProgress);
          },
          child: Icon(Icons.add, size: 30),
          backgroundColor: FlutterFlowTheme.of(context).primary,
        ),
      ),
    );
  }

  Future<Result> _getData() async {
    Result result = Result();
    SharedPreferences sp = await SharedPreferences.getInstance();
    final resultJsonString = sp.getString('result');

    if (resultJsonString != null) {
      final resultJson = jsonDecode(resultJsonString);
      result = Result.fromJson(resultJson);
    }
    return result;
  }
}
