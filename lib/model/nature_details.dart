final String tableNatureDetails = 'BusinessNature';

class NatureDetailsFields {

  static final String id = 'id';
  static final String NATURE_ID = "NatureId";
  static final String NATURE= "Name";
}

class NatureDetails {
  int id;
  String natureId;
  String nature;


  NatureDetails({this.id, this.natureId, this.nature});

  NatureDetails copy({
    int id,
    String natureId,
    String nature,
  }) => NatureDetails(
    id: id ?? this.id,
    natureId: natureId ?? this.natureId,
    nature: nature ?? this.nature,
  );


  NatureDetails.fromJson(Map<String, dynamic> json) {
    natureId = json['ID'];
    nature = json['NATURE'];
  }

  Map<String, Object> toJson() =>{
    NatureDetailsFields.NATURE_ID: natureId ,
    NatureDetailsFields.NATURE: nature ,
  };

  static NatureDetails fromJsonDb(Map<String,Object>json) =>NatureDetails(
    id: json[NatureDetailsFields.id] as int,
    natureId: json[NatureDetailsFields.NATURE_ID] as String,
    nature: json[NatureDetailsFields.NATURE] as String,

  );

}