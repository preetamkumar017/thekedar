import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:thekedar/view/flutter_flow/flutter_flow_theme.dart';


class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen( {Key? key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {

  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {

    _pdfViewerController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 35,
          backgroundColor:
          Colors.transparent, // Set the background color to transparent
          elevation: 0, // Remove the elevation
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primary
            ), // Set the back arrow color to black
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SfPdfViewer.network(
            widget.path ?? "",
            controller: _pdfViewerController,
            key: _pdfViewerStateKey),
      ),
    );
  }
}



class PDFFileScreen extends StatefulWidget {
  final String path;

  PDFFileScreen( {Key? key,required this.path}) : super(key: key);

  _PDFFileScreenState createState() => _PDFFileScreenState();
}

class _PDFFileScreenState extends State<PDFFileScreen> with WidgetsBindingObserver {

  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {

    _pdfViewerController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 35,
          backgroundColor:
          Colors.transparent, // Set the background color to transparent
          elevation: 0, // Remove the elevation
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primary
                    ), // Set the back arrow color to black
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SfPdfViewer.file(
            File(widget.path),
            controller: _pdfViewerController,
            key: _pdfViewerStateKey),
      ),
    );
  }
}


