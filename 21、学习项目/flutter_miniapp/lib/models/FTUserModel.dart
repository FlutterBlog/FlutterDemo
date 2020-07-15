class FTUserModel {
  String pID;
  String account;
  String psd;

  FTUserModel(this.pID, this.account, this.psd);

  FTUserModel.fromJson(Map<String, dynamic> json)
      : pID = json['pID'] as String,
        account = json['account'] as String,
        psd = json['psd'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pID': pID,
        'account': account,
        'psd': psd,
      };
}
