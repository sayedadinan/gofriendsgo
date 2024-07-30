

class UserProfileModel {
  final bool status;
  final String message;
  final UserData data;

  UserProfileModel({required this.status, required this.message, required this.data});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      status: json['status'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final User user;

  UserData({required this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final dynamic phone;
  final String? profilePic;
  final String companyName;
  final String dob;
  final String frequentFlyerNo;
  final String additionalDetails;
  final String? emailVerifiedAt;
  final String? referral;
  final String? source;
  final String? specify;
  final int status;
  final String? otp;
  final String? otpCreatedAt;
  final int target;
  final String createdAt;
  final String updatedAt;
  final int activeStatus;
  final String avatar;
  final int darkMode;
  final String? messengerColor;
  final List<Role> roles;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profilePic,
    required this.companyName,
    required this.dob,
    required this.frequentFlyerNo,
    required this.additionalDetails,
    this.emailVerifiedAt,
    this.referral,
    this.source,
    this.specify,
    required this.status,
    this.otp,
    this.otpCreatedAt,
    required this.target,
    required this.createdAt,
    required this.updatedAt,
    required this.activeStatus,
    required this.avatar,
    required this.darkMode,
    this.messengerColor,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var rolesFromJson = json['roles'] as List;
    List<Role> roleList = rolesFromJson.map((role) => Role.fromJson(role)).toList();

    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profilePic: json['profile_pic'],
      companyName: json['company_name'],
      dob: json['dob'],
      frequentFlyerNo: json['frequent_flyer_no'],
      additionalDetails: json['additional_details'],
      emailVerifiedAt: json['email_verified_at'],
      referral: json['referral'],
      source: json['source'],
      specify: json['specify'],
      status: json['status'],
      otp: json['otp'],
      otpCreatedAt: json['otp_created_at'],
      target: json['target'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      activeStatus: json['active_status'],
      avatar: json['avatar'],
      darkMode: json['dark_mode'],
      messengerColor: json['messenger_color'],
      roles: roleList,
    );
  }
}

class Role {
  final int id;
  final String name;
  final String guardName;
  final String createdAt;
  final String updatedAt;

  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      guardName: json['guard_name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
