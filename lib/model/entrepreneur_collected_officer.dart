final String tableEntrepreneurCollectedOfficer = 'EntrepreneurCollectedOfficer';

class EntrepreneurCollectedOfficerDataFields {

  static final String LOCAL_ID = 'id';
  static final String SERVER_ID = 'serverId';
  static final String C_OFFICER_NIC = 'C_OFFICER_NIC';
  static final String isSync = 'isSync';
  static final String C_OFFICER = "C_OFFICER";
  static final String C_OFFICER_DESIGNATION= "C_OFFICER_DESIGNATION";

}

class EntrepreneurCollectedOfficer {
  String id;
  String localId;
  String entrepreneurNic;
  String officerName;
  String officerNic;
  String officerDesignation;
  int isSync;


  EntrepreneurCollectedOfficer({this.id, this.localId, this.entrepreneurNic,
      this.officerName, this.officerNic, this.officerDesignation, this.isSync});

  EntrepreneurCollectedOfficer.fromJson(Map<String, dynamic> json) {
    id= json['ID'];
    entrepreneurNic= json['NIC'];
    officerName= json['C_OFFICER'];
    officerNic= json['C_OFFICER_NIC'];
    officerDesignation= json['C_OFFICER_DESIGNATION'];
  }

  Map<String, dynamic> toJson(bool isNeedLocalId, {int isSyncTemp}) {
    final map = <String, dynamic>{};
    if(isNeedLocalId){
      map['localId'] = localId;
    }
    int tempid = int.tryParse(localId??"");
    if(tempid!=null && tempid>0) {
      map['id'] = tempid;
    }else{
      print(id);
    }
    map['serverId'] = id;
    map['isSync'] = isSyncTemp??isSync;
    map['C_OFFICER_DESIGNATION'] = officerDesignation;
    map['C_OFFICER'] = officerName;
    map['C_OFFICER_NIC'] =officerNic;
    return map;
  }

}