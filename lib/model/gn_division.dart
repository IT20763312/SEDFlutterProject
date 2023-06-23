final String tableGnDivision = 'GnDivision';

class GnDivisionDataFields {

  static final String dBid = 'DbId';
  static final String id = 'id';
  static final String DS_DIVISION_ID = "DsDivisionId";
  static final String GN_DIVISION_NAME= "Name";

}

class GnDivision {
  int dbId;
  String dsDivisionId;
  String gnDivisionName;
  String id;


  GnDivision({this.dsDivisionId, this.gnDivisionName, this.id,this.dbId});

  GnDivision copy({
    int dbId,
    String id,
    String dsDivisionId,
    String gnDivisionName,
  }) => GnDivision(
    dbId: dbId ?? this.dbId,
    id: id ?? this.id,
    dsDivisionId: dsDivisionId ?? this.dsDivisionId,
    gnDivisionName: gnDivisionName ?? this.gnDivisionName,
  );


  GnDivision.fromJson(Map<String, dynamic> json) {
    dsDivisionId= json['DS_DIVISION_ID'];
    gnDivisionName= json['GN_DIVISION'];
    id= json['ID'];
  }

  Map<String, Object> toJson() =>{
    GnDivisionDataFields.id:id ,
    GnDivisionDataFields.DS_DIVISION_ID:dsDivisionId ,
    GnDivisionDataFields.GN_DIVISION_NAME:gnDivisionName ,
  };

  static GnDivision fromJsonDb(Map<String,Object>json) =>GnDivision(
    dbId: json[GnDivisionDataFields.dBid] as int,
    id: json[GnDivisionDataFields.id] as String,
    dsDivisionId: json[GnDivisionDataFields.DS_DIVISION_ID] as String,
    gnDivisionName: json[GnDivisionDataFields.GN_DIVISION_NAME] as String,
  );
}