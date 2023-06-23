final String tableEntrepreneurMainProductService = 'EntrepreneurMainProductService';

class EntrepreneurMainProductServiceFields {
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_LOCAL_ID = "Id";
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_SERVER_ID = "ServerId";
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_FILE_NAME = "StorageFileName";
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_NIC = "Nic";
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_UPLOADED_DATE = "UploadedDate";
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_NAME = "ProductServiceName";
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_HAVEMODAL_ID = "HaveModalId";
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_IMAGE_ARRAY = "ImageArray";
   static final String COL_ENTREPRENEUR_MAIN_PRO_SER_IS_SYNC = "IsSync";
}

class EntrepreneurMainProductService {
  int id;
  String localId;
  String storageFileName;
  String entrepreneurNic;
  String uploadedDate;
  String productServiceName;
  String haveModalId;
  String imgArr;
  int isSync;


  EntrepreneurMainProductService({this.id, this.localId, this.storageFileName,
      this.entrepreneurNic, this.uploadedDate, this.productServiceName,
      this.haveModalId, this.imgArr, this.isSync});

  EntrepreneurMainProductService.fromJson(Map<String, dynamic> json) {
    localId = json['ID'];
    storageFileName= json['STORAGE_FILE_NAME'];
    entrepreneurNic = json['ENTREPRENEUR_NIC'];
    uploadedDate= json['UPLOADED_DATE'];
    productServiceName = json['MAIN_PRODUCT_NAME'];
    haveModalId= json['HAVE_MODAL_ID'];
    imgArr = json['IMG_ARR'];
    isSync=1;
  }

  Map<String, Object> toJson() => {
    EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_SERVER_ID: localId,
    EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_FILE_NAME: storageFileName,
    EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NIC: entrepreneurNic,
    EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_UPLOADED_DATE: uploadedDate,
    EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NAME: productServiceName,
    EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_HAVEMODAL_ID: haveModalId,
    EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_IMAGE_ARRAY: imgArr,
    EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_IS_SYNC: isSync,
  };

  static EntrepreneurMainProductService fromJsonDb(Map<String, Object> json) => EntrepreneurMainProductService(
        id: json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_LOCAL_ID] as int,
        localId: json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_SERVER_ID] as String,
        storageFileName:json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_FILE_NAME] as String,
        entrepreneurNic: json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NIC] as String,
        uploadedDate: json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_UPLOADED_DATE] as String,
        productServiceName: json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_NAME] as String,
        haveModalId: json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_HAVEMODAL_ID] as String,
        imgArr: json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_IMAGE_ARRAY] as String,
        isSync: json[EntrepreneurMainProductServiceFields.COL_ENTREPRENEUR_MAIN_PRO_SER_IS_SYNC] as int,

      );
}
