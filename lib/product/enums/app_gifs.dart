enum AppGifs {
  empty('empty_category'),
  ;

  final String value;
  const AppGifs(this.value);

  String get toGif => 'assets/gif/gif_$value.gif';
}
