import 'package:sed_project/model/service_category_details.dart';
import 'package:sed_project/model/training_needs.dart';

import 'main_product_service.dart';

class HaveABusinessData {

   int serverId;
   int businessId;
   String mainProduct;
   String contact;
   String expectedSupport;
   String businessRegistrationPlace;
   int count;
   int haveusinessModalId;
   int converted;
   String businessName;
   String startDate;
   int initialInvestmentId;
   String address1;
   String address2;
   int districtId;
   int ownershipId;
   String registrationNumber;
   String registrationDate;
   int natureId;
   int localId;
   List<ServiceCategoryDetails> productServiceCategoryList =[];
   List<MainProductService> mainProductServiceList =[];
   List<TrainingNeeds> trainingNeedsList =[];

 HaveABusinessData(
      this.serverId,
      this.businessId,
      this.mainProduct,
      this.contact,
      this.expectedSupport,
      this.businessRegistrationPlace,
      this.count,
      this.haveusinessModalId,
      this.converted,
      this.businessName,
      this.startDate,
      this.initialInvestmentId,
      this.address1,
      this.address2,
      this.districtId,
      this.ownershipId,
      this.registrationNumber,
      this.registrationDate,
      this.natureId,
      this.localId,
      this.productServiceCategoryList,
      this.mainProductServiceList,
      this.trainingNeedsList);
}
