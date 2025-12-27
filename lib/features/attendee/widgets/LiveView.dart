
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jsw/features/attendee/controller/AttendeeController.dart';
import 'package:jsw/features/attendee/model/Table_Attendee.dart';

import '../../../Utill/app_required.dart';
import '../../menu/dottedDivider.dart';
import '../../serviceCall.dart';

class LiveView extends GetView<AttendeeController> {
  const LiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverList(delegate: SliverChildListDelegate(
            [
              Obx(() =>   ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge,right: Dimensions.paddingSizeLarge,
                    bottom: Dimensions.paddingSizeMoreExtraLarge
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount:controller.live.length,
                itemBuilder: (context, index) {
                  Table_Attendee order = controller.live[index];
                  return Container(
                    // height: 108,
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(
                        left: Dimensions.paddingSizeSmall,
                        right: Dimensions.paddingSizeSmall,
                        top: Dimensions.paddingSizeSmall,
                        bottom: Dimensions.paddingSizeSmall
                    ),
                    decoration: BoxDecoration(
                      color: order.fldAttendance == 0 && order.fldInvites == 1
                          ? AppColors.attendeBackground
                          : AppColors.whites,
                      borderRadius: BorderRadius.circular(Dimensions.radiusSizeMedium),
                    ),
                    child: Column(//mainAxisSize: MainAxisSize.min,
                      children: [
                        // First Row: Attendee Name, Edit & Delete Icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children to start and end
                            children: [
                              Text(
                                order.fldAttendeeName.toString().trim(),
                                style: Styles.headerTitel,
                              ),
                              if (order.fldAttendance == 1 || order.fldInvites == 1)
                                IconButton(
                                  icon: const Icon(Icons.edit_note_outlined, size: 20),
                                  onPressed: () => controller.editAttendee(order),
                                ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Second Row: Call Icon, Phone Number, Cart Icon, Order Status, Upload Icon
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align children to the start
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.phone_in_talk_outlined,
                                  color: order.tollfree == 1 ? Colors.green : Colors.red,
                                  size: 20,
                                ),
                                onTap: () => CallService.makeDirectCall(order.fldMobile!),
                              ),
                              Text(
                                order.fldMobile,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(width: 25),

                              const Text(
                                "Contractors: ",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.fountGray,
                                ),
                              ),

                            ],
                          ), Row( children: [
                            InkWell(child:const Icon(Icons.chat_rounded, size: 27, color: Colors.grey) ,onTap: (){
                              controller.ContactorLink();
                            },),
                            const SizedBox(width: 12),
                             InkWell(child:Icon(Icons.remove_red_eye, size: 27, color: Colors.grey),onTap: () async {
                               final result = await Get.toNamed(Routes.contactorSCREEN, arguments: { "Attendees": order});
                               if (result != null) {
                                controller.CallGetdata();
                               }
                            },),
                          ],)],)

                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index) {
                  return const DottedDivider(
                    width: 1,
                    color: Colors.grey,
                    thickness: 1,
                    gap: 4,
                  );
                },
              ))
            ]
        ))
      ],
    );
  }
}
