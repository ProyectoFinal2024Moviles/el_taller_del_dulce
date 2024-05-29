import 'package:cloud_firestore/cloud_firestore.dart';

class UserDulce{
  var _uid;
  var _name;
  var _email;
  var _date;
  var _urlPicture;

  get urlPicture => _urlPicture;

  set urlPicture(value) {
    _urlPicture = value;
  }

  UserDulce.Empty();

  get name => _name;
  set name(value) {
    _name = value;
  }
  String get uid => _uid;
  get email => _email;
  get date => _date;
  set date(value) {
    _date = value;
  }
  set email(value) {
    _email = value;
  }
  UserDulce(this._uid, this._name, this._email, this._date);

  Map<String, dynamic> toJson() => {
    'uid': _uid,
    'name': _name,
    'email': _email,
    'date': _date,
    'urlPicture' : _urlPicture
  };

  UserDulce.fromJson(Map<String, dynamic> json)
      : _uid = json['uid'],
        _name = json['name'],
        _email = json['email'],
        _date = json['date'],
        _urlPicture = json["urlPicture"];

}


