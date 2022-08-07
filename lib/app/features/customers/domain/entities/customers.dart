class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.phone,
  });

  int id;
  String name;
  String phone;

  int? customerTypeId;
  String? customerTypeString;

  int? nationalityId;
  String? _nationalityString;

  set nationalityString(String? value) {
    _nationalityString = value;
  }

  String get nationalityString {
    if (_nationalityString == null) {
      return 'غير محدد';
    }
    return _nationalityString.toString();
  }

  int? typeId;
  String? typeString;

  String? idNumber;
  String? idExpireDate;

  int? genderId;
  String? _genderString;

  set genderString(String? value) {
    _genderString = value;
  }

  String get genderString {
    if (_genderString == null) {
      return 'غير محدد';
    }
    return _genderString.toString();
  }

  String? email;

  String? birthdayDate;

  String? address;

  String? work;
  String? workPhone;

  int? customerCategoryId;

  String? _customerCategoryString;
  set customerCategoryString(String value) {
    _customerCategoryString = value;
  }

  String get customerCategoryString {
    if (_customerCategoryString == null) {
      return 'غير معروف';
    }
    return _customerCategoryString.toString();
  }
}
