class ListMyFamily {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<ListData>? data;
  ListSupport? support;

  ListMyFamily({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory ListMyFamily.fromJson(Map<String, dynamic> json) => ListMyFamily(
        page: json["page"],
        perPage: json["perPage"],
        total: json["total"],
        totalPages: json["totalPages"],
        data: List<ListData>.from(json['data'].map((x) => ListData.fromJson(x))),
        support: ListSupport.fromJson(json['support']),
      );
}

class ListData {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  ListData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory ListData.fromJson(Map<String, dynamic> json) => ListData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json['avatar']
      );

  // @override
  // List<Object?> get props => [id, email, firstName, lastName, avatar];
}

class ListSupport {
  String? url;
  String? text;

  ListSupport({
    this.url,
    this.text,
  });

  factory ListSupport.fromJson(Map<String, dynamic> json) => ListSupport(
        url: json["url"],
        text: json["text"],
      );
}