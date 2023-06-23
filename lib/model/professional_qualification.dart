final String tableProfessionalQualification = 'ProfessionalQualification';

class ProfessionalQualificationDataFields {

  static final String id = 'id';
  static final String QUALIFICATION_ID = "QualificationId";
  static final String QUALIFICATION_NAME= "Name";

}

class ProfessionalQualification {
  int id;
  String qualificationId;
  String qualificationName;


  ProfessionalQualification({this.id, this.qualificationId, this.qualificationName});

  ProfessionalQualification copy({
    int id,
    String qualificationId,
    String qualificationName,
  }) => ProfessionalQualification(
    id: id ?? this.id,
    qualificationId: qualificationId ?? this.qualificationId,
    qualificationName: qualificationName ?? this.qualificationName,
  );




  ProfessionalQualification.fromJson(Map<String, dynamic> json) {
    qualificationId = json['ID'];
    qualificationName = json['QUALIFICATION'];
  }

  Map<String, Object> toJson() =>{
    ProfessionalQualificationDataFields.QUALIFICATION_ID: qualificationId ,
    ProfessionalQualificationDataFields.QUALIFICATION_NAME: qualificationName ,
  };

  static ProfessionalQualification fromJsonDb(Map<String,Object>json) =>ProfessionalQualification(
    id: json[ProfessionalQualificationDataFields.id] as int,
    qualificationId: json[ProfessionalQualificationDataFields.QUALIFICATION_ID] as String,
    qualificationName: json[ProfessionalQualificationDataFields.QUALIFICATION_NAME] as String,

  );
}
