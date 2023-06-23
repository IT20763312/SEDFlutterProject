final String tableBusinessRegistration = 'BusinessRegistration';

class BusinessRegistrationFields {

  static final String id = 'id';
  static final String ID = "businessRegistrationId";
  static final String BUSINESS_REGISTRATION= "Name";
}


class BusinessRegistration {
  int id;
  String ID;
  String businessRegistration;


  BusinessRegistration({this.id, this.ID, this.businessRegistration});




  Map<String, Object> toJson() =>{
    BusinessRegistrationFields.ID: ID ,
    BusinessRegistrationFields.BUSINESS_REGISTRATION: businessRegistration ,
  };

  static BusinessRegistration fromJsonDb(Map<String,Object>json) =>BusinessRegistration(
    id: json[BusinessRegistrationFields.id] as int,
    ID: json[BusinessRegistrationFields.ID] as String,
    businessRegistration: json[BusinessRegistrationFields .BUSINESS_REGISTRATION] as String,
  );

}