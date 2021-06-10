import 'package:movies_and_shows/models/enum_values.dart';

enum OriginCountry { US, NO, MX, CO }

final originCountryValues = EnumValues({
  "CO": OriginCountry.CO,
  "MX": OriginCountry.MX,
  "NO": OriginCountry.NO,
  "US": OriginCountry.US
});
