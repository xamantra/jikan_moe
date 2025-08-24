// Main anime data model
class AnimeFullData {
  final int malId;
  final String url;
  final AnimeImages images;
  final AnimeTrailer trailer;
  final bool approved;
  final List<AnimeTitle> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String source;
  final int? episodes;
  final String status;
  final bool airing;
  final AnimeAired aired;
  final String? duration;
  final String? rating;
  final double? score;
  final int scoredBy;
  final int? rank;
  final int? popularity;
  final int members;
  final int favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final AnimeBroadcast? broadcast;
  final List<AnimeProducer> producers;
  final List<AnimeProducer> licensors;
  final List<AnimeProducer> studios;
  final List<AnimeGenre> genres;
  final List<AnimeGenre> explicitGenres;
  final List<AnimeGenre> themes;
  final List<AnimeGenre> demographics;
  final List<AnimeRelation> relations;
  final AnimeTheme theme;
  final List<AnimeExternal> external;
  final List<AnimeStreaming> streaming;

  AnimeFullData({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy = 0,
    this.rank,
    this.popularity,
    this.members = 0,
    this.favorites = 0,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
    required this.relations,
    required this.theme,
    required this.external,
    required this.streaming,
  });

  factory AnimeFullData.fromJson(Map<String, dynamic> json) {
    return AnimeFullData(
      malId: json['mal_id'],
      url: json['url'],
      images: AnimeImages.fromJson(json['images']),
      trailer: AnimeTrailer.fromJson(json['trailer']),
      approved: json['approved'],
      titles: (json['titles'] as List).map((title) => AnimeTitle.fromJson(title)).toList(),
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms']),
      type: json['type'],
      source: json['source'],
      episodes: json['episodes'],
      status: json['status'],
      airing: json['airing'],
      aired: AnimeAired.fromJson(json['aired']),
      duration: json['duration'],
      rating: json['rating'],
      score: json['score']?.toDouble(),
      scoredBy: json['scored_by'] ?? 0,
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'] ?? 0,
      favorites: json['favorites'] ?? 0,
      synopsis: json['synopsis'],
      background: json['background'],
      season: json['season'],
      year: json['year'],
      broadcast: json['broadcast'] != null ? AnimeBroadcast.fromJson(json['broadcast']) : null,
      producers: (json['producers'] as List).map((producer) => AnimeProducer.fromJson(producer)).toList(),
      licensors: (json['licensors'] as List).map((licensor) => AnimeProducer.fromJson(licensor)).toList(),
      studios: (json['studios'] as List).map((studio) => AnimeProducer.fromJson(studio)).toList(),
      genres: (json['genres'] as List).map((genre) => AnimeGenre.fromJson(genre)).toList(),
      explicitGenres: (json['explicit_genres'] as List).map((genre) => AnimeGenre.fromJson(genre)).toList(),
      themes: (json['themes'] as List).map((theme) => AnimeGenre.fromJson(theme)).toList(),
      demographics: (json['demographics'] as List).map((demographic) => AnimeGenre.fromJson(demographic)).toList(),
      relations: (json['relations'] as List).map((relation) => AnimeRelation.fromJson(relation)).toList(),
      theme: AnimeTheme.fromJson(json['theme']),
      external: (json['external'] as List).map((external) => AnimeExternal.fromJson(external)).toList(),
      streaming: (json['streaming'] as List).map((streaming) => AnimeStreaming.fromJson(streaming)).toList(),
    );
  }
}

// Images model
class AnimeImages {
  final AnimeImageUrls jpg;
  final AnimeImageUrls webp;

  AnimeImages({required this.jpg, required this.webp});

  factory AnimeImages.fromJson(Map<String, dynamic> json) {
    return AnimeImages(jpg: AnimeImageUrls.fromJson(json['jpg']), webp: AnimeImageUrls.fromJson(json['webp']));
  }

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg.toJson(),
      'webp': webp.toJson(),
    };
  }
}

class AnimeImageUrls {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  AnimeImageUrls({required this.imageUrl, required this.smallImageUrl, required this.largeImageUrl});

  factory AnimeImageUrls.fromJson(Map<String, dynamic> json) {
    return AnimeImageUrls(imageUrl: json['image_url'], smallImageUrl: json['small_image_url'], largeImageUrl: json['large_image_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
    };
  }
}

// Trailer model
class AnimeTrailer {
  final String? youtubeId;
  final String? url;
  final String? embedUrl;
  final AnimeTrailerImages images;

  AnimeTrailer({this.youtubeId, this.url, this.embedUrl, required this.images});

  factory AnimeTrailer.fromJson(Map<String, dynamic> json) {
    return AnimeTrailer(youtubeId: json['youtube_id'], url: json['url'], embedUrl: json['embed_url'], images: AnimeTrailerImages.fromJson(json['images']));
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_id': youtubeId,
      'url': url,
      'embed_url': embedUrl,
      'images': images.toJson(),
    };
  }
}

class AnimeTrailerImages {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? largeImageUrl;
  final String? maximumImageUrl;

  AnimeTrailerImages({this.imageUrl, this.smallImageUrl, this.mediumImageUrl, this.largeImageUrl, this.maximumImageUrl});

