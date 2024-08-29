class Child {
  final int id;
  final int userId;
  final String relationType;
  final String name;
  final DateTime dob;
  final String gender;
  final String profilePicture;
  final Parent parent;
  final List<VaccinationSubmission> vaccinationSubmission;
  final List<Growth> growth;

  Child({
    required this.id,
    required this.userId,
    required this.relationType,
    required this.name,
    required this.dob,
    required this.gender,
    required this.profilePicture,
    required this.parent,
    required this.vaccinationSubmission,
    required this.growth,
  });

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      relationType: json['relation_type'] as String,
      name: json['name'] as String,
      dob: DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String,
      profilePicture: json['profile_picture'] as String,
      parent: Parent.fromJson(json['parent'] as Map<String, dynamic>),
      vaccinationSubmission: (json['vaccination_submission'] as List<dynamic>)
          .map((x) => VaccinationSubmission.fromJson(x as Map<String, dynamic>))
          .toList(),
      growth: (json['growth'] as List<dynamic>)
          .map((x) => Growth.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'relation_type': relationType,
        'name': name,
        'dob': dob.toIso8601String(),
        'gender': gender,
        'profile_picture': profilePicture,
        'parent': parent.toJson(),
        'vaccination_submission':
            vaccinationSubmission.map((x) => x.toJson()).toList(),
        'growth': growth.map((x) => x.toJson()).toList(),
      };
}

class Parent {
  final int id;
  final String? name;
  final String fName;
  final String lName;
  final String phone;
  final String image;
  final String email;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? streetAddress;
  final String? country;
  final String? city;
  final String? zip;
  final String? houseNo;
  final String? apartmentNo;
  final String? cmFirebaseToken;
  final bool isActive;
  final String? paymentCardLastFour;
  final String? paymentCardBrand;
  final String? paymentCardFawryToken;
  final String? loginMedium;
  final String? socialId;
  final bool isPhoneVerified;
  final String temporaryToken;
  final bool isEmailVerified;
  final double? walletBalance;
  final int loyaltyPoint;
  final int loginHitCount;
  final bool isTempBlocked;
  final DateTime? tempBlockTime;
  final String referralCode;
  final String? referredBy;
  final String appLanguage;

