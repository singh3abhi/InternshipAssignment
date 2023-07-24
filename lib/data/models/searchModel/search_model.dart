class SearchModel {
  List<String>? makes;
  List<String>? models;
  String? message;

  SearchModel({this.makes, this.models, this.message});

  SearchModel.fromJson(Map<String, dynamic> json) {
    makes = json['makes'].cast<String>();
    models = json['models'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['makes'] = makes;
    data['models'] = models;
    data['message'] = message;
    return data;
  }
}
