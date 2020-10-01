class PhoneModel {
  final String phoneNumber;
  final String areaCode;

  PhoneModel({this.phoneNumber, this.areaCode});

  @override
  String toString() {
    return 'PhoneModel{phoneNumber: $phoneNumber, areaCode: $areaCode}';
  }
}