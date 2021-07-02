
// Data class for Customer Information accquired from
// the JSON response
class CustomerInfo {
  String profilePic;
  String earned;
  String custId;
  String custName;
  String custAddrs;
  String custEmail;
  String custPhone;

  CustomerInfo({
    this.profilePic,
    this.earned,
    this.custId,
    this.custName,
    this.custAddrs,
    this.custEmail,
    this.custPhone
  });

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    profilePic = json['profile_pic'];
    earned = json['earned'];
    custId = json['cust_id'];
    custName = json['cust_name'];
    custAddrs = json['cust_addrs'];
    custEmail = json['cust_email'];
    custPhone = json['cust_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_pic'] = this.profilePic;
    data['earned'] = this.earned;
    data['cust_id'] = this.custId;
    data['cust_name'] = this.custName;
    data['cust_addrs'] = this.custAddrs;
    data['cust_email'] = this.custEmail;
    data['cust_phone'] = this.custPhone;
    return data;
  }
}
