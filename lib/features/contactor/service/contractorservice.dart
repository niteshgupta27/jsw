import '../../../Utill/AppConstants.dart';
import '../../../Utill/app_base_client.dart';
import '../model/contactorModel.dart';

class ContractorService {
  String TAG = "ContractorService";


  Future<ContactorModelResponse> gethomedata({atendee_id}) async {
    try {
      // final response;


      final response = await BaseClient.sharedClient.getRequest(
          endPoint: "${AppConstants.attendee_contractors_call}$atendee_id");
      print("response=====$response");
      return ContactorModelResponse.fromJson(
          response as Map<String, dynamic>);
    } catch (exception) {
      print("response=====$exception");
      rethrow;
    }
  }
}