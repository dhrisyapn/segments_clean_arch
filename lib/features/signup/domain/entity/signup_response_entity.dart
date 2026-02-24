class SignupResponseEntity {
  final int? userId;
  final String? message;
  final UserEntity? user;

  const SignupResponseEntity({this.userId, this.message, this.user});
}

class UserEntity {
  final String? name;
  final String? email;
  final String? mobile;
  final String? countryCode;
  final int? clientId;
  final String? createdAt;
  final String? type;
  final int? id;
  final RolesEntity? roles;

  const UserEntity({
    this.name,
    this.email,
    this.mobile,
    this.countryCode,
    this.clientId,
    this.createdAt,
    this.type,
    this.id,
    this.roles,
  });
}

class RolesEntity {
  final int? id;
  final String? name;
  final String? guardName;
  final String? roleName;
  final String? clientId;
  final String? desc;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final PivotsEntity? pivots;

  const RolesEntity({
    this.id,
    this.name,
    this.guardName,
    this.roleName,
    this.clientId,
    this.desc,
    this.createdAt,
    this.updatedAt,
    this.pivots,
  });
}

class PivotsEntity {
  final String? modelType;
  final int? modelId;
  final int? roleId;

  const PivotsEntity({this.modelType, this.modelId, this.roleId});
}

class UserProfileEntity {
  final int? defaultSegmentId;
  final int? userid;
  final String? regNo;
  final int? id;

  const UserProfileEntity({
    this.defaultSegmentId,
    this.id,
    this.userid,
    this.regNo,
  });
}

class SignupData {
  final SignupResponseEntity signupData;
  final bool isLoading;
  final String? error;
  final bool isNoInternet;

  SignupData({
    required this.signupData,
    this.isLoading = true,
    this.error,
    this.isNoInternet = false,
  });

  SignupData copyWith({
    SignupResponseEntity? signupData,
    bool? isLoading,
    String? error,
    bool? isNoInternet,
  }) {
    return SignupData(
      signupData: signupData ?? this.signupData,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isNoInternet: isNoInternet ?? this.isNoInternet,
    );
  }
}
