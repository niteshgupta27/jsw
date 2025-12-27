class ContactorModelResponse {
  final int status;
  final bool success;
  final String message;
  final List<ContactorModel> data;

  ContactorModelResponse({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  factory ContactorModelResponse.fromJson(Map<String, dynamic> json) {
    return ContactorModelResponse(
      status: json['status'] ?? 0,
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List?)?.where((element) => element != null).map((item) => ContactorModel.fromJson(item)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
class ContactorModel {
  final int fldSid;
  final String fldRole;
  final int fldmobile;
  //final DateTime fldCreatedAt;
  //final DateTime fldUpdatedAt;

  ContactorModel({
    required this.fldSid,
    required this.fldRole,
     required this.fldmobile,
    // required this.fldCreatedAt,
    //required this.fldUpdatedAt,
  });

  factory ContactorModel.fromJson(Map<String, dynamic> json) {
    return ContactorModel(
      fldSid: int.tryParse(json['fld_sid'].toString())??0,
      fldRole: json['fld_role']??"",
        fldmobile:json['fldmobile']??"",
      // fldStatus: json['fld_status']??1,
      // fldCreatedAt: DateTime.parse(json['fld_created_at']),
      //fldUpdatedAt: DateTime.parse(json['fld_updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fld_sid': fldSid,
      'fld_role': fldRole,
      //'fld_status': fldStatus,
      // 'fld_created_at': fldCreatedAt.toIso8601String(),
      //'fld_updated_at': fldUpdatedAt.toIso8601String(),
    };
  }
}
