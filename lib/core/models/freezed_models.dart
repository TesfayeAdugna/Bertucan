import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_models.g.dart';

part 'freezed_models.freezed.dart';

@freezed
class UserToSignUp with _$UserToSignUp {
  const factory UserToSignUp({
    required String email,
    required String phone_number,
    required String password,
    required String first_name,
    required String last_name,
  }) = _UserToSignUp;

  factory UserToSignUp.fromJson(Map<String, dynamic> json) =>
      _$UserToSignUpFromJson(json);
}

@freezed
class UserToLogin with _$UserToLogin {
  const factory UserToLogin({
    required String email,
    required String password,
  }) = _UserToLogin;

  factory UserToLogin.fromJson(Map<String, dynamic> json) =>
      _$UserToLoginFromJson(json);
}

@freezed
class Gbv with _$Gbv {
  const factory Gbv({
    required int id,
    String? name,
    String? description,
    String? phone_number,
    int? address_id,
    int? membership_id,
    String? status,
    String? license,
    String? logo,
    GbvAddress? address,
  }) = _Gbv;

  factory Gbv.fromJson(Map<String, dynamic> json) => _$GbvFromJson(json);
}

@freezed
class GbvAddress with _$GbvAddress {
  const factory GbvAddress({
    required int? id,
    String? country,
    String? city,
    @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
        latitude,
    @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
        longitude,
    String? type,
    String? status,
  }) = _GbvAddress;

  factory GbvAddress.fromJson(Map<String, dynamic> json) =>
      _$GbvAddressFromJson(json);
}

double? _stringOrNullToDoubleConverter(dynamic val) =>
    val == null ? null : double.tryParse(val.toString());

@freezed
abstract class GbvReport with _$GbvReport {
  const factory GbvReport({
    String? message,
    String? user_id,
    String? abuse_types_id,
    String? contact_phone_number,
    String? gbv_center,
    String? contact_address,
    String? file,
  }) = _GbvReport;

  factory GbvReport.fromJson(Map<String, dynamic> json) =>
      _$GbvReportFromJson(json);
}

@freezed
class Srh with _$Srh {
  const factory Srh({
    required int id,
    String? title,
    String? introduction,
    String? icon,
    String? body,
    String? small_description,
    int? article_by,
    String? status,
    User? user,
  }) = _Srh;

  factory Srh.fromJson(Map<String, dynamic> json) => _$SrhFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    String? first_name,
    String? last_name,
    String? email,
    String? profile_picture,
    String? phone_number,
    String? log_status,
    String? birthdate,
    String? role,
    int? address_id,
    String? membership_id,
    String? remember_token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserToEdit with _$UserToEdit {
  const factory UserToEdit({
    required String first_name,
    required String last_name,
    required String email,
    required String phone_number,
    required String birthdate,
    required String status,
  }) = _UserToEdit;

  factory UserToEdit.fromJson(Map<String, dynamic> json) =>
      _$UserToEditFromJson(json);
}

@freezed
class PasswordToChange with _$PasswordToChange {
  const factory PasswordToChange({
    required String old_password,
    required String new_password,
  }) = _PasswordToChange;
  factory PasswordToChange.fromJson(Map<String, dynamic> json) =>
      _$PasswordToChangeFromJson(json);
}

extension UserExtension on UserToEdit {
  User toUser(User user, {String? image}) => User(
      id: user.id,
      first_name: first_name,
      last_name: last_name,
      email: email,
      phone_number: phone_number,
      birthdate: birthdate,
      address_id: user.address_id,
      membership_id: user.membership_id,
      remember_token: user.remember_token,
      log_status: status,
      profile_picture: image);
}

@freezed
class ResetPassword with _$ResetPassword {
  const factory ResetPassword({
    required String email,
    required String code,
    required String new_password,
  }) = _ResetPassword;
  factory ResetPassword.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordFromJson(json);
}

@freezed
class RequestResetPassword with _$RequestResetPassword {
  const factory RequestResetPassword({
    required String email,
  }) = _RequestResetPassword;
  factory RequestResetPassword.fromJson(Map<String, dynamic> json) =>
      _$RequestResetPasswordFromJson(json);
}
