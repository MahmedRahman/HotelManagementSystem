import 'package:project/app/features/company/domain/entities/companys.dart';

class CompanysModel extends Company {
  CompanysModel({
    required id,
    required name,
    required phone,
    required email,
    required city,
    required address,
    required personInchargeName,
    required personInchargePhone,
    required taxNumber,
    required addedBy,
  }) : super(
          id: id,
          name: name,
          phone: phone,
          email: email,
          city: city,
          address: address,
          personInchargeName: personInchargeName,
          personInchargePhone: personInchargePhone,
          taxNumber: taxNumber,
          addedBy: addedBy,
        );

  factory CompanysModel.fromJson(Map<String, dynamic> json) {
    return CompanysModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      city: json['city'],
      address: json['address'],
      personInchargeName: json['personInchargeName'],
      personInchargePhone: json['personInchargePhone'],
      taxNumber: json['taxNumber'],
      addedBy: json['addedBy'],
    );
  }
}
