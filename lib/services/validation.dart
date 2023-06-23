bool validateEmail(String value){
  RegExp regex = new RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  if (value!=null && value.length != 0) {
    if (regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

bool validatePhone(String value){
  RegExp regex = new RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');
  if (value!=null && value.length != 0) {
    if (regex.hasMatch(value)) {
      return true;
    } else {
      print('wrong');
      return false;

    }
  } else {
    print('wrong down');
    return false;
  }
}



bool validatePassword(String value){
  if (value!=null && value.length > 8) {
    // if (value.startsWith("0")) {
      return true;
    // } else {
    //   return false;
    // }
  } else {
    return false;
  }
}

bool validateText(String value){
  if (value!=null && value.length > 0) {
    return true;
  } else {
    return false;
  }
}