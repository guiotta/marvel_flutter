class ComicsResponse {
  Data data;

  ComicsResponse(this.data);

  factory ComicsResponse.fromJson(Map<String, dynamic> json) {
    return new ComicsResponse(json['data'] != null ? new Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Comic> comics;

  Data({this.offset, this.limit, this.total, this.count, this.comics});

  factory Data.fromJson(Map<String, dynamic> json) {
    List<Comic> comicsList = new List<Comic>();
    if (json['results'] != null) {
      comicsList = new List<Comic>();
      json['results'].forEach((v) {
        comicsList.add(new Comic.fromJson(v));
      });
    }

    return new Data(offset: json['offset'], limit: json['limit'], total: json['limit'], count: json['count'], comics: comicsList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.comics != null) {
      data['results'] = this.comics.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comic {
  int id;
  String title;
  String variantDescription;
  String description;
  int pageCount;
  Thumbnail thumbnail;


  Comic(
      {this.id,
        this.title,
        this.variantDescription,
        this.description,
        this.pageCount,
        this.thumbnail});

  factory Comic.fromJson(Map<String, dynamic> json) {
    return new Comic(
      id: json['id'],
      title: json['title'],
      variantDescription: json['variantDescription'],
      description: json['description'],
      pageCount: json['pageCount'],
      thumbnail: json['thumbnail'] != null
          ? new Thumbnail.fromJson(json['thumbnail'])
          : null
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['variantDescription'] = this.variantDescription;
    data['description'] = this.description;
    data['pageCount'] = this.pageCount;
    return data;
  }

  @override
  String toString() {
    return '$title - $description';
  }
}

class Thumbnail {
  String path;
  String extension;

  Thumbnail({this.path, this.extension});

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return new Thumbnail(path: json['path'], extension: json['extension']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

class Images {
  String path;
  String extension;
  Images({this.path, this.extension});

  factory Images.fromJson(Map<String, dynamic> json) {
    return new Images(path: json['path'], extension: json['extension']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}