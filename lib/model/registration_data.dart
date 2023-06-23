import 'package:sed_project/model/selected_object_mobule/selected_pro_qualification.dart';
import 'business_related_problem.dart';
import 'expected_support.dart';
import 'have_a_business_data.dart';
import 'like_to_start_business_data.dart';

class Registration {
  String profilePicture;
  String nic;
  String name;
  String title;
  String initials;
  String fullName;
  String address;
  String contact1;
  String contact2;
  String email;
  String gender;
  String dateOfBirth;
  int districtId;
  int dsDivisionId;
  int gnDivisionId;
  int educationQualificationId;
  List<SelectedProQualification> professionalQualificationList;
  int businessExperienceId;
  List<String> trainingProgramsFollowedList;
  List<ExpectedSupport> expectedSupportList;
  List<BusinessRelatedProblem> businessRelatedProblemList;
  int wayOfAwareId;
  int collectedOfficerIsSame;
  String officerName;
  String officerNic;
  String officerDesignation;
  String otherNotes;
  List<LikeToStartBusinessData> ltsList;
  List<HaveABusinessData>hbList;

  Registration(
      this.profilePicture,
      this.nic,
      this.name,
      this.title,
      this.initials,
      this.fullName,
      this.address,
      this.contact1,
      this.contact2,
      this.email,
      this.gender,
      this.dateOfBirth,
      this.districtId,
      this.dsDivisionId,
      this.gnDivisionId,
      this.educationQualificationId,
      this.professionalQualificationList,
      this.businessExperienceId,
      this.trainingProgramsFollowedList,
      this.expectedSupportList,
      this.businessRelatedProblemList,
      this.wayOfAwareId,
      this.collectedOfficerIsSame,
      this.officerName,
      this.officerNic,
      this.officerDesignation,
      this.otherNotes,
      this.ltsList,
      this.hbList);
}