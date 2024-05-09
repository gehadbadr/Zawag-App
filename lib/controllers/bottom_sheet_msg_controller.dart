import 'package:effa/helper/dio_helper.dart';
import 'package:effa/models/bottom_sheet_msg/bottom_sheet_msg.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class BottomSheetController extends GetxController {
  MessageBs? messageBs;
  bool loader = false;

  Future<void> fetchMsgData(int id) async {
    try {
      loader = true;
      final Dio.Response response = await dio().get(
        'get_massages/$id',
      );
      print("BottomSheetController == ${response.data}");
      messageBs = MessageBs.fromJson(response.data);
      loader = false;
      update();
    } catch (err) {
      loader = false;
      update();
      print("BottomSheetController error == ${err}");
      // ignore: unnecessary_brace_in_string_interps
    }
  }
}
