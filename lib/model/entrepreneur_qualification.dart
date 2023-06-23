final String tableEntrepreneurQualification = 'EntrepreneurQualification';

class EntrepreneurQualificationDataFields {

  static final String LOCAL_ID = 'id';
  static final String SERVER_ID = 'serverId';
  static final String Nic = 'NIC';
  static final String isSync = 'isSync';
  static final String pro_lvl = "pro_lvl";
  static final String pro_qulifi= "pro_qulifi";
  static final String PROFESSIONAL_QUALIFICATION_LEVEL_ID= "PROFESSIONAL_QUALIFICATION_LEVEL_ID";

}


class EntrepreneurQualification {
  String id;
  String entrepreneurNic;
  String professionalQualificationLevelId;
  String proQulifi;
  String proLvl;
  String localId;
  int isSync;


  EntrepreneurQualification({
      this.id,
      this.entrepreneurNic,
      this.professionalQualificationLevelId,
      this.proQulifi,
      this.proLvl,
      this.isSync,
      this.localId
  });

  EntrepreneurQualification.fromJson(Map<String, dynamic> json) {
    id= json['ID'];
    entrepreneurNic= json['ENTREPRENEUR_NIC'];
    professionalQualificationLevelId= json['PROFESSIONAL_QUALIFICATION_LEVEL_ID'];
    proQulifi= json['pro_qulifi'];
    proLvl= json['pro_lvl'];
  }

  // Map<String, dynamic> toJson(bool isNeedLocalId, {int isSyncTemp}) {
  //   final map = <String, dynamic>{};
  //   map['NIC'] = entrepreneurNic;
  //
  //   map['isSync'] = isSyncTemp??isSync;
  //   int tempid = int.tryParse(localId??"");
  //   if(tempid!=null && tempid>0) {
  //     map['id'] = tempid;
  //   }else{
  //     print(id);
  //   }
  //   map['serverId'] = localId;
  //   if(isNeedLocalId){
  //     map['localId'] = id;
  //   }
  //   map['pro_lvl'] = proLvl;
  //   map['pro_qulifi'] = proQulifi;
  //   map['PROFESSIONAL_QUALIFICATION_LEVEL_ID'] = professionalQualificationLevelId;
  //   return map;
  // }

  Map<String, Object> toJson() => {
    EntrepreneurQualificationDataFields.SERVER_ID: localId,
    EntrepreneurQualificationDataFields.Nic: entrepreneurNic,
    EntrepreneurQualificationDataFields.isSync: isSync,
    EntrepreneurQualificationDataFields.pro_lvl: proLvl,
    EntrepreneurQualificationDataFields.pro_qulifi: proQulifi,
    EntrepreneurQualificationDataFields.PROFESSIONAL_QUALIFICATION_LEVEL_ID: professionalQualificationLevelId,

  };

  static EntrepreneurQualification fromJsonDb(Map<String,Object>json) => EntrepreneurQualification(
    id: json[EntrepreneurQualificationDataFields.SERVER_ID] as String,
    localId: json[EntrepreneurQualificationDataFields.LOCAL_ID].toString() as String,
    entrepreneurNic: json[EntrepreneurQualificationDataFields.Nic] as String,
    proLvl: json[EntrepreneurQualificationDataFields.pro_lvl] as String,
    proQulifi: json[EntrepreneurQualificationDataFields.pro_qulifi] as String,
    professionalQualificationLevelId: json[EntrepreneurQualificationDataFields.PROFESSIONAL_QUALIFICATION_LEVEL_ID] as String,
    isSync: json!=null?int.tryParse(json[EntrepreneurQualificationDataFields.isSync]??"")??0:0,


  );




}
