class FiltersModel {
  List<String>? make;
  List<String>? condition;
  List<String>? storage;
  List<String>? ram;

  FiltersModel({this.make, this.condition, this.storage, this.ram});

  FiltersModel.fromJson(Map<String, dynamic> json) {
    make = json['make'].cast<String>();
    condition = json['condition'].cast<String>();
    storage = json['storage'].cast<String>();
    ram = json['ram'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['make'] = make;
    data['condition'] = condition;
    data['storage'] = storage;
    data['ram'] = ram;
    return data;
  }
}
