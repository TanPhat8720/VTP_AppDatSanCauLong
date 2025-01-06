import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Branch> branchFromJson(String str) =>
    List<Branch>.from(json.decode(str).map((x) => Branch.fromJson(x)));

class Branch extends Equatable {
  final String branchID;
  final String branchName;
  final String address;

  Branch(
      {required this.address,
      required this.branchID,
      required this.branchName});

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchID: json["branchId"],
        branchName: json["branchName"],
        address: json["cAddress"],
      );

  Map<String, dynamic> toJson() => {
        "branchId": branchID,
        "branchName": branchName,
        "cAddress": address,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [branchID, branchName];
  static List<Branch> branches = [
    Branch(branchID: 'BT001', branchName: 'Binh Thanh', address: 'Hutech'),
    Branch(
        branchID: 'BT002', branchName: 'Binh Thanh', address: 'Dien Bien Phu'),
    Branch(branchID: 'TD001', branchName: 'Thu Duc', address: 'Le Van Viet'),
  ];
}
