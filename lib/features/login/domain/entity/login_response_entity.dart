class LoginResponseEntity {
  final String? message;
  final bool isMobileverified;
  final UserResponseEntity? user;

  const LoginResponseEntity({
    this.message,
    this.isMobileverified = false,
    this.user,
  });
}

class UserResponseEntity {
  final String? id;
  final String? name;
  final String? email;
  final String? countryCode;
  final String? mobile;
  final String? clientId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? type;
  final String? status;
  final String? token;
  final String? gmail;
  final int? loginAttempts;
  final List<RolesEntity>? roles;

  const UserResponseEntity({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.countryCode,
    this.clientId,
    this.createdAt,
    this.updatedAt,
    this.roles,
    this.type,
    this.status,
    this.token,
    this.gmail,
    this.loginAttempts,
  });
}

class RolesEntity {
  final String? id;
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
  final String? roleId;

  const PivotsEntity({this.modelType, this.modelId, this.roleId});
}

class UserProfileEntity {
  final int? id;
  final int? userid;
  final String? regNo;
  final String? profilePicture;
  final String? parentName;
  final String? parentEmail;
  final String? collage;
  final int? defaultSegmentId;
  final String? meta;
  final DateTime? dob;
  final String? address;

  const UserProfileEntity({
    this.id,
    this.userid,
    this.regNo,
    this.profilePicture,
    this.parentName,
    this.parentEmail,
    this.collage,
    this.defaultSegmentId,
    this.meta,
    this.dob,
    this.address,
  });
}

class LoginData {
  final LoginResponseEntity loginData;
  final bool isLoading;
  final String? error;
  final bool isNoInternet;

  LoginData({
    required this.loginData,
    this.isLoading = true,
    this.error,
    this.isNoInternet = false,
  });

  LoginData copyWith({
    LoginResponseEntity? loginData,
    bool? isLoading,
    String? error,
    bool? isNoInternet,
  }) {
    return LoginData(
      loginData: loginData ?? this.loginData,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isNoInternet: isNoInternet ?? this.isNoInternet,
    );
  }
}
