
import 'package:jsw/Utill/app_required.dart';
import 'package:jsw/features/meetingDashboard/service/MeetingOptionService.dart';

import 'package:jsw/features/meetingDashboard/controller/MeetingOptionController.dart';


class MeetingOptionBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<MeetingOptionController>(() => MeetingOptionController());
    Get.lazyPut<MeetingOptionService>(() => MeetingOptionService());

  }

}