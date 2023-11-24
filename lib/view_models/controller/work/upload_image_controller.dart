import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:thekedar/repository/thekedar/thekedar_repository.dart';
import 'package:thekedar/res/routes/routes_name.dart';
import 'package:thekedar/utils/utils.dart';
import 'package:thekedar/view_models/controller/work/submit_progress_controller.dart';

class UploadImageController extends GetxController {

  final spc = Get.find<SubmitProgressController>();

  RxInt itemCount = 0.obs;
  get getItemCount => itemCount.value;
  set setItemCount(int value) => itemCount.value = value;

  RxString date = DateFormat('dd-MM-yyyy').format(DateTime.now()).obs;
  get getDate => date.value;
  set setDate(String value) => date.value = value;

  final Rx<ImagePicker> picker = ImagePicker().obs;
  get getPicker => picker.value;

  RxList<File?> _image = <File?>[].obs;
  RxList<http.MultipartFile>? files;

  List<File?> get getImagesList => _image.value;
  int get getImagesListLength => _image.value.length;
  Future<void> addImagesList(File? file) async {
    _image.add(file);
  }

  void removeIndex(int index) {
    _image.removeAt(index);
  }

  RxBool loading = false.obs;
  get getLoading => loading.value;
  setLoading(bool value) {
    loading.value = value;
  }

  RxString progress = "".obs;
  get getProgress => progress.value;
  set setProgress(String value) {
    progress.value = value;
  }

  final _myrepo = ThekedarRepository();

  Future<void> uploadImage() async {
    if(_image.isNotEmpty){
      Map<String, String> data = <String, String>{
        "thekedar_id":spc.getThekedarId,
        "theka_id": spc.thekaType.value.result!.id ?? "",
        "theka_rate": spc.thekaType.value.result!.thekaRate ?? "0",
        "site_id": spc.getSiteId,
        "work_complete": spc.getProgressText,
        "work_amount": (int.parse(spc.getProgressText)*int.parse(spc.thekaType.value.result!.thekaRate ?? "0")).toString(),
        "remark": spc.getRemarkText,
      };
      log(data.toString());
      setLoading(true);

      List<http.MultipartFile> multipartFiles = [];
      for (File? imageFile in _image) {
        if (imageFile != null) {
          http.MultipartFile file = await http.MultipartFile.fromPath(
            "images[]",
            imageFile.path,
            contentType: MediaType('image', 'jpeg'),
          );
          multipartFiles.add(file);
        }
      }

      _myrepo.uploadImageApi(multipartFiles, data).then((value) {
        print(value.toJson().toString());
        if (value.code == 200) {
          clearVariables();
          Get.offAllNamed(RouteName.dashboardView);
        } else {
          Utils.toastMessage(value.message.toString());
        }
        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);
      });
    }else
      {
        Utils.toastMessage("Please take attlist one image");
      }
  }

  void clearVariables() {
    itemCount.value = 0;
    date.value = DateFormat('dd-MM-yyyy').format(DateTime.now());
    _image.clear();
    files?.clear();
    loading.value = false;
    progress.value = "";
  }
}
