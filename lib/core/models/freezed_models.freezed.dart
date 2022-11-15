// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserToSignUp _$UserToSignUpFromJson(Map<String, dynamic> json) {
  return _UserToSignUp.fromJson(json);
}

/// @nodoc
mixin _$UserToSignUp {
  String get email => throw _privateConstructorUsedError;
  String get phone_number => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get first_name => throw _privateConstructorUsedError;
  String get last_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToSignUpCopyWith<UserToSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToSignUpCopyWith<$Res> {
  factory $UserToSignUpCopyWith(
          UserToSignUp value, $Res Function(UserToSignUp) then) =
      _$UserToSignUpCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String phone_number,
      String password,
      String first_name,
      String last_name});
}

/// @nodoc
class _$UserToSignUpCopyWithImpl<$Res> implements $UserToSignUpCopyWith<$Res> {
  _$UserToSignUpCopyWithImpl(this._value, this._then);

  final UserToSignUp _value;
  // ignore: unused_field
  final $Res Function(UserToSignUp) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? phone_number = freezed,
    Object? password = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserToSignUpCopyWith<$Res>
    implements $UserToSignUpCopyWith<$Res> {
  factory _$$_UserToSignUpCopyWith(
          _$_UserToSignUp value, $Res Function(_$_UserToSignUp) then) =
      __$$_UserToSignUpCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String phone_number,
      String password,
      String first_name,
      String last_name});
}

