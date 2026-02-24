import 'package:segments_clean_arch/features/signup/domain/entity/signup_response_entity.dart';

class SignupResponseModel extends SignupResponseEntity {
  const SignupResponseModel({super.userId, super.message, super.user});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      userId: json['user_id'] as int?,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

class UserResponseModel extends UserEntity {
  const UserResponseModel({
    super.name,
    super.email,
    super.mobile,
    super.countryCode,
    super.clientId,
    super.createdAt,
    super.type,
    super.id,
    super.roles,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      countryCode: json['country_code'] as String?,
      clientId: json['client_id'] as int?,
      createdAt: json['created_at'] as String?,
      type: json['type'] as String?,
      id: json['id'] as int?,
      roles: json['roles'] != null && (json['roles'] as List).isNotEmpty
          ? RolesResponseModel.fromJson(
              (json['roles'] as List).first as Map<String, dynamic>,
            )
          : null,
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
      id: json['id'] as int?,
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
      roleId: json['role_id'] as int?,
    );
  }
}

class UserProfileResponseModel extends UserProfileEntity {
  const UserProfileResponseModel({
    super.defaultSegmentId,
    super.id,
    super.userid,
    super.regNo,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UserProfileResponseModel(
      defaultSegmentId: json['default_segment_id'] != null
          ? int.tryParse(json['default_segment_id'].toString())
          : null,
      id: json['id'] as int?,
      userid: json['user_id'] as int?,
      regNo: json['reg_no'] as String?,
    );
  }
}
