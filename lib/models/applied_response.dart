class AppliedResponse {
  int currentPage;
  List<AppliedData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  String prevPageUrl;
  int to;
  int total;

  AppliedResponse(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  AppliedResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<AppliedData>();
      json['data'].forEach((v) {
        data.add(new AppliedData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }

  addNextDataList(AppliedResponse nextResponse) {
    final List<AppliedData> oldItems = data;
    final List<AppliedData> newItems = oldItems + nextResponse.data;
    nextResponse.data = newItems;
    return nextResponse;
  }
}

class AppliedData {
  int jobId;
  String jobTitle;
  String jobDescription;
  String addrFull;
  String addrStreet;
  String addrDistrict;
  String addrState;
  String addrPostalcode;
  String addrLat;
  String addrLng;
  int positionId;
  String positionTitle;
  int numberSeeker;
  int skilled;
  String timeStartWork;
  String timeEndWork;
  int hoursPerDay;
  String startDate;
  String endDate;
  List<dynamic> daysInWeek;
  String payType;
  int payRate;
  String payTypeName;
  double branchPayRate;
  String branchNote;
  String lastApplyDate;
  String clientName;
  String clientLogo;
  String seekerStatus;
  int favorite;
  int filled;
  int payRateTo;
  bool payRateHidden;
  String payRateLabel;
  String rateLabel;
  // PaymentItem payment;

  AppliedData({
    this.jobId,
    this.jobTitle,
    this.jobDescription,
    this.addrFull,
    this.addrStreet,
    this.addrDistrict,
    this.addrState,
    this.addrPostalcode,
    this.addrLat,
    this.addrLng,
    this.positionId,
    this.positionTitle,
    this.numberSeeker,
    this.skilled,
    this.timeStartWork,
    this.timeEndWork,
    this.hoursPerDay,
    this.startDate,
    this.endDate,
    this.daysInWeek,
    this.payType,
    this.payRate,
    this.branchPayRate,
    this.branchNote,
    this.lastApplyDate,
    this.clientName,
    this.clientLogo,
    this.seekerStatus,
    this.favorite,
    this.filled,
    this.payRateTo,
    this.payRateHidden,
    this.payRateLabel,
    this.rateLabel,
    // this.payment,
  });

  AppliedData.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    jobDescription = json['job_description'];
    addrFull = json['addr_full'];
    addrStreet = json['addr_street'];
    addrDistrict = json['addr_district'];
    addrState = json['addr_state'];
    addrPostalcode = json['addr_postalcode'];
    addrLat = json['addr_lat'];
    addrLng = json['addr_lng'];
    positionId = json['position_id'];
    positionTitle = json['position_title'];
    numberSeeker = json['number_seeker'];
    skilled = json['skilled'];
    timeStartWork = json['time_start_work'];
    timeEndWork = json['time_end_work'];
    hoursPerDay = json['hours_per_day'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    daysInWeek = json['days_in_week'];
    payType = json['pay_type'];
    payRate = json['pay_rate'];
    payTypeName = _mapPayTypeName(json['pay_type']);
    branchPayRate =
        json['branch_pay_rate'] == null || json['branch_pay_rate'] == ''
            ? 0.0
            : double.parse(json['branch_pay_rate'].toString());
    branchNote = json['branch_note'];
    lastApplyDate = json['last_apply_date'];
    clientName = json['client_name'];
    clientLogo = json['client_logo'];
    seekerStatus = json['seeker_status'];
    favorite = json['favorite'];
    filled = json['filled'];
    payRateTo = json['pay_rate_to'];
    payRateHidden = json['pay_rate_hidden'] == 1 ? true : false;
    payRateLabel = json['pay_rate_label'];
    rateLabel = json['rate_label'];
    // payment = json['payment'] != null
    //     ? new PaymentItem.fromJson(json['payment'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['job_title'] = this.jobTitle;
    data['job_description'] = this.jobDescription;
    data['addr_full'] = this.addrFull;
    data['addr_street'] = this.addrStreet;
    data['addr_district'] = this.addrDistrict;
    data['addr_state'] = this.addrState;
    data['addr_postalcode'] = this.addrPostalcode;
    data['addr_lat'] = this.addrLat;
    data['addr_lng'] = this.addrLng;
    data['position_id'] = this.positionId;
    data['position_title'] = this.positionTitle;
    data['number_seeker'] = this.numberSeeker;
    data['skilled'] = this.skilled;
    data['time_start_work'] = this.timeStartWork;
    data['time_end_work'] = this.timeEndWork;
    data['hours_per_day'] = this.hoursPerDay;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['days_in_week'] = this.daysInWeek;
    data['pay_type'] = this.payType;
    data['pay_rate'] = this.payRate;
    data['branch_pay_rate'] = this.branchPayRate;
    data['branch_note'] = this.branchNote;
    data['last_apply_date'] = this.lastApplyDate;
    data['client_name'] = this.clientName;
    data['client_logo'] = this.clientLogo;
    data['seeker_status'] = this.seekerStatus;
    data['favorite'] = this.favorite;
    data['filled'] = this.filled;
    data['pay_rate_to'] = this.payRateTo;
    data['pay_rate_hidden'] = this.payRateHidden ? 1 : 0;
    data['pay_rate_label'] = this.payRateLabel;
    data['rate_label'] = this.rateLabel;
    // if (this.payment != null) {
    //   data['payment'] = this.payment.toJson();
    // }
    return data;
  }

  String _mapPayTypeName(String payTypeKey) {
    switch (payTypeKey) {
      case "hour":
        return 'Hour';
      case "bi_week":
        return 'Bi-Week';
      case "month":
        return 'Month';
      case "year":
        return 'Annual';
      default:
        return '';
    }
  }
}
