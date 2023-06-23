import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';

class LikeToStartBusinessData {
  int serverId;
  int localId;
  int businessId;
  int natureId;
  String describeBusiness;
  String expectedInvestmentId;
  String expectedToStartDate;
  int addedToConvert;
  String state;
  List<ServiceCategoryDetails> productServiceCategoryList = [];
  List<TrainingNeeds> trainingNeedsList = [];

  LikeToStartBusinessData(
      this.serverId,
      this.localId,
      this.businessId,
      this.natureId,
      this.describeBusiness,
      this.expectedInvestmentId,
      this.expectedToStartDate,
      this.addedToConvert,
      this.state,
      this.productServiceCategoryList,
      this.trainingNeedsList);


}
