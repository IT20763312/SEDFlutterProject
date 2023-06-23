final String tableEntrepreneurBusinessRelatedProblem  = 'EntrepreneurBusinessRelated';

class EntrepreneurBusinessRelatedProblemDataFields {

  static final String LOCAL_ID = 'id';
  static final String SERVER_ID = 'serverId';
  static final String Nic = 'ENTREPRENEUR_NIC';
  static final String isSync = 'isSync';
  static final String BUSINESS_RELATED_PROBLEM_ID = "BUSINESS_RELATED_PROBLEM_ID";
}

class EntrepreneurBusinessRelatedProblem {
  String id;
  String localId;
  String entrepreneurNic;
  String businessRelatedProblemId;
  int isSync;

  EntrepreneurBusinessRelatedProblem({this.id, this.localId,
      this.entrepreneurNic, this.businessRelatedProblemId, this.isSync});

  EntrepreneurBusinessRelatedProblem.fromJson(Map<String, dynamic> json) {
    businessRelatedProblemId = json['BUSINESS_RELATED_PROBLEM_ID'];
    entrepreneurNic = json['ENTREPRENEUR_NIC'];
    id = json['id'];
    isSync = json['isSync'];
    localId = json['localId'];

  }

  // Map<String, dynamic> toJson(bool isNeedLocalId, {int isSyncTemp}) {
  //   final map = <String, dynamic>{};
  //   map['BUSINESS_RELATED_PROBLEM_ID'] =  businessRelatedProblemId;
  //   map['ENTREPRENEUR_NIC'] = entrepreneurNic;
  //   int tempid = int.tryParse(localId??"");
  //   if(tempid!=null && tempid>0) {
  //     map['id'] = tempid;
  //   }else{
  //     print(id);
  //   }
  //   map['serverId'] = localId;
  //   map['isSync'] = isSyncTemp??isSync;
  //   if(isNeedLocalId){
  //     map['localId'] = id;
  //   }
  //   return map;
  // }

  Map<String, Object> toJson() => {
    EntrepreneurBusinessRelatedProblemDataFields.SERVER_ID: localId,
    EntrepreneurBusinessRelatedProblemDataFields.Nic: entrepreneurNic,
    EntrepreneurBusinessRelatedProblemDataFields.isSync: isSync,
    EntrepreneurBusinessRelatedProblemDataFields.BUSINESS_RELATED_PROBLEM_ID: businessRelatedProblemId,
  };

  static EntrepreneurBusinessRelatedProblem fromJsonDb(Map<String,Object>json) => EntrepreneurBusinessRelatedProblem(
    id:json[EntrepreneurBusinessRelatedProblemDataFields.SERVER_ID] as String,
    entrepreneurNic:json[EntrepreneurBusinessRelatedProblemDataFields.Nic] as String ,
    localId:json[EntrepreneurBusinessRelatedProblemDataFields.LOCAL_ID].toString() as String ,
    businessRelatedProblemId:json[EntrepreneurBusinessRelatedProblemDataFields.BUSINESS_RELATED_PROBLEM_ID] as String,
    isSync:json!=null?int.tryParse(json[EntrepreneurBusinessRelatedProblemDataFields.isSync]??"")??0:0,
  );

}