  factory AnimeTrailerImages.fromJson(Map<String, dynamic> json) {
    return AnimeTrailerImages(imageUrl: json['image_url'], smallImageUrl: json['small_image_url'], mediumImageUrl: json['medium_image_url'], largeImageUrl: json['large_image_url'], maximumImageUrl: json['maximum_image_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'medium_image_url': mediumImageUrl,
      'large_image_url': largeImageUrl,
      'maximum_image_url': maximumImageUrl,
    };
  }
}

// Title model
class AnimeTitle {
  final String type;
  final String title;

  AnimeTitle({required this.type, required this.title});

  factory AnimeTitle.fromJson(Map<String, dynamic> json) {
    return AnimeTitle(type: json['type'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
    };
  }
}

// Aired model
class AnimeAired {
  final DateTime? from;
  final DateTime? to;
  final AnimeAiredProp prop;
  final String? string;

  AnimeAired({this.from, this.to, required this.prop, this.string});

  factory AnimeAired.fromJson(Map<String, dynamic> json) {
    return AnimeAired(from: json['from'] != null ? DateTime.parse(json['from']) : null, to: json['to'] != null ? DateTime.parse(json['to']) : null, prop: AnimeAiredProp.fromJson(json['prop']), string: json['string']);
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from?.toIso8601String(),
      'to': to?.toIso8601String(),
      'prop': prop.toJson(),
      'string': string,
    };
  }
}

class AnimeAiredProp {
  final AnimeAiredDate? from;
  final AnimeAiredDate? to;

  AnimeAiredProp({this.from, this.to});

  factory AnimeAiredProp.fromJson(Map<String, dynamic> json) {
    return AnimeAiredProp(from: json['from'] != null ? AnimeAiredDate.fromJson(json['from']) : null, to: json['to'] != null ? AnimeAiredDate.fromJson(json['to']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from?.toJson(),
      'to': to?.toJson(),
    };
  }
}

class AnimeAiredDate {
  final int? day;
  final int? month;
  final int? year;

  AnimeAiredDate({this.day, this.month, this.year});

  factory AnimeAiredDate.fromJson(Map<String, dynamic> json) {
    return AnimeAiredDate(day: json['day'], month: json['month'], year: json['year']);
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'month': month,
      'year': year,
    };
  }
}

// Broadcast model
class AnimeBroadcast {
  final String? day;
  final String? time;
  final String? timezone;
  final String? string;

  AnimeBroadcast({this.day, this.time, this.timezone, this.string});

  factory AnimeBroadcast.fromJson(Map<String, dynamic> json) {
    return AnimeBroadcast(day: json['day'], time: json['time'], timezone: json['timezone'], string: json['string']);
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'time': time,
      'timezone': timezone,
      'string': string,
    };
  }
}

// Producer model
class AnimeProducer {
  final int malId;
  final String type;
  final String name;
  final String url;

  AnimeProducer({required this.malId, required this.type, required this.name, required this.url});

  factory AnimeProducer.fromJson(Map<String, dynamic> json) {
    return AnimeProducer(malId: json['mal_id'], type: json['type'], name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

// Genre model
class AnimeGenre {
  final int malId;
  final String type;
  final String name;
  final String url;

  AnimeGenre({required this.malId, required this.type, required this.name, required this.url});

  factory AnimeGenre.fromJson(Map<String, dynamic> json) {
    return AnimeGenre(malId: json['mal_id'], type: json['type'], name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

// Relation model
class AnimeRelation {
  final String relation;
  final List<AnimeRelationEntry> entry;

  AnimeRelation({required this.relation, required this.entry});

  factory AnimeRelation.fromJson(Map<String, dynamic> json) {
    return AnimeRelation(relation: json['relation'], entry: (json['entry'] as List).map((entry) => AnimeRelationEntry.fromJson(entry)).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'relation': relation,
      'entry': entry.map((e) => e.toJson()).toList(),
    };
  }
}

class AnimeRelationEntry {
  final int malId;
  final String type;
  final String name;
  final String url;

  AnimeRelationEntry({required this.malId, required this.type, required this.name, required this.url});

  factory AnimeRelationEntry.fromJson(Map<String, dynamic> json) {
    return AnimeRelationEntry(malId: json['mal_id'], type: json['type'], name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }
}

// Theme model
class AnimeTheme {
  final List<String> openings;
  final List<String> endings;

  AnimeTheme({required this.openings, required this.endings});

  factory AnimeTheme.fromJson(Map<String, dynamic> json) {
    return AnimeTheme(openings: List<String>.from(json['openings']), endings: List<String>.from(json['endings']));
  }
}

// External model
class AnimeExternal {
  final String name;
  final String url;

  AnimeExternal({required this.name, required this.url});

  factory AnimeExternal.fromJson(Map<String, dynamic> json) {
    return AnimeExternal(name: json['name'], url: json['url']);
  }
}

// Streaming model
class AnimeStreaming {
  final String name;
  final String url;

  AnimeStreaming({required this.name, required this.url});

  factory AnimeStreaming.fromJson(Map<String, dynamic> json) {
    return AnimeStreaming(name: json['name'], url: json['url']);
  }
}
