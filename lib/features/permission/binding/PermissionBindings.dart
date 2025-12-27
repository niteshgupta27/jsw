
import 'package:get/get.dart';

import '../controller/PermissionController.dart';

class PermissionBindings extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut<PermissionController>(() => PermissionController());
    // Get.lazyPut<MeetingServices>(
    //       () => MeetingServices(),
    // );
  }


}