class LocalUserInfo {
  final String name;
  final String givenName;
  final String familyName;
  final String email;
  final bool emailVerified;
  final String website;
  final String sub;

  LocalUserInfo({
    required this.name,
    required this.givenName,
    required this.familyName,
    required this.email,
    required this.emailVerified,
    required this.website,
    required this.sub,
  });

  factory LocalUserInfo.fromJson(Map<String, dynamic> json) => LocalUserInfo(
        name: json['name'] as String,
        givenName: json['given_name'] as String,
        familyName: json['family_name'] as String,
        email: json['email'] as String,
        emailVerified: json['email_verified'] as bool,
        website: json['website'] as String,
        sub: json['sub'] as String,
      );
}
