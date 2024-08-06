class UserProfile {
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
  final int isActive;
  final String? paymentCardLastFour;
  final String? paymentCardBrand;
  final String? paymentCardFawryToken;
  final String? loginMedium;
  final String? socialId;
  final int isPhoneVerified;
  final String temporaryToken;
  final int isEmailVerified;
  final double? walletBalance;
  final int loyaltyPoint;
  final int loginHitCount;
  final int isTempBlocked;
  final DateTime? tempBlockTime;
  final String referralCode;
  final String? referredBy;
  final String appLanguage;
  final int referralUserCount;
  final int ordersCount;
  final String tagline;

  UserProfile({
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
    required this.referralUserCount,
    required this.ordersCount,
    required this.tagline,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as int,
      name: json['name'] as String?,
      fName: json['f_name'] as String,
      lName: json['l_name'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] != null ? DateTime.parse(json['email_verified_at'] as String) : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      streetAddress: json['street_address'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      zip: json['zip'] as String?,
      houseNo: json['house_no'] as String?,
      apartmentNo: json['apartment_no'] as String?,
      cmFirebaseToken: json['cm_firebase_token'] as String?,
      isActive: json['is_active'] as int,
      paymentCardLastFour: json['payment_card_last_four'] as String?,
      paymentCardBrand: json['payment_card_brand'] as String?,
      paymentCardFawryToken: json['payment_card_fawry_token'] as String?,
      loginMedium: json['login_medium'] as String?,
      socialId: json['social_id'] as String?,
      isPhoneVerified: json['is_phone_verified'] as int,
      temporaryToken: json['temporary_token'] as String,
      isEmailVerified: json['is_email_verified'] as int,
      walletBalance: json['wallet_balance'] != null ? double.parse(json['wallet_balance'].toString()) : null,
      loyaltyPoint: json['loyalty_point'] as int,
      loginHitCount: json['login_hit_count'] as int,
      isTempBlocked: json['is_temp_blocked'] as int,
      tempBlockTime: json['temp_block_time'] != null ? DateTime.parse(json['temp_block_time'] as String) : null,
      referralCode: json['referral_code'] as String,
      referredBy: json['referred_by'] as String?,
      appLanguage: json['app_language'] as String,
      referralUserCount: json['referral_user_count'] as int,
      ordersCount: json['orders_count'] as int,
      tagline: json['tagline'] as String,
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
        'referral_user_count': referralUserCount,
        'orders_count': ordersCount,
        'tagline': tagline,
      };
}
