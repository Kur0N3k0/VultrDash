class Instance {
  String _name;
  String _ip;
  String _location;
  String _charge;
  int _status;

  Instance(this._name, this._ip, this._location, this._charge, this._status);

  String get name => _name;
  String get ip => _ip;
  String get location => _location;
  String get charge => _charge;
  int get status => _status;
}
