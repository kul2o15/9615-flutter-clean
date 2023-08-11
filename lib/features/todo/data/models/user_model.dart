import 'package:flutter_core_9615/features/todo/data/models/address_model.dart';
import 'package:flutter_core_9615/features/todo/data/models/company_model.dart';
import 'package:flutter_core_9615/features/todo/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  final int id;
  final String name;
  final CompanyModel company;
  final AddressModel address;
  final String username;
  final String email;
  final String phone;
  final String website;

  const UserModel(this.id, this.name, this.username, this.email, this.phone,
      this.website, this.company, this.address)
      : super(id, name, username, phone, email, website, address, company);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
