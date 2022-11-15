// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserToSignUp _$$_UserToSignUpFromJson(Map<String, dynamic> json) =>
    _$_UserToSignUp(
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
      password: json['password'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
    );

Map<String, dynamic> _$$_UserToSignUpToJson(_$_UserToSignUp instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone_number': instance.phone_number,
      'password': instance.password,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };

_$_UserToLogin _$$_UserToLoginFromJson(Map<String, dynamic> json) =>
    _$_UserToLogin(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_UserToLoginToJson(_$_UserToLogin instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$_Gbv _$$_GbvFromJson(Map<String, dynamic> json) => _$_Gbv(
      id: json['id'] as int,
      name: json['name'] as String?,
      description: json['description'] as String?,
      phone_number: json['phone_number'] as String?,
      address_id: json['address_id'] as int?,
      membership_id: json['membership_id'] as int?,
      status: json['status'] as String?,
      license: json['license'] as String?,
      logo: json['logo'] as String?,
      address: json['address'] == null
          ? null
          : GbvAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GbvToJson(_$_Gbv instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'phone_number': instance.phone_number,
      'address_id': instance.address_id,
      'membership_id': instance.membership_id,
      'status': instance.status,
      'license': instance.license,
      'logo': instance.logo,
      'address': instance.address,
    };

_$_GbvAddress _$$_GbvAddressFromJson(Map<String, dynamic> json) =>
    _$_GbvAddress(
      id: json['id'] as int?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      latitude: _stringOrNullToDoubleConverter(json['latitude']),
      longitude: _stringOrNullToDoubleConverter(json['longitude']),
      type: json['type'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_GbvAddressToJson(_$_GbvAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type': instance.type,
      'status': instance.status,
    };

_$_GbvReport _$$_GbvReportFromJson(Map<String, dynamic> json) => _$_GbvReport(
      message: json['message'] as String?,
      user_id: json['user_id'] as String?,
      abuse_types_id: json['abuse_types_id'] as String?,
      contact_phone_number: json['contact_phone_number'] as String?,
      gbv_center: json['gbv_center'] as String?,
      contact_address: json['contact_address'] as String?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$$_GbvReportToJson(_$_GbvReport instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user_id': instance.user_id,
      'abuse_types_id': instance.abuse_types_id,
      'contact_phone_number': instance.contact_phone_number,
      'gbv_center': instance.gbv_center,
      'contact_address': instance.contact_address,
      'file': instance.file,
    };

_$_Srh _$$_SrhFromJson(Map<String, dynamic> json) => _$_Srh(
      id: json['id'] as int,
      title: json['title'] as String?,
      introduction: json['introduction'] as String?,
      icon: json['icon'] as String?,
      body: json['body'] as String?,
      small_description: json['small_description'] as String?,
      article_by: json['article_by'] as int?,
      status: json['status'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SrhToJson(_$_Srh instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'introduction': instance.introduction,
      'icon': instance.icon,
      'body': instance.body,
      'small_description': instance.small_description,
      'article_by': instance.article_by,
      'status': instance.status,
      'user': instance.user,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      profile_picture: json['profile_picture'] as String?,
      phone_number: json['phone_number'] as String?,
      log_status: json['log_status'] as String?,
      birthdate: json['birthdate'] as String?,
      role: json['role'] as String?,
      address_id: json['address_id'] as int?,
      membership_id: json['membership_id'] as String?,
      remember_token: json['remember_token'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'profile_picture': instance.profile_picture,
      'phone_number': instance.phone_number,
      'log_status': instance.log_status,
      'birthdate': instance.birthdate,
      'role': instance.role,
      'address_id': instance.address_id,
      'membership_id': instance.membership_id,
      'remember_token': instance.remember_token,
    };

_$_UserToEdit _$$_UserToEditFromJson(Map<String, dynamic> json) =>
    _$_UserToEdit(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
      birthdate: json['birthdate'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_UserToEditToJson(_$_UserToEdit instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'birthdate': instance.birthdate,
      'status': instance.status,
    };

_$_PasswordToChange _$$_PasswordToChangeFromJson(Map<String, dynamic> json) =>
    _$_PasswordToChange(
      old_password: json['old_password'] as String,
      new_password: json['new_password'] as String,
    );

Map<String, dynamic> _$$_PasswordToChangeToJson(_$_PasswordToChange instance) =>
    <String, dynamic>{
      'old_password': instance.old_password,
      'new_password': instance.new_password,
    };

_$_ResetPassword _$$_ResetPasswordFromJson(Map<String, dynamic> json) =>
    _$_ResetPassword(
      email: json['email'] as String,
      code: json['code'] as String,
      new_password: json['new_password'] as String,
    );

Map<String, dynamic> _$$_ResetPasswordToJson(_$_ResetPassword instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
      'new_password': instance.new_password,
    };

_$_RequestResetPassword _$$_RequestResetPasswordFromJson(
        Map<String, dynamic> json) =>
    _$_RequestResetPassword(
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_RequestResetPasswordToJson(
        _$_RequestResetPassword instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
