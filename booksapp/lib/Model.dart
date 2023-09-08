/// status : 1
/// expenseList : [{"expenseName":"Same-Day Delivery","description":"Charges for Same Day Delivery","vendorName":null,"notes":null,"cost":55,"category":"Delivery","internalKeyForKnownExpenses":"DELIVERY","serviceId":"LSA_OFFLINE"},{"expenseName":"Extra - Travel","description":"Charges for Same Day Delivery","vendorName":null,"notes":null,"cost":55,"category":"Delivery","internalKeyForKnownExpenses":"DELIVERY","serviceId":"LSA_OFFLINE"},{"expenseName":"Shipping Cost","description":"Charges for Same Day Delivery","vendorName":null,"notes":null,"cost":55,"category":"Delivery","internalKeyForKnownExpenses":"DELIVERY","serviceId":"LSA_OFFLINE"},{"expenseName":"After Hours","description":"Charges for Same Day Delivery","vendorName":null,"notes":null,"cost":55,"category":"Delivery","internalKeyForKnownExpenses":"DELIVERY","serviceId":"LSA_OFFLINE"},{"expenseName":"Extra Witness Cost","description":"Charges for Same Day Delivery","vendorName":null,"notes":null,"cost":55,"category":"Delivery","internalKeyForKnownExpenses":"DELIVERY","serviceId":"LSA_OFFLINE"}]

class Model {
  Model({
      num? status, 
      List<ExpenseList>? expenseList,}){
    _status = status;
    _expenseList = expenseList;
}

  Model.fromJson(dynamic json) {
    _status = json['status'];
    if (json['expenseList'] != null) {
      _expenseList = [];
      json['expenseList'].forEach((v) {
        _expenseList?.add(ExpenseList.fromJson(v));
      });
    }
  }
  num? _status;
  List<ExpenseList>? _expenseList;
Model copyWith({  num? status,
  List<ExpenseList>? expenseList,
}) => Model(  status: status ?? _status,
  expenseList: expenseList ?? _expenseList,
);
  num? get status => _status;
  List<ExpenseList>? get expenseList => _expenseList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_expenseList != null) {
      map['expenseList'] = _expenseList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// expenseName : "Same-Day Delivery"
/// description : "Charges for Same Day Delivery"
/// vendorName : null
/// notes : null
/// cost : 55
/// category : "Delivery"
/// internalKeyForKnownExpenses : "DELIVERY"
/// serviceId : "LSA_OFFLINE"

class ExpenseList {
  ExpenseList({
      String? expenseName, 
      String? description, 
      dynamic vendorName, 
      dynamic notes, 
      num? cost, 
      String? category, 
      String? internalKeyForKnownExpenses, 
      String? serviceId,}){
    _expenseName = expenseName;
    _description = description;
    _vendorName = vendorName;
    _notes = notes;
    _cost = cost;
    _category = category;
    _internalKeyForKnownExpenses = internalKeyForKnownExpenses;
    _serviceId = serviceId;
}

  ExpenseList.fromJson(dynamic json) {
    _expenseName = json['expenseName'];
    _description = json['description'];
    _vendorName = json['vendorName'];
    _notes = json['notes'];
    _cost = json['cost'];
    _category = json['category'];
    _internalKeyForKnownExpenses = json['internalKeyForKnownExpenses'];
    _serviceId = json['serviceId'];
  }
  String? _expenseName;
  String? _description;
  dynamic _vendorName;
  dynamic _notes;
  num? _cost;
  String? _category;
  String? _internalKeyForKnownExpenses;
  String? _serviceId;
ExpenseList copyWith({  String? expenseName,
  String? description,
  dynamic vendorName,
  dynamic notes,
  num? cost,
  String? category,
  String? internalKeyForKnownExpenses,
  String? serviceId,
}) => ExpenseList(  expenseName: expenseName ?? _expenseName,
  description: description ?? _description,
  vendorName: vendorName ?? _vendorName,
  notes: notes ?? _notes,
  cost: cost ?? _cost,
  category: category ?? _category,
  internalKeyForKnownExpenses: internalKeyForKnownExpenses ?? _internalKeyForKnownExpenses,
  serviceId: serviceId ?? _serviceId,
);
  String? get expenseName => _expenseName;
  String? get description => _description;
  dynamic get vendorName => _vendorName;
  dynamic get notes => _notes;
  num? get cost => _cost;
  String? get category => _category;
  String? get internalKeyForKnownExpenses => _internalKeyForKnownExpenses;
  String? get serviceId => _serviceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['expenseName'] = _expenseName;
    map['description'] = _description;
    map['vendorName'] = _vendorName;
    map['notes'] = _notes;
    map['cost'] = _cost;
    map['category'] = _category;
    map['internalKeyForKnownExpenses'] = _internalKeyForKnownExpenses;
    map['serviceId'] = _serviceId;
    return map;
  }

}