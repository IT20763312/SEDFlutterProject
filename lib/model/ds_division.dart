final String tableDsDivisons = 'DsDivisions';

class DsDivisionDataFields {

  static final String id = 'id';
  static final String DIVISION_ID = "Division_Id";
  static final String DISTRICT_ID= "District_Id";
  static final String DIVISION = "Division";

}


class DsDivision {
  int id;
  String divisionId;
  String dsDivisionName;
  String districtId;


  DsDivision({this.id, this.divisionId, this.dsDivisionName, this.districtId});

  DsDivision copy({
    int id,
    String districtId,
    String divisionId,
    String dsDivisionName,
  }) => DsDivision(
    id: id ?? this.id,
    districtId: districtId ?? this.districtId,
    divisionId: divisionId ?? this.divisionId,
   dsDivisionName: dsDivisionName ?? this.dsDivisionName,
  );

  DsDivision.fromJson(Map<String, dynamic> json) {
    divisionId= json['DIVISION_ID'];
    districtId= json['DISTRICT_ID'];
    dsDivisionName= json['DIVISION'];
  }

  Map<String, Object> toJson() =>{
    DsDivisionDataFields.DISTRICT_ID: districtId ,
    DsDivisionDataFields.DIVISION_ID: divisionId ,
    DsDivisionDataFields.DIVISION: dsDivisionName ,
  };

  static DsDivision fromJsonDb(Map<String,Object>json) =>DsDivision(
    id: json[DsDivisionDataFields.id] as int,
    districtId: json[DsDivisionDataFields.DISTRICT_ID] as String,
    divisionId: json[DsDivisionDataFields.DIVISION_ID] as String,
    dsDivisionName: json[DsDivisionDataFields.DIVISION] as String,
  );


}