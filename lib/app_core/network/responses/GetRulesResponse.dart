import 'package:json_annotation/json_annotation.dart';
part 'GetRulesResponse.g.dart';

@JsonSerializable()

class GetRulesResponse {
  int? status;
  String? message;
  List<Rules>? rules;
  String? pagination;

  GetRulesResponse({this.status, this.message, this.rules, this.pagination});

  GetRulesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      rules = <Rules>[];
      json['data'].forEach((v) {
        rules!.add(new Rules.fromJson(v));
      });
    }
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.rules != null) {
      data['data'] = this.rules!.map((v) => v.toJson()).toList();
    }
    data['pagination'] = this.pagination;
    return data;
  }
}

class Rules {
  int? id;
  int? sort;
  String? key;
  String? name;
  List<Actions>? actions;

  Rules({this.id, this.sort, this.key, this.name, this.actions});

  Rules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sort = json['sort'];
    key = json['key'];
    name = json['name'];
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions!.add(new Actions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['key'] = this.key;
    data['name'] = this.name;
    if (this.actions != null) {
      data['actions'] = this.actions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Actions {
  int? id;
  String? roleKey;
  int? sort;
  String? action;
  String? text;
  bool? isSelected;

  Actions(
      {this.id,
        this.roleKey,
        this.sort,
        this.action,
        this.text,
        this.isSelected});

  Actions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleKey = json['role_key'];
    sort = json['sort'];
    action = json['action'];
    text = json['text'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_key'] = this.roleKey;
    data['sort'] = this.sort;
    data['action'] = this.action;
    data['text'] = this.text;
    data['is_selected'] = this.isSelected;
    return data;
  }
}