/// @nodoc
class __$$_UserToSignUpCopyWithImpl<$Res>
    extends _$UserToSignUpCopyWithImpl<$Res>
    implements _$$_UserToSignUpCopyWith<$Res> {
  __$$_UserToSignUpCopyWithImpl(
      _$_UserToSignUp _value, $Res Function(_$_UserToSignUp) _then)
      : super(_value, (v) => _then(v as _$_UserToSignUp));

  @override
  _$_UserToSignUp get _value => super._value as _$_UserToSignUp;

  @override
  $Res call({
    Object? email = freezed,
    Object? phone_number = freezed,
    Object? password = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
  }) {
    return _then(_$_UserToSignUp(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToSignUp implements _UserToSignUp {
  const _$_UserToSignUp(
      {required this.email,
      required this.phone_number,
      required this.password,
      required this.first_name,
      required this.last_name});

  factory _$_UserToSignUp.fromJson(Map<String, dynamic> json) =>
      _$$_UserToSignUpFromJson(json);

  @override
  final String email;
  @override
  final String phone_number;
  @override
  final String password;
  @override
  final String first_name;
  @override
  final String last_name;

  @override
  String toString() {
    return 'UserToSignUp(email: $email, phone_number: $phone_number, password: $password, first_name: $first_name, last_name: $last_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToSignUp &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.phone_number, phone_number) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.first_name, first_name) &&
            const DeepCollectionEquality().equals(other.last_name, last_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone_number),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(first_name),
      const DeepCollectionEquality().hash(last_name));

  @JsonKey(ignore: true)
  @override
  _$$_UserToSignUpCopyWith<_$_UserToSignUp> get copyWith =>
      __$$_UserToSignUpCopyWithImpl<_$_UserToSignUp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToSignUpToJson(
      this,
    );
  }
}

abstract class _UserToSignUp implements UserToSignUp {
  const factory _UserToSignUp(
      {required final String email,
      required final String phone_number,
      required final String password,
      required final String first_name,
      required final String last_name}) = _$_UserToSignUp;

  factory _UserToSignUp.fromJson(Map<String, dynamic> json) =
      _$_UserToSignUp.fromJson;

  @override
  String get email;
  @override
  String get phone_number;
  @override
  String get password;
  @override
  String get first_name;
  @override
  String get last_name;
  @override
  @JsonKey(ignore: true)
  _$$_UserToSignUpCopyWith<_$_UserToSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

UserToLogin _$UserToLoginFromJson(Map<String, dynamic> json) {
  return _UserToLogin.fromJson(json);
}

/// @nodoc
mixin _$UserToLogin {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToLoginCopyWith<UserToLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToLoginCopyWith<$Res> {
  factory $UserToLoginCopyWith(
          UserToLogin value, $Res Function(UserToLogin) then) =
      _$UserToLoginCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$UserToLoginCopyWithImpl<$Res> implements $UserToLoginCopyWith<$Res> {
  _$UserToLoginCopyWithImpl(this._value, this._then);

  final UserToLogin _value;
  // ignore: unused_field
  final $Res Function(UserToLogin) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserToLoginCopyWith<$Res>
    implements $UserToLoginCopyWith<$Res> {
  factory _$$_UserToLoginCopyWith(
          _$_UserToLogin value, $Res Function(_$_UserToLogin) then) =
      __$$_UserToLoginCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$$_UserToLoginCopyWithImpl<$Res> extends _$UserToLoginCopyWithImpl<$Res>
    implements _$$_UserToLoginCopyWith<$Res> {
  __$$_UserToLoginCopyWithImpl(
      _$_UserToLogin _value, $Res Function(_$_UserToLogin) _then)
      : super(_value, (v) => _then(v as _$_UserToLogin));

  @override
  _$_UserToLogin get _value => super._value as _$_UserToLogin;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_UserToLogin(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToLogin implements _UserToLogin {
  const _$_UserToLogin({required this.email, required this.password});

  factory _$_UserToLogin.fromJson(Map<String, dynamic> json) =>
      _$$_UserToLoginFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserToLogin(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToLogin &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_UserToLoginCopyWith<_$_UserToLogin> get copyWith =>
      __$$_UserToLoginCopyWithImpl<_$_UserToLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToLoginToJson(
      this,
    );
  }
}

abstract class _UserToLogin implements UserToLogin {
  const factory _UserToLogin(
      {required final String email,
      required final String password}) = _$_UserToLogin;

  factory _UserToLogin.fromJson(Map<String, dynamic> json) =
      _$_UserToLogin.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_UserToLoginCopyWith<_$_UserToLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

Gbv _$GbvFromJson(Map<String, dynamic> json) {
  return _Gbv.fromJson(json);
}

/// @nodoc
mixin _$Gbv {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get phone_number => throw _privateConstructorUsedError;
  int? get address_id => throw _privateConstructorUsedError;
  int? get membership_id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get license => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  GbvAddress? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GbvCopyWith<Gbv> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GbvCopyWith<$Res> {
  factory $GbvCopyWith(Gbv value, $Res Function(Gbv) then) =
      _$GbvCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? name,
      String? description,
      String? phone_number,
      int? address_id,
      int? membership_id,
      String? status,
      String? license,
      String? logo,
      GbvAddress? address});

  $GbvAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$GbvCopyWithImpl<$Res> implements $GbvCopyWith<$Res> {
  _$GbvCopyWithImpl(this._value, this._then);

  final Gbv _value;
  // ignore: unused_field
  final $Res Function(Gbv) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? phone_number = freezed,
    Object? address_id = freezed,
    Object? membership_id = freezed,
    Object? status = freezed,
    Object? license = freezed,
    Object? logo = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      address_id: address_id == freezed
          ? _value.address_id
          : address_id // ignore: cast_nullable_to_non_nullable
              as int?,
      membership_id: membership_id == freezed
          ? _value.membership_id
          : membership_id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      license: license == freezed
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as GbvAddress?,
    ));
  }

  @override
  $GbvAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $GbvAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$$_GbvCopyWith<$Res> implements $GbvCopyWith<$Res> {
  factory _$$_GbvCopyWith(_$_Gbv value, $Res Function(_$_Gbv) then) =
      __$$_GbvCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? name,
      String? description,
      String? phone_number,
      int? address_id,
      int? membership_id,
      String? status,
      String? license,
      String? logo,
      GbvAddress? address});

  @override
  $GbvAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_GbvCopyWithImpl<$Res> extends _$GbvCopyWithImpl<$Res>
    implements _$$_GbvCopyWith<$Res> {
  __$$_GbvCopyWithImpl(_$_Gbv _value, $Res Function(_$_Gbv) _then)
      : super(_value, (v) => _then(v as _$_Gbv));

  @override
  _$_Gbv get _value => super._value as _$_Gbv;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? phone_number = freezed,
    Object? address_id = freezed,
    Object? membership_id = freezed,
    Object? status = freezed,
    Object? license = freezed,
    Object? logo = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_Gbv(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      address_id: address_id == freezed
          ? _value.address_id
          : address_id // ignore: cast_nullable_to_non_nullable
              as int?,
      membership_id: membership_id == freezed
          ? _value.membership_id
          : membership_id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      license: license == freezed
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as GbvAddress?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gbv implements _Gbv {
  const _$_Gbv(
      {required this.id,
      this.name,
      this.description,
      this.phone_number,
      this.address_id,
      this.membership_id,
      this.status,
      this.license,
      this.logo,
      this.address});

  factory _$_Gbv.fromJson(Map<String, dynamic> json) => _$$_GbvFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? phone_number;
  @override
  final int? address_id;
  @override
  final int? membership_id;
  @override
  final String? status;
  @override
  final String? license;
  @override
  final String? logo;
  @override
  final GbvAddress? address;

  @override
  String toString() {
    return 'Gbv(id: $id, name: $name, description: $description, phone_number: $phone_number, address_id: $address_id, membership_id: $membership_id, status: $status, license: $license, logo: $logo, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gbv &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.phone_number, phone_number) &&
            const DeepCollectionEquality()
                .equals(other.address_id, address_id) &&
            const DeepCollectionEquality()
                .equals(other.membership_id, membership_id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.license, license) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(phone_number),
      const DeepCollectionEquality().hash(address_id),
      const DeepCollectionEquality().hash(membership_id),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(license),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_GbvCopyWith<_$_Gbv> get copyWith =>
      __$$_GbvCopyWithImpl<_$_Gbv>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GbvToJson(
      this,
    );
  }
}

abstract class _Gbv implements Gbv {
  const factory _Gbv(
      {required final int id,
      final String? name,
      final String? description,
      final String? phone_number,
      final int? address_id,
      final int? membership_id,
      final String? status,
      final String? license,
      final String? logo,
      final GbvAddress? address}) = _$_Gbv;

  factory _Gbv.fromJson(Map<String, dynamic> json) = _$_Gbv.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get phone_number;
  @override
  int? get address_id;
  @override
  int? get membership_id;
  @override
  String? get status;
  @override
  String? get license;
  @override
  String? get logo;
  @override
  GbvAddress? get address;
  @override
  @JsonKey(ignore: true)
  _$$_GbvCopyWith<_$_Gbv> get copyWith => throw _privateConstructorUsedError;
}

GbvAddress _$GbvAddressFromJson(Map<String, dynamic> json) {
  return _GbvAddress.fromJson(json);
}

/// @nodoc
mixin _$GbvAddress {
  int? get id => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
  dynamic get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
  dynamic get longitude => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GbvAddressCopyWith<GbvAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GbvAddressCopyWith<$Res> {
  factory $GbvAddressCopyWith(
          GbvAddress value, $Res Function(GbvAddress) then) =
      _$GbvAddressCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? country,
      String? city,
      @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
          dynamic latitude,
      @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
          dynamic longitude,
      String? type,
      String? status});
}

/// @nodoc
class _$GbvAddressCopyWithImpl<$Res> implements $GbvAddressCopyWith<$Res> {
  _$GbvAddressCopyWithImpl(this._value, this._then);

  final GbvAddress _value;
  // ignore: unused_field
  final $Res Function(GbvAddress) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GbvAddressCopyWith<$Res>
    implements $GbvAddressCopyWith<$Res> {
  factory _$$_GbvAddressCopyWith(
          _$_GbvAddress value, $Res Function(_$_GbvAddress) then) =
      __$$_GbvAddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? country,
      String? city,
      @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
          dynamic latitude,
      @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
          dynamic longitude,
      String? type,
      String? status});
}

/// @nodoc
class __$$_GbvAddressCopyWithImpl<$Res> extends _$GbvAddressCopyWithImpl<$Res>
    implements _$$_GbvAddressCopyWith<$Res> {
  __$$_GbvAddressCopyWithImpl(
      _$_GbvAddress _value, $Res Function(_$_GbvAddress) _then)
      : super(_value, (v) => _then(v as _$_GbvAddress));

  @override
  _$_GbvAddress get _value => super._value as _$_GbvAddress;

  @override
  $Res call({
    Object? id = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_GbvAddress(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed ? _value.latitude : latitude,
      longitude: longitude == freezed ? _value.longitude : longitude,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GbvAddress implements _GbvAddress {
  const _$_GbvAddress(
      {required this.id,
      this.country,
      this.city,
      @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
          this.latitude,
      @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
          this.longitude,
      this.type,
      this.status});

  factory _$_GbvAddress.fromJson(Map<String, dynamic> json) =>
      _$$_GbvAddressFromJson(json);

  @override
  final int? id;
  @override
  final String? country;
  @override
  final String? city;
  @override
  @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
  final dynamic latitude;
  @override
  @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
  final dynamic longitude;
  @override
  final String? type;
  @override
  final String? status;

  @override
  String toString() {
    return 'GbvAddress(id: $id, country: $country, city: $city, latitude: $latitude, longitude: $longitude, type: $type, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GbvAddress &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_GbvAddressCopyWith<_$_GbvAddress> get copyWith =>
      __$$_GbvAddressCopyWithImpl<_$_GbvAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GbvAddressToJson(
      this,
    );
  }
}

abstract class _GbvAddress implements GbvAddress {
  const factory _GbvAddress(
      {required final int? id,
      final String? country,
      final String? city,
      @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
          final dynamic latitude,
      @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
          final dynamic longitude,
      final String? type,
      final String? status}) = _$_GbvAddress;

  factory _GbvAddress.fromJson(Map<String, dynamic> json) =
      _$_GbvAddress.fromJson;

  @override
  int? get id;
  @override
  String? get country;
  @override
  String? get city;
  @override
  @JsonKey(name: 'latitude', fromJson: _stringOrNullToDoubleConverter)
  dynamic get latitude;
  @override
  @JsonKey(name: 'longitude', fromJson: _stringOrNullToDoubleConverter)
  dynamic get longitude;
  @override
  String? get type;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_GbvAddressCopyWith<_$_GbvAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

GbvReport _$GbvReportFromJson(Map<String, dynamic> json) {
  return _GbvReport.fromJson(json);
}

/// @nodoc
mixin _$GbvReport {
  String? get message => throw _privateConstructorUsedError;
  String? get user_id => throw _privateConstructorUsedError;
  String? get abuse_types_id => throw _privateConstructorUsedError;
  String? get contact_phone_number => throw _privateConstructorUsedError;
  String? get gbv_center => throw _privateConstructorUsedError;
  String? get contact_address => throw _privateConstructorUsedError;
  String? get file => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GbvReportCopyWith<GbvReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GbvReportCopyWith<$Res> {
  factory $GbvReportCopyWith(GbvReport value, $Res Function(GbvReport) then) =
      _$GbvReportCopyWithImpl<$Res>;
  $Res call(
      {String? message,
      String? user_id,
      String? abuse_types_id,
      String? contact_phone_number,
      String? gbv_center,
      String? contact_address,
      String? file});
}

/// @nodoc
class _$GbvReportCopyWithImpl<$Res> implements $GbvReportCopyWith<$Res> {
  _$GbvReportCopyWithImpl(this._value, this._then);

  final GbvReport _value;
  // ignore: unused_field
  final $Res Function(GbvReport) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? user_id = freezed,
    Object? abuse_types_id = freezed,
    Object? contact_phone_number = freezed,
    Object? gbv_center = freezed,
    Object? contact_address = freezed,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      abuse_types_id: abuse_types_id == freezed
          ? _value.abuse_types_id
          : abuse_types_id // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_number: contact_phone_number == freezed
          ? _value.contact_phone_number
          : contact_phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      gbv_center: gbv_center == freezed
          ? _value.gbv_center
          : gbv_center // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_address: contact_address == freezed
          ? _value.contact_address
          : contact_address // ignore: cast_nullable_to_non_nullable
              as String?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GbvReportCopyWith<$Res> implements $GbvReportCopyWith<$Res> {
  factory _$$_GbvReportCopyWith(
          _$_GbvReport value, $Res Function(_$_GbvReport) then) =
      __$$_GbvReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? message,
      String? user_id,
      String? abuse_types_id,
      String? contact_phone_number,
      String? gbv_center,
      String? contact_address,
      String? file});
}

/// @nodoc
class __$$_GbvReportCopyWithImpl<$Res> extends _$GbvReportCopyWithImpl<$Res>
    implements _$$_GbvReportCopyWith<$Res> {
  __$$_GbvReportCopyWithImpl(
      _$_GbvReport _value, $Res Function(_$_GbvReport) _then)
      : super(_value, (v) => _then(v as _$_GbvReport));

  @override
  _$_GbvReport get _value => super._value as _$_GbvReport;

  @override
  $Res call({
    Object? message = freezed,
    Object? user_id = freezed,
    Object? abuse_types_id = freezed,
    Object? contact_phone_number = freezed,
    Object? gbv_center = freezed,
    Object? contact_address = freezed,
    Object? file = freezed,
  }) {
    return _then(_$_GbvReport(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      user_id: user_id == freezed
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      abuse_types_id: abuse_types_id == freezed
          ? _value.abuse_types_id
          : abuse_types_id // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_number: contact_phone_number == freezed
          ? _value.contact_phone_number
          : contact_phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      gbv_center: gbv_center == freezed
          ? _value.gbv_center
          : gbv_center // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_address: contact_address == freezed
          ? _value.contact_address
          : contact_address // ignore: cast_nullable_to_non_nullable
              as String?,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GbvReport implements _GbvReport {
  const _$_GbvReport(
      {this.message,
      this.user_id,
      this.abuse_types_id,
      this.contact_phone_number,
      this.gbv_center,
      this.contact_address,
      this.file});

  factory _$_GbvReport.fromJson(Map<String, dynamic> json) =>
      _$$_GbvReportFromJson(json);

  @override
  final String? message;
  @override
  final String? user_id;
  @override
  final String? abuse_types_id;
  @override
  final String? contact_phone_number;
  @override
  final String? gbv_center;
  @override
  final String? contact_address;
  @override
  final String? file;

  @override
  String toString() {
    return 'GbvReport(message: $message, user_id: $user_id, abuse_types_id: $abuse_types_id, contact_phone_number: $contact_phone_number, gbv_center: $gbv_center, contact_address: $contact_address, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GbvReport &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.user_id, user_id) &&
            const DeepCollectionEquality()
                .equals(other.abuse_types_id, abuse_types_id) &&
            const DeepCollectionEquality()
                .equals(other.contact_phone_number, contact_phone_number) &&
            const DeepCollectionEquality()
                .equals(other.gbv_center, gbv_center) &&
            const DeepCollectionEquality()
                .equals(other.contact_address, contact_address) &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(user_id),
      const DeepCollectionEquality().hash(abuse_types_id),
      const DeepCollectionEquality().hash(contact_phone_number),
      const DeepCollectionEquality().hash(gbv_center),
      const DeepCollectionEquality().hash(contact_address),
      const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$$_GbvReportCopyWith<_$_GbvReport> get copyWith =>
      __$$_GbvReportCopyWithImpl<_$_GbvReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GbvReportToJson(
      this,
    );
  }
}

abstract class _GbvReport implements GbvReport {
  const factory _GbvReport(
      {final String? message,
      final String? user_id,
      final String? abuse_types_id,
      final String? contact_phone_number,
      final String? gbv_center,
      final String? contact_address,
      final String? file}) = _$_GbvReport;

  factory _GbvReport.fromJson(Map<String, dynamic> json) =
      _$_GbvReport.fromJson;

  @override
  String? get message;
  @override
  String? get user_id;
  @override
  String? get abuse_types_id;
  @override
  String? get contact_phone_number;
  @override
  String? get gbv_center;
  @override
  String? get contact_address;
  @override
  String? get file;
  @override
  @JsonKey(ignore: true)
  _$$_GbvReportCopyWith<_$_GbvReport> get copyWith =>
      throw _privateConstructorUsedError;
}

Srh _$SrhFromJson(Map<String, dynamic> json) {
  return _Srh.fromJson(json);
}

/// @nodoc
mixin _$Srh {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get introduction => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get small_description => throw _privateConstructorUsedError;
  int? get article_by => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SrhCopyWith<Srh> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SrhCopyWith<$Res> {
  factory $SrhCopyWith(Srh value, $Res Function(Srh) then) =
      _$SrhCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? title,
      String? introduction,
      String? icon,
      String? body,
      String? small_description,
      int? article_by,
      String? status,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SrhCopyWithImpl<$Res> implements $SrhCopyWith<$Res> {
  _$SrhCopyWithImpl(this._value, this._then);

  final Srh _value;
  // ignore: unused_field
  final $Res Function(Srh) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? introduction = freezed,
    Object? icon = freezed,
    Object? body = freezed,
    Object? small_description = freezed,
    Object? article_by = freezed,
    Object? status = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      small_description: small_description == freezed
          ? _value.small_description
          : small_description // ignore: cast_nullable_to_non_nullable
              as String?,
      article_by: article_by == freezed
          ? _value.article_by
          : article_by // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_SrhCopyWith<$Res> implements $SrhCopyWith<$Res> {
  factory _$$_SrhCopyWith(_$_Srh value, $Res Function(_$_Srh) then) =
      __$$_SrhCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? title,
      String? introduction,
      String? icon,
      String? body,
      String? small_description,
      int? article_by,
      String? status,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_SrhCopyWithImpl<$Res> extends _$SrhCopyWithImpl<$Res>
    implements _$$_SrhCopyWith<$Res> {
  __$$_SrhCopyWithImpl(_$_Srh _value, $Res Function(_$_Srh) _then)
      : super(_value, (v) => _then(v as _$_Srh));

  @override
  _$_Srh get _value => super._value as _$_Srh;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? introduction = freezed,
    Object? icon = freezed,
    Object? body = freezed,
    Object? small_description = freezed,
    Object? article_by = freezed,
    Object? status = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_Srh(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      small_description: small_description == freezed
          ? _value.small_description
          : small_description // ignore: cast_nullable_to_non_nullable
              as String?,
      article_by: article_by == freezed
          ? _value.article_by
          : article_by // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Srh implements _Srh {
  const _$_Srh(
      {required this.id,
      this.title,
      this.introduction,
      this.icon,
      this.body,
      this.small_description,
      this.article_by,
      this.status,
      this.user});

  factory _$_Srh.fromJson(Map<String, dynamic> json) => _$$_SrhFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? introduction;
  @override
  final String? icon;
  @override
  final String? body;
  @override
  final String? small_description;
  @override
  final int? article_by;
  @override
  final String? status;
  @override
  final User? user;

  @override
  String toString() {
    return 'Srh(id: $id, title: $title, introduction: $introduction, icon: $icon, body: $body, small_description: $small_description, article_by: $article_by, status: $status, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Srh &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.introduction, introduction) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality()
                .equals(other.small_description, small_description) &&
            const DeepCollectionEquality()
                .equals(other.article_by, article_by) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(introduction),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(small_description),
      const DeepCollectionEquality().hash(article_by),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_SrhCopyWith<_$_Srh> get copyWith =>
      __$$_SrhCopyWithImpl<_$_Srh>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SrhToJson(
      this,
    );
  }
}

abstract class _Srh implements Srh {
  const factory _Srh(
      {required final int id,
      final String? title,
      final String? introduction,
      final String? icon,
      final String? body,
      final String? small_description,
      final int? article_by,
      final String? status,
      final User? user}) = _$_Srh;

  factory _Srh.fromJson(Map<String, dynamic> json) = _$_Srh.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  String? get introduction;
  @override
  String? get icon;
  @override
  String? get body;
  @override
  String? get small_description;
  @override
  int? get article_by;
  @override
  String? get status;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_SrhCopyWith<_$_Srh> get copyWith => throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String? get first_name => throw _privateConstructorUsedError;
  String? get last_name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get profile_picture => throw _privateConstructorUsedError;
  String? get phone_number => throw _privateConstructorUsedError;
  String? get log_status => throw _privateConstructorUsedError;
  String? get birthdate => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  int? get address_id => throw _privateConstructorUsedError;
  String? get membership_id => throw _privateConstructorUsedError;
  String? get remember_token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
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
      String? remember_token});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? email = freezed,
    Object? profile_picture = freezed,
    Object? phone_number = freezed,
    Object? log_status = freezed,
    Object? birthdate = freezed,
    Object? role = freezed,
    Object? address_id = freezed,
    Object? membership_id = freezed,
    Object? remember_token = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String?,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profile_picture: profile_picture == freezed
          ? _value.profile_picture
          : profile_picture // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      log_status: log_status == freezed
          ? _value.log_status
          : log_status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      address_id: address_id == freezed
          ? _value.address_id
          : address_id // ignore: cast_nullable_to_non_nullable
              as int?,
      membership_id: membership_id == freezed
          ? _value.membership_id
          : membership_id // ignore: cast_nullable_to_non_nullable
              as String?,
      remember_token: remember_token == freezed
          ? _value.remember_token
          : remember_token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
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
      String? remember_token});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? email = freezed,
    Object? profile_picture = freezed,
    Object? phone_number = freezed,
    Object? log_status = freezed,
    Object? birthdate = freezed,
    Object? role = freezed,
    Object? address_id = freezed,
    Object? membership_id = freezed,
    Object? remember_token = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String?,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profile_picture: profile_picture == freezed
          ? _value.profile_picture
          : profile_picture // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String?,
      log_status: log_status == freezed
          ? _value.log_status
          : log_status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      address_id: address_id == freezed
          ? _value.address_id
          : address_id // ignore: cast_nullable_to_non_nullable
              as int?,
      membership_id: membership_id == freezed
          ? _value.membership_id
          : membership_id // ignore: cast_nullable_to_non_nullable
              as String?,
      remember_token: remember_token == freezed
          ? _value.remember_token
          : remember_token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.id,
      this.first_name,
      this.last_name,
      this.email,
      this.profile_picture,
      this.phone_number,
      this.log_status,
      this.birthdate,
      this.role,
      this.address_id,
      this.membership_id,
      this.remember_token});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String? first_name;
  @override
  final String? last_name;
  @override
  final String? email;
  @override
  final String? profile_picture;
  @override
  final String? phone_number;
  @override
  final String? log_status;
  @override
  final String? birthdate;
  @override
  final String? role;
  @override
  final int? address_id;
  @override
  final String? membership_id;
  @override
  final String? remember_token;

  @override
  String toString() {
    return 'User(id: $id, first_name: $first_name, last_name: $last_name, email: $email, profile_picture: $profile_picture, phone_number: $phone_number, log_status: $log_status, birthdate: $birthdate, role: $role, address_id: $address_id, membership_id: $membership_id, remember_token: $remember_token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.first_name, first_name) &&
            const DeepCollectionEquality().equals(other.last_name, last_name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.profile_picture, profile_picture) &&
            const DeepCollectionEquality()
                .equals(other.phone_number, phone_number) &&
            const DeepCollectionEquality()
                .equals(other.log_status, log_status) &&
            const DeepCollectionEquality().equals(other.birthdate, birthdate) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.address_id, address_id) &&
            const DeepCollectionEquality()
                .equals(other.membership_id, membership_id) &&
            const DeepCollectionEquality()
                .equals(other.remember_token, remember_token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(first_name),
      const DeepCollectionEquality().hash(last_name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(profile_picture),
      const DeepCollectionEquality().hash(phone_number),
      const DeepCollectionEquality().hash(log_status),
      const DeepCollectionEquality().hash(birthdate),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(address_id),
      const DeepCollectionEquality().hash(membership_id),
      const DeepCollectionEquality().hash(remember_token));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      final String? first_name,
      final String? last_name,
      final String? email,
      final String? profile_picture,
      final String? phone_number,
      final String? log_status,
      final String? birthdate,
      final String? role,
      final int? address_id,
      final String? membership_id,
      final String? remember_token}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String? get first_name;
  @override
  String? get last_name;
  @override
  String? get email;
  @override
  String? get profile_picture;
  @override
  String? get phone_number;
  @override
  String? get log_status;
  @override
  String? get birthdate;
  @override
  String? get role;
  @override
  int? get address_id;
  @override
  String? get membership_id;
  @override
  String? get remember_token;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

UserToEdit _$UserToEditFromJson(Map<String, dynamic> json) {
  return _UserToEdit.fromJson(json);
}

/// @nodoc
mixin _$UserToEdit {
  String get first_name => throw _privateConstructorUsedError;
  String get last_name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone_number => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserToEditCopyWith<UserToEdit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserToEditCopyWith<$Res> {
  factory $UserToEditCopyWith(
          UserToEdit value, $Res Function(UserToEdit) then) =
      _$UserToEditCopyWithImpl<$Res>;
  $Res call(
      {String first_name,
      String last_name,
      String email,
      String phone_number,
      String birthdate,
      String status});
}

/// @nodoc
class _$UserToEditCopyWithImpl<$Res> implements $UserToEditCopyWith<$Res> {
  _$UserToEditCopyWithImpl(this._value, this._then);

  final UserToEdit _value;
  // ignore: unused_field
  final $Res Function(UserToEdit) _then;

  @override
  $Res call({
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? email = freezed,
    Object? phone_number = freezed,
    Object? birthdate = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserToEditCopyWith<$Res>
    implements $UserToEditCopyWith<$Res> {
  factory _$$_UserToEditCopyWith(
          _$_UserToEdit value, $Res Function(_$_UserToEdit) then) =
      __$$_UserToEditCopyWithImpl<$Res>;
  @override
  $Res call(
      {String first_name,
      String last_name,
      String email,
      String phone_number,
      String birthdate,
      String status});
}

/// @nodoc
class __$$_UserToEditCopyWithImpl<$Res> extends _$UserToEditCopyWithImpl<$Res>
    implements _$$_UserToEditCopyWith<$Res> {
  __$$_UserToEditCopyWithImpl(
      _$_UserToEdit _value, $Res Function(_$_UserToEdit) _then)
      : super(_value, (v) => _then(v as _$_UserToEdit));

  @override
  _$_UserToEdit get _value => super._value as _$_UserToEdit;

  @override
  $Res call({
    Object? first_name = freezed,
    Object? last_name = freezed,
    Object? email = freezed,
    Object? phone_number = freezed,
    Object? birthdate = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_UserToEdit(
      first_name: first_name == freezed
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: last_name == freezed
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number: phone_number == freezed
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToEdit implements _UserToEdit {
  const _$_UserToEdit(
      {required this.first_name,
      required this.last_name,
      required this.email,
      required this.phone_number,
      required this.birthdate,
      required this.status});

  factory _$_UserToEdit.fromJson(Map<String, dynamic> json) =>
      _$$_UserToEditFromJson(json);

  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String email;
  @override
  final String phone_number;
  @override
  final String birthdate;
  @override
  final String status;

  @override
  String toString() {
    return 'UserToEdit(first_name: $first_name, last_name: $last_name, email: $email, phone_number: $phone_number, birthdate: $birthdate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToEdit &&
            const DeepCollectionEquality()
                .equals(other.first_name, first_name) &&
            const DeepCollectionEquality().equals(other.last_name, last_name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.phone_number, phone_number) &&
            const DeepCollectionEquality().equals(other.birthdate, birthdate) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(first_name),
      const DeepCollectionEquality().hash(last_name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone_number),
      const DeepCollectionEquality().hash(birthdate),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_UserToEditCopyWith<_$_UserToEdit> get copyWith =>
      __$$_UserToEditCopyWithImpl<_$_UserToEdit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToEditToJson(
      this,
    );
  }
}

abstract class _UserToEdit implements UserToEdit {
  const factory _UserToEdit(
      {required final String first_name,
      required final String last_name,
      required final String email,
      required final String phone_number,
      required final String birthdate,
      required final String status}) = _$_UserToEdit;

  factory _UserToEdit.fromJson(Map<String, dynamic> json) =
      _$_UserToEdit.fromJson;

  @override
  String get first_name;
  @override
  String get last_name;
  @override
  String get email;
  @override
  String get phone_number;
  @override
  String get birthdate;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_UserToEditCopyWith<_$_UserToEdit> get copyWith =>
      throw _privateConstructorUsedError;
}

PasswordToChange _$PasswordToChangeFromJson(Map<String, dynamic> json) {
  return _PasswordToChange.fromJson(json);
}

/// @nodoc
mixin _$PasswordToChange {
  String get old_password => throw _privateConstructorUsedError;
  String get new_password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordToChangeCopyWith<PasswordToChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordToChangeCopyWith<$Res> {
  factory $PasswordToChangeCopyWith(
          PasswordToChange value, $Res Function(PasswordToChange) then) =
      _$PasswordToChangeCopyWithImpl<$Res>;
  $Res call({String old_password, String new_password});
}

/// @nodoc
class _$PasswordToChangeCopyWithImpl<$Res>
    implements $PasswordToChangeCopyWith<$Res> {
  _$PasswordToChangeCopyWithImpl(this._value, this._then);

  final PasswordToChange _value;
  // ignore: unused_field
  final $Res Function(PasswordToChange) _then;

  @override
  $Res call({
    Object? old_password = freezed,
    Object? new_password = freezed,
  }) {
    return _then(_value.copyWith(
      old_password: old_password == freezed
          ? _value.old_password
          : old_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password: new_password == freezed
          ? _value.new_password
          : new_password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PasswordToChangeCopyWith<$Res>
    implements $PasswordToChangeCopyWith<$Res> {
  factory _$$_PasswordToChangeCopyWith(
          _$_PasswordToChange value, $Res Function(_$_PasswordToChange) then) =
      __$$_PasswordToChangeCopyWithImpl<$Res>;
  @override
  $Res call({String old_password, String new_password});
}

/// @nodoc
class __$$_PasswordToChangeCopyWithImpl<$Res>
    extends _$PasswordToChangeCopyWithImpl<$Res>
    implements _$$_PasswordToChangeCopyWith<$Res> {
  __$$_PasswordToChangeCopyWithImpl(
      _$_PasswordToChange _value, $Res Function(_$_PasswordToChange) _then)
      : super(_value, (v) => _then(v as _$_PasswordToChange));

  @override
  _$_PasswordToChange get _value => super._value as _$_PasswordToChange;

  @override
  $Res call({
    Object? old_password = freezed,
    Object? new_password = freezed,
  }) {
    return _then(_$_PasswordToChange(
      old_password: old_password == freezed
          ? _value.old_password
          : old_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password: new_password == freezed
          ? _value.new_password
          : new_password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PasswordToChange implements _PasswordToChange {
  const _$_PasswordToChange(
      {required this.old_password, required this.new_password});

  factory _$_PasswordToChange.fromJson(Map<String, dynamic> json) =>
      _$$_PasswordToChangeFromJson(json);

  @override
  final String old_password;
  @override
  final String new_password;

  @override
  String toString() {
    return 'PasswordToChange(old_password: $old_password, new_password: $new_password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordToChange &&
            const DeepCollectionEquality()
                .equals(other.old_password, old_password) &&
            const DeepCollectionEquality()
                .equals(other.new_password, new_password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(old_password),
      const DeepCollectionEquality().hash(new_password));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordToChangeCopyWith<_$_PasswordToChange> get copyWith =>
      __$$_PasswordToChangeCopyWithImpl<_$_PasswordToChange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PasswordToChangeToJson(
      this,
    );
  }
}

abstract class _PasswordToChange implements PasswordToChange {
  const factory _PasswordToChange(
      {required final String old_password,
      required final String new_password}) = _$_PasswordToChange;

  factory _PasswordToChange.fromJson(Map<String, dynamic> json) =
      _$_PasswordToChange.fromJson;

  @override
  String get old_password;
  @override
  String get new_password;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordToChangeCopyWith<_$_PasswordToChange> get copyWith =>
      throw _privateConstructorUsedError;
}

ResetPassword _$ResetPasswordFromJson(Map<String, dynamic> json) {
  return _ResetPassword.fromJson(json);
}

/// @nodoc
mixin _$ResetPassword {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get new_password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordCopyWith<ResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordCopyWith<$Res> {
  factory $ResetPasswordCopyWith(
          ResetPassword value, $Res Function(ResetPassword) then) =
      _$ResetPasswordCopyWithImpl<$Res>;
  $Res call({String email, String code, String new_password});
}

/// @nodoc
class _$ResetPasswordCopyWithImpl<$Res>
    implements $ResetPasswordCopyWith<$Res> {
  _$ResetPasswordCopyWithImpl(this._value, this._then);

  final ResetPassword _value;
  // ignore: unused_field
  final $Res Function(ResetPassword) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? code = freezed,
    Object? new_password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      new_password: new_password == freezed
          ? _value.new_password
          : new_password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ResetPasswordCopyWith<$Res>
    implements $ResetPasswordCopyWith<$Res> {
  factory _$$_ResetPasswordCopyWith(
          _$_ResetPassword value, $Res Function(_$_ResetPassword) then) =
      __$$_ResetPasswordCopyWithImpl<$Res>;
  @override
  $Res call({String email, String code, String new_password});
}

/// @nodoc
class __$$_ResetPasswordCopyWithImpl<$Res>
    extends _$ResetPasswordCopyWithImpl<$Res>
    implements _$$_ResetPasswordCopyWith<$Res> {
  __$$_ResetPasswordCopyWithImpl(
      _$_ResetPassword _value, $Res Function(_$_ResetPassword) _then)
      : super(_value, (v) => _then(v as _$_ResetPassword));

  @override
  _$_ResetPassword get _value => super._value as _$_ResetPassword;

  @override
  $Res call({
    Object? email = freezed,
    Object? code = freezed,
    Object? new_password = freezed,
  }) {
    return _then(_$_ResetPassword(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      new_password: new_password == freezed
          ? _value.new_password
          : new_password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResetPassword implements _ResetPassword {
  const _$_ResetPassword(
      {required this.email, required this.code, required this.new_password});

  factory _$_ResetPassword.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPasswordFromJson(json);

  @override
  final String email;
  @override
  final String code;
  @override
  final String new_password;

  @override
  String toString() {
    return 'ResetPassword(email: $email, code: $code, new_password: $new_password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPassword &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.new_password, new_password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(new_password));

  @JsonKey(ignore: true)
  @override
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      __$$_ResetPasswordCopyWithImpl<_$_ResetPassword>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPasswordToJson(
      this,
    );
  }
}

abstract class _ResetPassword implements ResetPassword {
  const factory _ResetPassword(
      {required final String email,
      required final String code,
      required final String new_password}) = _$_ResetPassword;

  factory _ResetPassword.fromJson(Map<String, dynamic> json) =
      _$_ResetPassword.fromJson;

  @override
  String get email;
  @override
  String get code;
  @override
  String get new_password;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestResetPassword _$RequestResetPasswordFromJson(Map<String, dynamic> json) {
  return _RequestResetPassword.fromJson(json);
}

/// @nodoc
mixin _$RequestResetPassword {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestResetPasswordCopyWith<RequestResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestResetPasswordCopyWith<$Res> {
  factory $RequestResetPasswordCopyWith(RequestResetPassword value,
          $Res Function(RequestResetPassword) then) =
      _$RequestResetPasswordCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$RequestResetPasswordCopyWithImpl<$Res>
    implements $RequestResetPasswordCopyWith<$Res> {
  _$RequestResetPasswordCopyWithImpl(this._value, this._then);

  final RequestResetPassword _value;
  // ignore: unused_field
  final $Res Function(RequestResetPassword) _then;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RequestResetPasswordCopyWith<$Res>
    implements $RequestResetPasswordCopyWith<$Res> {
  factory _$$_RequestResetPasswordCopyWith(_$_RequestResetPassword value,
          $Res Function(_$_RequestResetPassword) then) =
      __$$_RequestResetPasswordCopyWithImpl<$Res>;
  @override
  $Res call({String email});
}

/// @nodoc
class __$$_RequestResetPasswordCopyWithImpl<$Res>
    extends _$RequestResetPasswordCopyWithImpl<$Res>
    implements _$$_RequestResetPasswordCopyWith<$Res> {
  __$$_RequestResetPasswordCopyWithImpl(_$_RequestResetPassword _value,
      $Res Function(_$_RequestResetPassword) _then)
      : super(_value, (v) => _then(v as _$_RequestResetPassword));

  @override
  _$_RequestResetPassword get _value => super._value as _$_RequestResetPassword;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$_RequestResetPassword(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestResetPassword implements _RequestResetPassword {
  const _$_RequestResetPassword({required this.email});

  factory _$_RequestResetPassword.fromJson(Map<String, dynamic> json) =>
      _$$_RequestResetPasswordFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'RequestResetPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestResetPassword &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$_RequestResetPasswordCopyWith<_$_RequestResetPassword> get copyWith =>
      __$$_RequestResetPasswordCopyWithImpl<_$_RequestResetPassword>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestResetPasswordToJson(
      this,
    );
  }
}

abstract class _RequestResetPassword implements RequestResetPassword {
  const factory _RequestResetPassword({required final String email}) =
      _$_RequestResetPassword;

  factory _RequestResetPassword.fromJson(Map<String, dynamic> json) =
      _$_RequestResetPassword.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_RequestResetPasswordCopyWith<_$_RequestResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
