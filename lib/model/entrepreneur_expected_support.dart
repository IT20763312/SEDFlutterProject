final String tableEntrepreneurExpectedSupport = 'EntrepreneurExpectedSupport';

class EntrepreneurExpectedSupportDataFields {

  static final String LOCAL_ID = 'id';
  static final String SERVER_ID = 'serverId';
  static final String Nic = 'NIC';
  static final String isSync = 'isSync';
  static final String SUPPORT_ID = "exp_support_id";
  static final String SUPPORT_NAME= "exp_support";

}

class EntrepreneurExpectedSupport {
  String id;
  String nic;
  String localId;
  String expSupportId;
  String expSupport;
  int isSync;


  EntrepreneurExpectedSupport({
      this.id, this.nic, this.expSupportId, this.expSupport,this.localId,this.isSync});

  EntrepreneurExpectedSupport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nic = json['NIC'];
    expSupportId = json['exp_support_id'];
    expSupport = json['exp_support'];
    isSync = json['isSync'];
    localId = json['localId'];
  }

  // Map<String, dynamic> toJson(bool isNeedLocalId, {int isSyncTemp}) {
  //   final map = <String, dynamic>{};
  //   map['exp_support'] = expSupport;
  //   map['exp_support_id'] = expSupportId;
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
  //   map['NIC'] = nic;
  //   return map;
  // }


  Map<String, Object> toJson() => {
    EntrepreneurExpectedSupportDataFields.SERVER_ID: localId,
    EntrepreneurExpectedSupportDataFields.Nic: nic,
    EntrepreneurExpectedSupportDataFields.isSync: isSync,
    EntrepreneurExpectedSupportDataFields.SUPPORT_ID: expSupportId,
    EntrepreneurExpectedSupportDataFields.SUPPORT_NAME: expSupport,
  };


  static EntrepreneurExpectedSupport fromJsonDb(Map<String,Object>json) => EntrepreneurExpectedSupport(
    id:json[EntrepreneurExpectedSupportDataFields.SERVER_ID] as String,
    nic:json[EntrepreneurExpectedSupportDataFields.Nic] as String ,
    localId:json[EntrepreneurExpectedSupportDataFields.LOCAL_ID].toString() as String ,
    expSupportId:json[EntrepreneurExpectedSupportDataFields.SUPPORT_ID] as String,
    expSupport:json[EntrepreneurExpectedSupportDataFields.SUPPORT_NAME] as String,
    isSync:json!=null?int.tryParse(json[EntrepreneurExpectedSupportDataFields.isSync]??"")??0:0 ,
  );
}
