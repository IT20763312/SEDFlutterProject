final String tableUserDetails = 'User';

class UserFields {
  static final String id = 'id';
  static final String COL_USER_LOGIN_ID = "LoginId";
  static final String COL_USER_NAME = "UserName";
  static final String COL_USER_PASSWORD = "Password";
  static final String COL_USER_NIC = "Nic";
  static final String COL_USER_DISTRICT_ID = "DistrictId";
  static final String COL_USER_DS_DIVISION_ID = "DsDivisionId";
  static final String COL_USER_FNAME = "FName";
  static final String COL_USER_INITIALS = "Initials";
  static final String COL_USER_BIRTHDAY = "Birthday";
  static final String COL_USER_GENDER = "Gender";
  static final String COL_USER_CURRENT_ADDRESS = "CurrentAddress";
  static final String COL_USER_PERMANENT_ADDRESS = "PermenantAddress";
  static final String COL_USER_CONTACT_MOBILE = "ContactMobile";
  static final String COL_USER_CONTACT_LAND = "ContactLand";
  static final String COL_USER_DEGREE = "Degree";
  static final String COL_USER_GRADUATED_DATE = "GraduatedYear";
  static final String COL_USER_MASTER = "Master";
  static final String COL_USER_MASTER_YEAR = "MasterYear";
  static final String COL_USER_OTHER = "Other";
  static final String COL_USER_POSSITION = "Possition";
  static final String COL_USER_TITLE = "Title";
  static final String COL_USER_JOINED_DATE = "JoinedDate";
  static final String COL_USER_NBID = "UserNBID";
  static final String COL_USER_ISSYNC = "UserIsSync";
}

class UserDetails {
  int id;
  int LoginId;
  String UserName;
  String Password;
  String Nic;
  String DistrictId;
  String DsDivisionId;
  String FName;
  String Initials;
  String Birthday;
  String Gender;
  String CurrentAddress;
  String PermenantAddress;
  String ContactMobile;
  String ContactLand;
  String Degree;
  String GraduatedYear;
  String Master;
  String MasterYear;
  String Other;
  String Possition;
  String Title;
  String JoinedDate;


  UserDetails({
      this.id,
      this.LoginId,
      this.UserName,
      this.Password,
      this.Nic,
      this.DistrictId,
      this.DsDivisionId,
      this.FName,
      this.Initials,
      this.Birthday,
      this.Gender,
      this.CurrentAddress,
      this.PermenantAddress,
      this.ContactMobile,
      this.ContactLand,
      this.Degree,
      this.GraduatedYear,
      this.Master,
      this.MasterYear,
      this.Other,
      this.Possition,
      this.Title,
      this.JoinedDate});

  UserDetails copy({
    int id,
    int LoginId,
    String UserName,
    String Password,
    String Nic,
    String DistrictId,
    String DsDivisionId,
    String FName,
    String Initials,
    String Birthday,
    String Gender,
    String CurrentAddress,
    String PermenantAddress,
    String ContactMobile,
    String ContactLand,
    String Degree,
    String GraduatedYear,
    String Master,
    String MasterYear,
    String Other,
    String Possition,
    String Title,
    String JoinedDate,
  }) =>
      UserDetails(
        id: id ?? this.id,
        LoginId: LoginId ?? this.LoginId,
        UserName:UserName ?? this.UserName,
        Password: Password?? this.Password,
        Nic:Nic ?? this.Nic,
        DistrictId: DistrictId ?? this.DistrictId,
        DsDivisionId:DsDivisionId ?? this.DsDivisionId,
        FName: FName ?? this.FName,
        Initials:Initials ?? this.Initials,
        Birthday: Birthday ?? this.Birthday,
        Gender: Gender ?? this.Gender,
        CurrentAddress: CurrentAddress ?? this.CurrentAddress,
        PermenantAddress: PermenantAddress ?? this.PermenantAddress,
        ContactMobile: ContactMobile ?? this.ContactMobile,
        ContactLand: ContactLand ?? this.ContactLand,
        Degree:Degree ?? this.Degree,
        GraduatedYear: GraduatedYear ?? this.GraduatedYear,
        Master:Master ?? this.Master,
        MasterYear: MasterYear ?? this.MasterYear,
        Other: Other ?? this.Other,
        Possition:Possition ?? this.Possition,
        Title: Title ?? this.Title,
        JoinedDate:JoinedDate ?? this.JoinedDate,

      );

  UserDetails.fromJson(Map<String, dynamic> json) {
    LoginId = json['LoginId'];
    UserName = json['UserName'];
    Password = json['Password'];
    Nic = json['Nic'];
    DistrictId= json['DistrictId'];
    DsDivisionId = json['DsDivisionId'];
    FName = json['FName'];
    Initials = json['Initials'];
    Birthday = json['Birthday'];
    Gender = json['Gender'];
    CurrentAddress = json['CurrentAddress'];
    PermenantAddress = json['PermenantAddress'];
    ContactMobile = json['ContactMobile'];
    ContactLand = json['ContactLand'];
    Degree = json['Degree'];
    GraduatedYear = json['GraduatedYear'];
    Master = json['Master'];
    MasterYear = json['MasterYear'];
    Other = json['Other'];
    Possition = json['Possition'];
    Title= json['Title'];
    JoinedDate = json['JoinedDate'];
  }

  Map<String, Object> toJson() => {
    UserFields.COL_USER_LOGIN_ID: LoginId,
    UserFields.COL_USER_NAME: UserName,
    UserFields.COL_USER_PASSWORD: Password,
    UserFields.COL_USER_NIC: Nic,
    UserFields.COL_USER_DISTRICT_ID: DistrictId,
    UserFields.COL_USER_DS_DIVISION_ID: DsDivisionId,
    UserFields.COL_USER_FNAME: FName,
    UserFields.COL_USER_INITIALS:Initials,
    UserFields.COL_USER_BIRTHDAY: Birthday,
    UserFields.COL_USER_GENDER: Gender,
    UserFields.COL_USER_CURRENT_ADDRESS: CurrentAddress,
    UserFields.COL_USER_PERMANENT_ADDRESS: PermenantAddress,
    UserFields.COL_USER_CONTACT_MOBILE: ContactMobile,
    UserFields.COL_USER_CONTACT_LAND: ContactLand,
    UserFields.COL_USER_DEGREE: Degree,
    UserFields.COL_USER_GRADUATED_DATE: GraduatedYear,
    UserFields.COL_USER_MASTER: Master,
    UserFields.COL_USER_MASTER_YEAR: MasterYear,
    UserFields.COL_USER_OTHER: Other,
    UserFields.COL_USER_POSSITION: Possition,
    UserFields.COL_USER_TITLE: Title,
    UserFields.COL_USER_JOINED_DATE: JoinedDate,
  };
}
