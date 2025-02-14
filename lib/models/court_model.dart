import 'dart:convert';

import 'package:vtp_appcaulong/formatter.dart';
import 'package:equatable/equatable.dart';

List<Court> courtFromJson(String str) =>
    List<Court>.from(json.decode(str).map((x) => Court.fromJson(x)));

class Court extends Equatable {
  final String courtID;
  final String courtName;
  final String status;
  final DateTime startDate;
  final String branchID;

  Court(
      {required this.courtID,
      required this.courtName,
      required this.status,
      required this.startDate,
      required this.branchID});

  factory Court.fromJson(Map<String, dynamic> json) => Court(
      courtID: json['CourtID'],
      courtName: json['CourtName'],
      status: json['_Status'],
      startDate: Formatter.convertStringToDateTime(json['StartDate']),
      branchID: json['BranchID']);
  @override
  // TODO: implement props
  List<Object?> get props => [courtID, courtName, status, startDate, branchID];

  static List<Court> courts = [
    Court(
        courtID: 'SBT001',
        courtName: 'San 1',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT001'),
    Court(
        courtID: 'SBT2001',
        courtName: 'San 1',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT002'),
    Court(
        courtID: 'SBT2002',
        courtName: 'San 2',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT002'),
    Court(
        courtID: 'SBT002',
        courtName: 'San 2',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT001'),
    Court(
        courtID: 'SBT003',
        courtName: 'San 3',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT001'),
    Court(
        courtID: 'SBT004',
        courtName: 'San 4',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT001'),
    Court(
        courtID: 'SBT005',
        courtName: 'San 5',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'BT001'),
    Court(
        courtID: 'STD001',
        courtName: 'San 1',
        status: 'Active',
        startDate: DateTime.now(),
        branchID: 'TD001'),
  ];
}
