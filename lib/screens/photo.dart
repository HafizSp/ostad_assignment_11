class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(this.id, this.title, this.url, this.thumbnailUrl);

  factory Photo.fromJson(Map<String, dynamic> mapPhoto) {
    return Photo(
      mapPhoto['id'],
      mapPhoto['title'],
      mapPhoto['url'],
      mapPhoto['thumbnailUrl'],
    );
  }
}
