import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable {
  final String id;
  final String username;
  final String email;
  final String fullname;
  // final String avatar;
  final String firstName;
  final String lastName;
  final String referrer;
  final int totalReferrals;
  // final String? gender;
  // final dynamic zipCode;
  // final String country;
  // final String address;
  // final dynamic companyZip;
  final DateTime createdAt;
  final DateTime updatedAt;
  // final bool isGenderMale;
  // final bool isGenderFemale;
  final bool emailVerified;
  final bool isActive;
  final bool isBlocked;
  // final bool isSuspended;
  // final bool isUserAdmin;
  // final bool isUser;
  // final bool isUserManager;
  // final bool isUserReferred;
  // final bool isFreeAccount;
  const UserInfoEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.fullname,
    // required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.referrer,
    required this.totalReferrals,
    // required this.gender,
    // required this.zipCode,
    // required this.country,
    // required this.address,
    // required this.companyZip,
    required this.createdAt,
    required this.updatedAt,
    // required this.isGenderMale,
    // required this.isGenderFemale,
    required this.emailVerified,
    required this.isActive,
    required this.isBlocked,
    // required this.isSuspended,
    // required this.isUserAdmin,
    // required this.isUser,
    // required this.isUserManager,
    // required this.isUserReferred,
    // required this.isFreeAccount,
  });

  @override
  List<Object> get props {
    return [
      id,
      username,
      email,
      fullname,
      // avatar,
      firstName,
      lastName,
      referrer,
      // gender,
      // zipCode,
      // country,
      // address,
      // companyZip,
      createdAt,
      updatedAt,
      // isGenderMale,
      // isGenderFemale,
      emailVerified,
      isActive,
      isBlocked,
      // isSuspended,
      // isUserAdmin,
      // isUser,
      // isUserManager,
      // isUserReferred,
      // isFreeAccount,
    ];
  }
}