  Parent({
    required this.id,
    this.name,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.image,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.streetAddress,
    this.country,
    this.city,
    this.zip,
    this.houseNo,
    this.apartmentNo,
    this.cmFirebaseToken,
    required this.isActive,
    this.paymentCardLastFour,
    this.paymentCardBrand,
    this.paymentCardFawryToken,
    this.loginMedium,
    this.socialId,
    required this.isPhoneVerified,
    required this.temporaryToken,
    required this.isEmailVerified,
    this.walletBalance,
    required this.loyaltyPoint,
    required this.loginHitCount,
    required this.isTempBlocked,
    this.tempBlockTime,
    required this.referralCode,
    this.referredBy,
    required this.appLanguage,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      id: json['id'] as int,
      name: json['name'] as String?,
      fName: json['f_name'] as String,
      lName: json['l_name'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      streetAddress: json['street_address'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      zip: json['zip'] as String?,
      houseNo: json['house_no'] as String?,
      apartmentNo: json['apartment_no'] as String?,
      cmFirebaseToken: json['cm_firebase_token'] as String?,
      isActive: json['is_active'] as bool,
      paymentCardLastFour: json['payment_card_last_four'] as String?,
      paymentCardBrand: json['payment_card_brand'] as String?,
      paymentCardFawryToken: json['payment_card_fawry_token'] as String?,
      loginMedium: json['login_medium'] as String?,
      socialId: json['social_id'] as String?,
      isPhoneVerified: json['is_phone_verified'] as bool,
      temporaryToken: json['temporary_token'] as String,
      isEmailVerified: json['is_email_verified'] as bool,
      walletBalance: (json['wallet_balance'] as num?)?.toDouble(),
      loyaltyPoint: json['loyalty_point'] as int,
      loginHitCount: json['login_hit_count'] as int,
      isTempBlocked: json['is_temp_blocked'] as bool,
      tempBlockTime: json['temp_block_time'] != null
          ? DateTime.parse(json['temp_block_time'] as String)
          : null,
      referralCode: json['referral_code'] as String,
      referredBy: json['referred_by'] as String?,
      appLanguage: json['app_language'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'f_name': fName,
        'l_name': lName,
        'phone': phone,
        'image': image,
        'email': email,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'street_address': streetAddress,
        'country': country,
        'city': city,
        'zip': zip,
        'house_no': houseNo,
        'apartment_no': apartmentNo,
        'cm_firebase_token': cmFirebaseToken,
        'is_active': isActive,
        'payment_card_last_four': paymentCardLastFour,
        'payment_card_brand': paymentCardBrand,
        'payment_card_fawry_token': paymentCardFawryToken,
        'login_medium': loginMedium,
        'social_id': socialId,
        'is_phone_verified': isPhoneVerified,
        'temporary_token': temporaryToken,
        'is_email_verified': isEmailVerified,
        'wallet_balance': walletBalance,
        'loyalty_point': loyaltyPoint,
        'login_hit_count': loginHitCount,
        'is_temp_blocked': isTempBlocked,
        'temp_block_time': tempBlockTime?.toIso8601String(),
        'referral_code': referralCode,
        'referred_by': referredBy,
        'app_language': appLanguage,
      };
}

class VaccinationSubmission {
  final int id;
  final int userId;
  final int childId;
  final int vaccinationId;
  final DateTime vaccinationDate;
  final DateTime? submissionDate;
  final String? picture;
  final bool isTaken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Vaccination vaccination;

  VaccinationSubmission({
    required this.id,
    required this.userId,
    required this.childId,
    required this.vaccinationId,
    required this.vaccinationDate,
    this.submissionDate,
    this.picture,
    required this.isTaken,
    required this.createdAt,
    required this.updatedAt,
    required this.vaccination,
  });

  factory VaccinationSubmission.fromJson(Map<String, dynamic> json) {
    return VaccinationSubmission(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      childId: json['child_id'] as int,
      vaccinationId: json['vaccination_id'] as int,
      vaccinationDate: DateTime.parse(json['vaccination_date'] as String),
      submissionDate: json['submission_date'] != null
          ? DateTime.parse(json['submission_date'] as String)
          : null,
      picture: json['picture'] as String?,
      isTaken: json['is_taken'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      vaccination:
          Vaccination.fromJson(json['vaccination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'child_id': childId,
        'vaccination_id': vaccinationId,
        'vaccination_date': vaccinationDate.toIso8601String(),
        'submission_date': submissionDate?.toIso8601String(),
        'picture': picture,
        'is_taken': isTaken,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'vaccination': vaccination.toJson(),
      };
}

class Vaccination {
  final int id;
  final String name;
  final String age;
  final String disease;
  final String protestAgainst;
  final String toBeGiven;
  final String how;
  final DateTime createdAt;
  final DateTime updatedAt;

  Vaccination({
    required this.id,
    required this.name,
    required this.age,
    required this.disease,
    required this.protestAgainst,
    required this.toBeGiven,
    required this.how,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vaccination.fromJson(Map<String, dynamic> json) {
    return Vaccination(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as String,
      disease: json['disease'] as String,
      protestAgainst: json['protest_against'] as String,
      toBeGiven: json['to_be_give'] as String,
      how: json['how'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'disease': disease,
        'protest_against': protestAgainst,
        'to_be_give': toBeGiven,
        'how': how,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

class Growth {
  // Define the fields and methods for the Growth class as needed.
  Growth();

  factory Growth.fromJson(Map<String, dynamic> json) {
    return Growth();
  }

  Map<String, dynamic> toJson() => {};
}

class ChildrenList {
  final List<Children> children;

  ChildrenList({required this.children});

  factory ChildrenList.fromJson(Map<String, dynamic> json) {
    return ChildrenList(
      children: (json['childerens'] as List<dynamic>)
          .map((x) => Children.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'childerens': children.map((x) => x.toJson()).toList(),
      };
}

class Children {
  final int id;
  final int userId;
  final String relationType;
  final String name;
  final DateTime dob;
  final String gender;
  final String profilePicture;

  Children({
    required this.id,
    required this.userId,
    required this.relationType,
    required this.name,
    required this.dob,
    required this.gender,
    required this.profilePicture,
  });

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      relationType: json['relation_type'] as String,
      name: json['name'] as String,
      dob: DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String,
      profilePicture: json['profile_picture'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'relation_type': relationType,
        'name': name,
        'dob': dob.toIso8601String(),
        'gender': gender,
        'profile_picture': profilePicture,
      };
}
