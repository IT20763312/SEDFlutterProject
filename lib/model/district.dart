final String tableDistrict = 'Districts';

class DistrictDataFields {

  static final String id = 'id';
  static final String DISTRICT_ID = "District_Id";
  static final String DISTRICT_NAME = "District_Name";

}

class District {
  int id;
  String districtId;
  String districtName;


  District({this.id, this.districtId, this.districtName});

  District copy({
    int id,
    String districtId,
    String districtName,
  }) => District(
    id: id ?? this.id,
    districtId: districtId ?? this.districtId,
    districtName: districtName ?? this.districtName,
  );

  District.fromJson(Map<String, dynamic> json) {
    districtId = json['DISTRICT_ID'];
    districtName = json['DISTRICT'];
  }

  static District fromJsonDb(Map<String,Object>json) =>District(
    id: json[DistrictDataFields.id] as int,
    districtId: json[DistrictDataFields.DISTRICT_ID] as String,
    districtName: json[DistrictDataFields.DISTRICT_NAME] as String,
  );

  Map<String, Object> toJson() =>{
    DistrictDataFields.DISTRICT_ID: districtId ,
    DistrictDataFields.DISTRICT_NAME: districtName ,
  };


}
