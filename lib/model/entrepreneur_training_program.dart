final String tableEntrepreneurTrainingPrograms = 'EntrepreneurTrainingPrograms';

class EntrepreneurTrainingProgramsDataFields {

  static final String LOCAL_ID = 'id';
  static final String SERVER_ID = 'serverId';
  static final String Nic = 'NIC';
  static final String isSync = 'isSync';
  static final String trnFlw= "trn_flw";
  static final String trnFlwId= "trn_flw_id";

}
class EntrepreneurTrainingPrograms {
  String id;
  String  localId;
  String  nic;
  String  trnFlwId;
  String  trnFlw;
  int isSync;


  EntrepreneurTrainingPrograms({
      this.id, this.localId, this.nic, this.trnFlwId, this.trnFlw,this.isSync});

  EntrepreneurTrainingPrograms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nic = json['NIC'];
    trnFlwId = json['trn_flw_id'];
    trnFlw = json['trn_flw'];
  }

  // Map<String, dynamic> toJson(bool isNeedLocalId, {int isSyncTemp}) {
  //   final map = <String, dynamic>{};
  //   map['serverId'] = localId;
  //   map['isSync'] = isSyncTemp??isSync;
  //   int tempid = int.tryParse(localId??"");
  //   if(tempid!=null && tempid>0) {
  //     map['id'] = tempid;
  //   }else{
  //     print(id);
  //   }
  //   map['NIC'] = nic;
  //   map['trn_flw'] = trnFlw;
  //   map['trn_flw_id'] = trnFlwId;
  //   return map;
  // }

  Map<String, Object> toJson() => {
    EntrepreneurTrainingProgramsDataFields.SERVER_ID: localId,
    EntrepreneurTrainingProgramsDataFields.Nic: nic,
    EntrepreneurTrainingProgramsDataFields.isSync: isSync,
    EntrepreneurTrainingProgramsDataFields.trnFlw: trnFlw,
    EntrepreneurTrainingProgramsDataFields.trnFlwId: trnFlwId,
  };

  static EntrepreneurTrainingPrograms fromJsonDb(Map<String,Object>json) =>EntrepreneurTrainingPrograms(
    id: json[EntrepreneurTrainingProgramsDataFields.SERVER_ID] as String,
    localId: json[EntrepreneurTrainingProgramsDataFields.LOCAL_ID].toString() as String,
    nic: json[EntrepreneurTrainingProgramsDataFields.Nic] as String,
    isSync: json!=null?int.tryParse(json[EntrepreneurTrainingProgramsDataFields.isSync]??"")??0:0,
    trnFlw: json[EntrepreneurTrainingProgramsDataFields.trnFlw] as String,
    trnFlwId: json[EntrepreneurTrainingProgramsDataFields.trnFlwId] as String,


  );


}
