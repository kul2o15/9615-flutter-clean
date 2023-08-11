import 'package:equatable/equatable.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/address.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/company.dart';

class User extends Equatable {
  final int idEntity;
  final String nameEntity,
      usernameEntity,
      phoneEntity,
      websiteEntity,
      emailEntity;
  final Address addressEntity;
  final Company companyEntity;

  const User(
      this.idEntity,
      this.nameEntity,
      this.usernameEntity,
      this.phoneEntity,
      this.emailEntity,
      this.websiteEntity,
      this.addressEntity,
      this.companyEntity);

  @override
  List<Object?> get props => [
        idEntity,
        nameEntity,
        usernameEntity,
        emailEntity,
        phoneEntity,
        websiteEntity,
        addressEntity,
        companyEntity,
      ];
}
