
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jsw/features/contactor/service/contractorservice.dart';

import '../../../Utill/Apputills.dart';
import '../../attendee/model/Table_Attendee.dart';
import '../model/contactorModel.dart';

class ContactorController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ContactorModel>live = <ContactorModel>[].obs;
RxString titel="".obs;
String atendee_id="0";
  var productServices = Get.find<ContractorService>();

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    print(arguments);
    if (arguments != null) {
      Table_Attendee data = arguments['Attendees'];
      titel.value=data.fldAttendeeName;
      atendee_id=data.fldAid.toString();
    }
    CallGetdata();
    // live.addAll([
    //   ContactorModel(fldSid: 1, fldRole: "Ramesh Sharma", fldmobile: 9876543210),
    //   ContactorModel(fldSid: 2, fldRole: "Ritesh Prajapati", fldmobile: 9123456789),
    // ]);
  }
  Future<void> CallGetdata() async {
    if (await AppUtils.checkInternetConnectivity()) {
      HomeApi();

    }else {
      AppUtils.showSnackbar("Please check Internet Connection", "Info");
    }
  }
  void HomeApi() {
    // AppUtils.alertWithProgressBar();
    isLoading.value= true;


    productServices.gethomedata(atendee_id:atendee_id ).then((value) async {
      isLoading.value = false;
      if (value.success == true) {
        // data.value=value;
        live.value=value.data;

      } else {
        // Get.back();

        AppUtils.showSnackbar(value.message.toString(),  "Info");
      }
    }).catchError((err) {
      // Get.back();
      isLoading.value = false;
      AppUtils.showSnackbar("Something went wrong","Oops");
      //AppUtils.alert("Something went wrong", title: "Oops");
    });
  }
}
