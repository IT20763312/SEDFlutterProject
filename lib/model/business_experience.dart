final String tableBusinessExperience = 'BusinessExperience';

class BusinessExperienceFields {

  static final String id = 'id';
  static final String EXPERIENCE_ID = "ExperienceId";
  static final String EXPERIENCE_NAME= "Name";
}


class BusinessExperience {
  int id;
  String experienceId;
  String experienceName;


  BusinessExperience({this.id, this.experienceId, this.experienceName});

  BusinessExperience copy({
    int id,
    String experienceId,
    String experienceName,
  }) => BusinessExperience(
    id: id ?? this.id,
    experienceId: experienceId ?? this.experienceId,
    experienceName: experienceName ?? this.experienceName,
  );



  BusinessExperience.fromJson(Map<String, dynamic> json) {
    experienceId= json['ID'];
    experienceName= json['EXPERIANCE'];
  }

  Map<String, Object> toJson() =>{
    BusinessExperienceFields.EXPERIENCE_ID: experienceId ,
    BusinessExperienceFields.EXPERIENCE_NAME: experienceName ,
  };

  static BusinessExperience fromJsonDb(Map<String,Object>json) =>BusinessExperience(
    id: json[BusinessExperienceFields.id] as int,
    experienceId: json[BusinessExperienceFields.EXPERIENCE_ID] as String,
    experienceName: json[BusinessExperienceFields.EXPERIENCE_NAME] as String,

  );

}
