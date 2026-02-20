import 'package:segments_clean_arch/features/login/domain/entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel({
    super.message,
    super.isMobileverified = false,
    super.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] as String?,
      isMobileverified: json['is_mobile_verified'] as bool? ?? false,
      user: json['user'] == null
          ? null
          : UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

class UserResponseModel extends UserResponseEntity {
  const UserResponseModel({
    super.id,
    super.name,
    super.email,
    super.mobile,
    super.countryCode,
    super.clientId,
    super.createdAt,
    super.updatedAt,
    super.roles,
    super.type,
    super.status,
    super.token,
    super.gmail,
    super.loginAttempts,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      id: json['id']?.toString(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      countryCode: json['country_code'] as String?,
      clientId: json['client_id']?.toString(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'] as String),
      roles: json['roles'] == null
          ? []
          : (json['roles'] as List)
                .map(
                  (e) => RolesResponseModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
      type: json['type'] as String?,
      status: json['status'] as String?,
      token: json['tokens'] as String?,
      gmail: json['gmail'] as String?,
      loginAttempts: json['login_attempt'] as int?,
    );
  }
}

class RolesResponseModel extends RolesEntity {
  const RolesResponseModel({
    super.id,
    super.name,
    super.guardName,
    super.roleName,
    super.clientId,
    super.desc,
    super.createdAt,
    super.updatedAt,
    super.pivots,
  });

  factory RolesResponseModel.fromJson(Map<String, dynamic> json) {
    return RolesResponseModel(
      id: json['id']?.toString(),
      name: json['name'] as String?,
      guardName: json['guard_name'] as String?,
      roleName: json['role_name'] as String?,
      clientId: json['client_id']?.toString(),
      desc: json['desc'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'] as String),
      pivots: json['pivot'] == null
          ? null
          : PivotsResponseModel.fromJson(json['pivot'] as Map<String, dynamic>),
    );
  }
}

class PivotsResponseModel extends PivotsEntity {
  const PivotsResponseModel({super.modelType, super.modelId, super.roleId});

  factory PivotsResponseModel.fromJson(Map<String, dynamic> json) {
    return PivotsResponseModel(
      modelType: json['model_type'] as String?,
      modelId: json['model_id'] as int?,
      roleId: json['role_id']?.toString(),
    );
  }
}

class UserProfileResponseModel extends UserProfileEntity {
  const UserProfileResponseModel({
    super.id,
    super.userid,
    super.regNo,
    super.profilePicture,
    super.parentName,
    super.parentEmail,
    super.collage,
    super.defaultSegmentId,
    super.meta,
    super.dob,
    super.address,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UserProfileResponseModel(
      id: json['id'] as int?,
      userid: json['user_id'] as int?,
      regNo: json['reg_no'] as String?,
      profilePicture: json['profile_picture'] as String?,
      parentName: json['parent_name'] as String?,
      parentEmail: json['parent_email'] as String?,
      collage: json['collage'] as String?,
      defaultSegmentId: json['default_segment_id'] as int?,
      meta: json['meta'] as String?,
      dob: json['dob'] == null
          ? null
          : DateTime.tryParse(json['dob'] as String),
      address: json['address'] as String?,
    );
  }
}
