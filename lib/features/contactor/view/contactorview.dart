import 'package:jsw/features/contactor/controller/contactorController.dart';
import 'package:jsw/features/contactor/model/contactorModel.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../Utill/app_required.dart';
import '../../../Utill/custom_loader_widget.dart';
import '../../attendee/model/Table_Attendee.dart';
import '../../invite/controller/inviteController.dart';
import '../../menu/dottedDivider.dart';

class ContactorView extends GetView<ContactorController>  {
  // final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whites,

      appBar: AppBar(
        leading: Row(children: [IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.primaryColor,size: 30,),
          onPressed: () {
            Get.back();
          },

        ),Text('Dealer Name',style: Styles.headerTitel,),]),
        backgroundColor: Colors.white,
        elevation: 5,
        leadingWidth: 200,
        iconTheme:  const IconThemeData(size: 37, color: AppColors.primaryColor),
        shadowColor: AppColors.gray.withOpacity(0.5),
        surfaceTintColor: Colors.transparent,
      ),

      body:  Obx(() {return controller.isLoading==true?CustomLoaderWidget(color: AppColors.primaryColor,):CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
              [
                 ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge,right: Dimensions.paddingSizeLarge,
                      bottom: Dimensions.paddingSizeMoreExtraLarge
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:controller.live.length,
                  itemBuilder: (context, index) {
                    ContactorModel order = controller.live[index];
                    return Container(
                       height: 80,
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(
                          left: Dimensions.paddingSizeSmall,
                          right: Dimensions.paddingSizeSmall,
                          top: Dimensions.paddingSizeSmall,
                          bottom: Dimensions.paddingSizeSmall
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whites,
                        borderRadius: BorderRadius.circular(Dimensions.radiusSizeMedium),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${index+1}.",
                            style: Styles.headerTitel,
                          ),
                          const SizedBox(width: 6),
                          
                          Text(
                            order.fldRole,
                            style: Styles.headerTitel,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            " - ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () => CallService.makeDirectCall("878767656"),
                            child:  Text(
                              order.fldmobile.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      )



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
                )
              ]
          ))
        ],
      );
      }),
      // floatingActionButton: FloatingActionButton(
      //     onPressed:()=> controller.addAttendee(),
      //     backgroundColor: AppColors.primaryColor,
      //     child: Icon(Icons.add,color: AppColors.whites,size: 42,),
      //     shape: CircleBorder()
      // ),
    );
  }
}
