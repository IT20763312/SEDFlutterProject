final String tableBusinessRelatedProblem = 'BusinessRelatedProblem';

class BusinessRelatedProblemDataFields {

  static final String id = 'id';
  static final String PROBLEM_ID = "ProblemId";
  static final String PROBLEM_NAME= "Name";

}


class BusinessRelatedProblem {
  int id;
  String problemId;
  String problemName;


  BusinessRelatedProblem({this.id, this.problemId, this.problemName});

  BusinessRelatedProblem copy({
    int id,
    String problemId,
    String problemName,
  }) => BusinessRelatedProblem(
    id: id ?? this.id,
    problemId: problemId ?? this.problemId,
    problemName: problemName ?? this.problemName,
  );

  BusinessRelatedProblem.fromJson(Map<String, dynamic> json) {
    problemId= json['ID'];
    problemName= json['PROBLEM'];
  }

  Map<String, Object> toJson() =>{
    BusinessRelatedProblemDataFields.PROBLEM_ID: problemId ,
    BusinessRelatedProblemDataFields.PROBLEM_NAME: problemName ,

  };

  static BusinessRelatedProblem fromJsonDb(Map<String,Object>json) =>BusinessRelatedProblem(
    id: json[BusinessRelatedProblemDataFields.id] as int,
    problemId: json[BusinessRelatedProblemDataFields.PROBLEM_ID] as String,
    problemName: json[BusinessRelatedProblemDataFields.PROBLEM_NAME] as String,

  );
}