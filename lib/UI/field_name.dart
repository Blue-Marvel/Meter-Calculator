import 'package:flutter/material.dart';

class Name {
  static List<Name> getName() => [
        Name("Meter", 'Inches', Colors.transparent),
        Name('Inches', 'Meter', Colors.transparent),
        Name('Feet', 'Meter', Colors.transparent),
        Name('Meters', 'Feet', Colors.transparent),
      ];
  String fieldname_1;
  String fieldname_2;
  Color optionMarker;
  Name(fieldname_1, fieldname_2, optionMarker);
}
