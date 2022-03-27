class HistoryResponse {
  int? status;
  String? message;
  Data? data;
  Pagination? pagination;

  HistoryResponse({this.status, this.message, this.data, this.pagination});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic points;
  dynamic pointsBalance;
  dynamic wallet;
  List<History>? history;

  Data({this.points, this.pointsBalance, this.wallet, this.history});

  Data.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    pointsBalance = json['points_balance'];
    wallet = json['wallet'];
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['points'] = points;
    data['points_balance'] = pointsBalance;
    data['wallet'] = wallet;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  int? id;
  String? type;
  dynamic total;
  Action? action;
  dynamic actionId;
  CreatedAt? createdAt;
  dynamic paymentId;
  User? user;

  History(
      {this.id,
      this.type,
      this.total,
      this.action,
      this.actionId,
      this.createdAt,
      this.paymentId,
      this.user});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    total = json['total'];
    action = json['action'] != null ? Action.fromJson(json['action']) : null;
    actionId = json['action_id'];
    createdAt = json['created_at'] != null
        ? CreatedAt.fromJson(json['created_at'])
        : null;
    paymentId = json['payment_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['total'] = total;
    if (action != null) {
      data['action'] = action!.toJson();
    }
    data['action_id'] = actionId;
    if (createdAt != null) {
      data['created_at'] = createdAt!.toJson();
    }
    data['payment_id'] = paymentId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Action {
  String? text;
  String? type;
  String? icon;

  Action({this.text, this.type, this.icon});

  Action.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    type = json['type'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['type'] = type;
    data['icon'] = icon;
    return data;
  }
}

class CreatedAt {
  String? date;
  String? time;

  CreatedAt({this.date, this.time});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}

class User {
  int? id;
  String? username;

  User({this.id, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    return data;
  }
}

class Pagination {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  dynamic total;

  Pagination(
      {this.currentPage,
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

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}
