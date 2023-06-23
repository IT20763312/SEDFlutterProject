final String tableEntrepreneurTrainingNeeds = 'EntrepreneurTrainingNeeds';

class EntrepreneurTrainingNeedsFields {
  static final String LOCAL_ID = 'id';
  static final String SERVER_ID = 'ServerId';
  static final String BUSINESS_ID = 'BusinessId';
  static final String TRAINING_NEED_ID = 'TrainingNeedId';
  static final String TRAINING_Description = "TrainingDescription";
  static final String REFERENCE_NO = "RefNo";
  static final String IS_SYNC = "IsSync";
  static final String BUSINESS_TYPE = "BusinessType";
}

class EntrepreneurTrainingNeeds {
  int id;
  String localId;
  String businessId;
  String trainingNeedId;
  String trainingDescription;
  String referenceNo;
  int isSync;
  String businessType;


  EntrepreneurTrainingNeeds({this.id, this.localId, this.businessId,
      this.trainingNeedId, this.trainingDescription, this.referenceNo,
      this.isSync, this.businessType});

  EntrepreneurTrainingNeeds.fromJson(Map<String, dynamic> json) {

  }

  Map<String, Object> toJson() => {
    EntrepreneurTrainingNeedsFields.SERVER_ID: localId,
    EntrepreneurTrainingNeedsFields.BUSINESS_ID: businessId,
    EntrepreneurTrainingNeedsFields.TRAINING_NEED_ID: trainingNeedId,
    EntrepreneurTrainingNeedsFields.TRAINING_Description: trainingDescription,
    EntrepreneurTrainingNeedsFields.REFERENCE_NO: referenceNo,
    EntrepreneurTrainingNeedsFields.IS_SYNC: isSync,
    EntrepreneurTrainingNeedsFields.BUSINESS_TYPE: businessType,
  };

  static EntrepreneurTrainingNeeds fromJsonDb(Map<String, Object> json) => EntrepreneurTrainingNeeds(
        id: json[EntrepreneurTrainingNeedsFields.LOCAL_ID] as int,
        localId: json[EntrepreneurTrainingNeedsFields.SERVER_ID] as String,
        businessId: json[EntrepreneurTrainingNeedsFields.BUSINESS_ID] as String,
        trainingNeedId: json[EntrepreneurTrainingNeedsFields.TRAINING_NEED_ID] as String,
        trainingDescription: json[EntrepreneurTrainingNeedsFields.TRAINING_Description] as String,
        referenceNo: json[EntrepreneurTrainingNeedsFields.REFERENCE_NO] as String,
        isSync: json!=null?int.tryParse(json[EntrepreneurTrainingNeedsFields.IS_SYNC]??"")??0:0,
        businessType: json[EntrepreneurTrainingNeedsFields.BUSINESS_TYPE] as String,
      );
}
