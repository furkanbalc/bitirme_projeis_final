enum AppImages {
  logo('logo'),
  google('google'),
  email('sammy-line-email'),
  verify('sammy-line-verify'),
  empty('empty_message'),
  ;

  final String value;
  const AppImages(this.value);

  String get toImage => 'assets/images/ic_$value.png';
}
