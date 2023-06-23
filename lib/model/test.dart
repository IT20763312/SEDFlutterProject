DateTime getBdy(String nic){
  String sYear="";
  String days="";
  if (nic.length == 10) {
    String partA = nic.substring(0, 5);
    sYear = "19" + partA.substring(0, 2);
    days = partA.substring(2, 5);
  } else if (nic.length == 12) {
    String partA = nic.substring(0, 7);
    sYear = partA.substring(0, 4);
    days = partA.substring(4, 7);
  }
  int numberOfDays = int.tryParse(days)??0;

  if (numberOfDays > 500) {
    print("female");
  } else {
    print("male");
  }

  if (numberOfDays > 500) {
    numberOfDays = numberOfDays - 500;
  }

  int year = int.tryParse(sYear)??2021;
  DateTime ttt = DateTime(year).add(Duration(days: numberOfDays-(nic.length == 10?1:2)-(year%4==0?1:0)));
  return ttt;
}