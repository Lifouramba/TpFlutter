class Films {
  String? id, title, overview, cover, slug;

  Films({this.id, this.title, this.overview, this.cover, this.slug});

  String? getCover(String? type) {
    if (type == "m") {
      cover = "https://img.reelgood.com/content/movie/$id/poster-780.jpg";
    } else if (type == "s") {
      cover = "https://img.reelgood.com/content/show/$id/poster-780.jpg";
    } else {
      cover = '';
    }
    return cover;
  }

  factory Films.fromJSON(json) {
    Films films = Films(
      id: json['id'],
      overview: json['overview'],
      title: json['title'],
      slug: json['slug'],
      cover: json['content_type'],
    );
    return films;
  }
}
