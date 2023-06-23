final String tableProfessionalQualificationLevels = 'ProfessionalQualificationLevel';

class ProfessionalQualificationLevelFields {

  static final String DbId = 'Id';
  static final String id = 'LocalId';
  static final String LEVEL_NAME = "LevelName";
  static final String PROFESSIONAL_QUALIFICATION_ID= "ProfessionalQualificationId";
}


class ProfessionalQualificationLevel {
  int dbId;
  String id;
  String levelName;
  String professionalQualificationId;


  ProfessionalQualificationLevel({
      this.id, this.levelName, this.professionalQualificationId,this.dbId});

  ProfessionalQualificationLevel copy({
    int dbId,
    String id,
    String levelName,
    String professionalQualificationId,
  }) => ProfessionalQualificationLevel(
    dbId: dbId ?? this.dbId,
    id: id ?? this.id,
    levelName: levelName ?? this.levelName,
    professionalQualificationId:professionalQualificationId ?? this.professionalQualificationId,
  );



  ProfessionalQualificationLevel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    professionalQualificationId= json['PROFESSIONAL_QUALIFICATION_ID'];
    levelName= json['PROFESSIONAL_QUALIFICATION_LEVEL'];
  }

  Map<String, Object> toJson() =>{
    ProfessionalQualificationLevelFields.id: id ,
    ProfessionalQualificationLevelFields.LEVEL_NAME: levelName ,
    ProfessionalQualificationLevelFields.PROFESSIONAL_QUALIFICATION_ID: professionalQualificationId ,
  };

  static  ProfessionalQualificationLevel fromJsonDb(Map<String,Object>json) => ProfessionalQualificationLevel(
    dbId: json[ProfessionalQualificationLevelFields.DbId] as int,
    id: json[ProfessionalQualificationLevelFields.id] as String,
    levelName: json[ProfessionalQualificationLevelFields.LEVEL_NAME] as String,
    professionalQualificationId: json[ProfessionalQualificationLevelFields.PROFESSIONAL_QUALIFICATION_ID] as String,

  );
}
