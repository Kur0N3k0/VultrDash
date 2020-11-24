import 'common.dart';
import 'dart:ffi';

class AccountModel {
  String name;
  String email;
  List<String> acls;
  int balance;
  double pendingCharges;
  String lastPaymentDate;
  int lastPaymentAmount;

  AccountModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        acls = new List<String>.from(json['acls']),
        balance = json['balance'],
        pendingCharges = json['pending_charges'],
        lastPaymentDate = json['last_payment_date'],
        lastPaymentAmount = json['last_payment_amount'];

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "acls": acls,
        "balance": balance,
        "pending_charges": pendingCharges,
        "last_payment_date": lastPaymentDate,
        "last_payment_amount": lastPaymentAmount
      };
}
