final String tableWayOfAware = 'WayOfAwareSED';

class WayOfAwareFields {

  static final String id = 'id';
  static final String ID = "wayOfAwareId";
  static final String WAY_OF_AWARE= "Name";
}


class WayOfAware {
  int id;
  String ID;
  String wayOfAware;


  WayOfAware({this.id, this.ID, this.wayOfAware});




  Map<String, Object> toJson() =>{
    WayOfAwareFields.ID: ID ,
    WayOfAwareFields.WAY_OF_AWARE: wayOfAware ,
  };

  static WayOfAware fromJsonDb(Map<String,Object>json) =>WayOfAware(
    id: json[WayOfAwareFields.id] as int,
    ID: json[WayOfAwareFields.ID] as String,
    wayOfAware: json[WayOfAwareFields .WAY_OF_AWARE] as String,
  );

}