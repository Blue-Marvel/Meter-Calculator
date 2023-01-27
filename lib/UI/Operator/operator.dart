class Operator {
  double _inches = 0.0;
  double _meters = 0.0;
  double _feets = 0.0;

  Operator();

  setMeter(double meters) {
    _meters = meters;
  }

  setInches(double inches) {
    _inches = inches;
  }

  setFeets(double ft) {
    _feets = ft;
  }

  double getInches() {
    return _inches;
  }

  double getMeters() {
    return _meters;
  }

  double getFeets() {
    return _feets;
  }

  double meterToInches() {
    return getMeters() * 39.37;
  }

  double metersToFeet() {
    return meterToInches() / 12;
  }

  double inchesToMeter() {
    return getInches() * 0.0254;
  }

  double feetsToMeter() {
    return (getFeets() * 12) * 0.0254;
  }
}
