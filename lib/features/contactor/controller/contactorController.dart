
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../attendee/model/Table_Attendee.dart';
import '../model/contactorModel.dart';

class ContactorController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ContactorModel>live = <ContactorModel>[].obs;
RxString titel="".obs;
  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    print(arguments);
    if (arguments != null) {
      Table_Attendee data = arguments['Attendees'];
      titel.value=data.fldAttendeeName;
    }
    live.addAll([
      ContactorModel(fldSid: 1, fldRole: "Ramesh Sharma", fldmobile: 9876543210),
      ContactorModel(fldSid: 2, fldRole: "Ritesh Prajapati", fldmobile: 9123456789),
    ]);
  }
}
