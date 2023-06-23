final String tableTrainingNeeds = 'TrainingNeeds';

class TrainingNeedsFields {

  static final String id = 'id';
  static final String ID = "TrainingNeedsId";
  static final String PROGRAMME_NAME= "Name";
}


class TrainingNeeds {
  int id;
  String ID;
  String programmeName;


  TrainingNeeds({this.id, this.ID, this.programmeName});

  TrainingNeeds copy({
    int id,
    String ID,
    String programmeName,
  }) => TrainingNeeds(
    id: id ?? this.id,
    ID: ID ?? this.ID,
    programmeName:programmeName ?? this.programmeName,
  );



  TrainingNeeds.fromJson(Map<String, dynamic> json) {
    ID= json['ID'];
    programmeName= json['PROGRAMME_NAME'];
  }

  Map<String, Object> toJson() =>{
    TrainingNeedsFields.ID: ID ,
    TrainingNeedsFields.PROGRAMME_NAME: programmeName ,
  };

  static TrainingNeeds fromJsonDb(Map<String,Object>json) =>TrainingNeeds(
    id: json[TrainingNeedsFields.id] as int,
    ID: json[TrainingNeedsFields.ID] as String,
    programmeName: json[TrainingNeedsFields.PROGRAMME_NAME] as String,
  );

}