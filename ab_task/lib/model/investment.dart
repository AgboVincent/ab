






class InvestmentModel {

  String? icon;
  String? name;
  String? status;
  String? amount;
  String? unit;
  String? percentage;
  String? returns;

  InvestmentModel({
    required this.icon,
    required this.name,
    required this.status,
    required this.amount,
    required this.unit,
    required this.percentage,
    required this.returns
  });

 InvestmentModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'] as String;
    name = json['name'] as String;
    status = json['status'] as String;
    amount = json['amount'] as String;
    unit = json['unit'] as String;
    percentage = json['percentage'] as String;
    returns = json['returns'] as String;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['icon'] = icon;
    data['name'] = name;
    data['status'] = status;
    data['amount'] = amount;
    data['unit'] = unit;
    data['percentage'] = percentage;
    data['returns'] = returns;
    return data;
  }

}