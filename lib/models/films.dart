class Films {
  String? id, title, overview, cover, content_type;

  Films({this.id, this.title, this.overview, this.cover});

  // String? getCover(String? type) {
  //   if (type == "m") {
  //     cover = "https://img.reelgood.com/content/show/$id/poster-780.jpg";
  //   } else if (type == "s") {
  //     cover = "https://img.reelgood.com/content/movie/$id/poster-780.jpg";
  //   } else {
  //     cover = '';
  //   }
  //   return cover;
  // }
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
    Films films = Films();
    films.id = json['id'];
    films.overview = json['overview'];
    //films.slug = json['slug'];
    films.title = json['title'];
    films.cover = json['content_type'];
    films.content_type = json['content_type'];
    return films;
  }
}
