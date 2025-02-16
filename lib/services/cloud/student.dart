import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hnu_mis_announcement/services/cloud/cloud_storage_constants.dart';
import 'package:hnu_mis_announcement/services/cloud/enrollment.dart';

@immutable
class Student {
  final String userId;
  final String studId;
  final String program;
  final String fName;
  final String lName;
  final String? mName;
  final DateTime dBirth;
  final String address;
  final String contactNum;
  final int? unitsTaken;
  final int? maxUnit;
  final List<Enrollment>? enrollments;
  final Map? assessment;

  const Student({
    required this.userId,
    required this.studId,
    required this.program,
    required this.fName,
    required this.lName,
    this.mName,
    required this.dBirth,
    required this.address,
    required this.contactNum,
    this.unitsTaken,
    this.maxUnit,
    this.enrollments,
    this.assessment,
  });

  Student.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : userId = snapshot.data()[studentUserIdFieldName],
        studId = snapshot.id,
        program = snapshot.data()[studentProgramFieldName],
        fName = snapshot.data()[studentFNameFieldName],
        lName = snapshot.data()[studentLNameFieldName],
        mName = snapshot.data()[studentMNameFieldName],
        dBirth =
            (snapshot.data()[studentDBirthFieldName] as Timestamp).toDate(),
        address = snapshot.data()[studentAddressFieldName],
        contactNum = snapshot.data()[studentContactNumFieldName],
        unitsTaken = snapshot.data()[studentUnitsTakenFieldName],
        maxUnit = snapshot.data()[studentMaxUnitFieldName],
        enrollments = snapshot.data()[enrollmentsCollectionName],
        assessment = snapshot.data()[assessmentsCollectionName];
}
