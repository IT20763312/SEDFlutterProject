final String tableEducationalQualification = 'EducationalQualification';

class EducationalQualificationDataFields {

  static final String id = 'id';
  static final String QUALIFICATION_ID = "QualificationId";
  static final String QUALIFICATION_NAME= "Name";

}

class EducationalQualification {
  int id;
  String qualificationId;
  String qualificationName;


  EducationalQualification({this.id, this.qualificationId, this.qualificationName});

  EducationalQualification copy({
    int id,
    String qualificationId,
    String qualificationName,
  }) => EducationalQualification(
    id: id ?? this.id,
    qualificationId: qualificationId ?? this.qualificationId,
    qualificationName: qualificationName ?? this.qualificationName,
  );



  EducationalQualification.fromJson(Map<String, dynamic> json) {
    qualificationId = json['QUALIFICATION_ID'];
    qualificationName = json['QUALIFICATION'];
  }

  Map<String, Object> toJson() =>{
    EducationalQualificationDataFields.QUALIFICATION_ID: qualificationId ,
    EducationalQualificationDataFields.QUALIFICATION_NAME: qualificationName ,

  };

  static EducationalQualification fromJsonDb(Map<String,Object>json) =>EducationalQualification(
    id: json[EducationalQualificationDataFields.id] as int,
    qualificationId: json[EducationalQualificationDataFields.QUALIFICATION_ID] as String,
    qualificationName: json[EducationalQualificationDataFields.QUALIFICATION_NAME] as String,

  );
}