final String tableInvestments = 'Investments';

class InvestmentFields {

  static final String id = 'id';
  static final String ID = "InvestmentId";
  static final String INVESTMENT= "Name";
}


class Investment {
  int id;
  String ID;
  String investment;


  Investment({this.id, this.ID, this.investment});




  Map<String, Object> toJson() =>{
    InvestmentFields.ID: ID ,
    InvestmentFields.INVESTMENT: investment ,
  };

  static Investment fromJsonDb(Map<String,Object>json) =>Investment(
    id: json[InvestmentFields.id] as int,
    ID: json[InvestmentFields.ID] as String,
    investment: json[InvestmentFields.INVESTMENT] as String,
  );

}