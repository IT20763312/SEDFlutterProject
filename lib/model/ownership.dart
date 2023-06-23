final String tableOwnership = 'Ownership';

class OwnershipFields {

  static final String id = 'id';
  static final String ID = "ownershipId";
  static final String OWNERSHIP= "Name";
}


class Ownership {
  int id;
  String ID;
  String ownership;


  Ownership({this.id, this.ID, this.ownership});




  Map<String, Object> toJson() =>{
    OwnershipFields.ID: ID ,
    OwnershipFields.OWNERSHIP: ownership ,
  };

  static Ownership fromJsonDb(Map<String,Object>json) =>Ownership(
    id: json[OwnershipFields.id] as int,
    ID: json[OwnershipFields.ID] as String,
    ownership: json[OwnershipFields .OWNERSHIP] as String,
  );

}