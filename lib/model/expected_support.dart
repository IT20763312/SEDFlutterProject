final String tableExpectedSupport = 'ExpectedSupport';

class ExpectedSupportDataFields {

  static final String id = 'id';
  static final String SUPPORT_ID = "SupportId";
  static final String SUPPORT_NAME= "Name";

}

class ExpectedSupport {
  int id;
  String supportId;
  String supportName;


  ExpectedSupport({this.id, this.supportId, this.supportName});

  ExpectedSupport copy({
    int id,
    String supportId,
    String supportName,
  }) => ExpectedSupport(
    id: id ?? this.id,
    supportId: supportId ?? this.supportId,
    supportName: supportName ?? this.supportName,
  );

  ExpectedSupport.fromJson(Map<String, dynamic> json) {
    supportId= json['ID'];
    supportName= json['SUPPORT'];
  }

  Map<String, Object> toJson() =>{
    ExpectedSupportDataFields.SUPPORT_ID:supportId ,
    ExpectedSupportDataFields.SUPPORT_NAME:supportName ,
  };

  static ExpectedSupport fromJsonDb(Map<String,Object>json) =>ExpectedSupport(
    id: json[ExpectedSupportDataFields.id] as int,
    supportId: json[ExpectedSupportDataFields.SUPPORT_ID] as String,
    supportName: json[ExpectedSupportDataFields.SUPPORT_NAME] as String,

  );
}