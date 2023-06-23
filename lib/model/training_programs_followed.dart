final String tableTrainingProgramsFollowed = 'TrainingPrograms';

class TrainingProgramsFollowedFields {

  static final String id = 'id';
  static final String ID = "TrainingId";
  static final String TRAINING_PROGRAM= "Name";
}

class TrainingProgramsFollowed {
  int id;
  String trainingId;
  String programName;


  TrainingProgramsFollowed({this.id, this.programName, this.trainingId});

  Map<String, Object> toJson() =>{
    TrainingProgramsFollowedFields.ID: trainingId ,
    TrainingProgramsFollowedFields.TRAINING_PROGRAM: programName ,
  };

  static TrainingProgramsFollowed fromJsonDb(Map<String,Object>json) => TrainingProgramsFollowed(
    id: json[TrainingProgramsFollowedFields.id] as int,
    trainingId: json[TrainingProgramsFollowedFields.ID] as String,
    programName: json[TrainingProgramsFollowedFields.TRAINING_PROGRAM] as String,
  );


}