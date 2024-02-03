enum AppLotties {
  donateBox('donate_box'),
  food('food'),
  love('love'),
  waste('waste'),
  takePicture('take_picture'),
  think('think'),
  welcome('welcome'),
  success('success'),
  error('error'),
  hello('hello'),
  ;

  final String value;
  const AppLotties(this.value);

  String get toLottie => 'assets/lotties/lottie_$value.json';
}
