class BalanceModel {
  String? uuid;
  String? quidUid;
  String? accountUuid;
  double? credit;
  double? debit;
  String? info;
  String? atDate;
  String? createdAt;
  String? updatedAt;

  BalanceModel(
      {this.uuid,
      this.quidUid,
      this.accountUuid,
      this.credit,
      this.debit,
      this.info,
      this.atDate,
      this.createdAt,
      this.updatedAt});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    quidUid = json['quid_uid'];
    accountUuid = json['account_uuid'];
    credit = double.parse(json['credit'].toString());
    debit = double.parse(json['debit'].toString());
    info = json['info'];
    atDate = json['at_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['quid_uid'] = this.quidUid;
    data['account_uuid'] = this.accountUuid;
    data['credit'] = this.credit;
    data['debit'] = this.debit;
    data['info'] = this.info;
    data['at_date'] = this.atDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
