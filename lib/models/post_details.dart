import 'dart:convert';

import 'post.dart';

PostDetails postDetailsFromJson(String str) =>
    PostDetails.fromJson(json.decode(str));

String postDetailsToJson(PostDetails data) => json.encode(data.toJson());

class PostDetails {
  final bool? ok;
  final WebMarketplaceRequests? webMarketplaceRequests;

  PostDetails({
    this.ok,
    this.webMarketplaceRequests,
  });

  PostDetails copyWith({
    bool? ok,
    WebMarketplaceRequests? webMarketplaceRequests,
  }) =>
      PostDetails(
        ok: ok ?? this.ok,
        webMarketplaceRequests:
            webMarketplaceRequests ?? this.webMarketplaceRequests,
      );

  factory PostDetails.fromJson(Map<String, dynamic> json) => PostDetails(
        ok: json["ok"],
        webMarketplaceRequests: json["web_marketplace_requests"] == null
            ? null
            : WebMarketplaceRequests.fromJson(json["web_marketplace_requests"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "web_marketplace_requests": webMarketplaceRequests?.toJson(),
      };
}

class WebMarketplaceRequests {
  final String? idHash;
  final UserDetails? userDetails;
  final bool? isHighValue;
  final String? createdAt;
  final String? description;
  final RequestDetails? requestDetails;
  final String? status;
  final String? serviceType;
  final String? targetAudience;
  final bool? isOpen;
  final bool? isPanIndia;
  final bool? anyLanguage;
  final bool? isDealClosed;
  final String? slug;

  WebMarketplaceRequests({
    this.idHash,
    this.userDetails,
    this.isHighValue,
    this.createdAt,
    this.description,
    this.requestDetails,
    this.status,
    this.serviceType,
    this.targetAudience,
    this.isOpen,
    this.isPanIndia,
    this.anyLanguage,
    this.isDealClosed,
    this.slug,
  });

  WebMarketplaceRequests copyWith({
    String? idHash,
    UserDetails? userDetails,
    bool? isHighValue,
    String? createdAt,
    String? description,
    RequestDetails? requestDetails,
    String? status,
    String? serviceType,
    String? targetAudience,
    bool? isOpen,
    bool? isPanIndia,
    bool? anyLanguage,
    bool? isDealClosed,
    String? slug,
  }) =>
      WebMarketplaceRequests(
        idHash: idHash ?? this.idHash,
        userDetails: userDetails ?? this.userDetails,
        isHighValue: isHighValue ?? this.isHighValue,
        createdAt: createdAt ?? this.createdAt,
        description: description ?? this.description,
        requestDetails: requestDetails ?? this.requestDetails,
        status: status ?? this.status,
        serviceType: serviceType ?? this.serviceType,
        targetAudience: targetAudience ?? this.targetAudience,
        isOpen: isOpen ?? this.isOpen,
        isPanIndia: isPanIndia ?? this.isPanIndia,
        anyLanguage: anyLanguage ?? this.anyLanguage,
        isDealClosed: isDealClosed ?? this.isDealClosed,
        slug: slug ?? this.slug,
      );

  factory WebMarketplaceRequests.fromJson(Map<String, dynamic> json) =>
      WebMarketplaceRequests(
        idHash: json["id_hash"],
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromJson(json["user_details"]),
        isHighValue: json["is_high_value"],
        createdAt: json["created_at"],
        description: json["description"],
        requestDetails: json["request_details"] == null
            ? null
            : RequestDetails.fromJson(json["request_details"]),
        status: json["status"],
        serviceType: json["service_type"],
        targetAudience: json["target_audience"],
        isOpen: json["is_open"],
        isPanIndia: json["is_pan_india"],
        anyLanguage: json["any_language"],
        isDealClosed: json["is_deal_closed"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id_hash": idHash,
        "user_details": userDetails?.toJson(),
        "is_high_value": isHighValue,
        "created_at": createdAt,
        "description": description,
        "request_details": requestDetails?.toJson(),
        "status": status,
        "service_type": serviceType,
        "target_audience": targetAudience,
        "is_open": isOpen,
        "is_pan_india": isPanIndia,
        "any_language": anyLanguage,
        "is_deal_closed": isDealClosed,
        "slug": slug,
      };
}

class UserDetails {
  final String? name;
  final String? profileImage;
  final String? company;
  final String? designation;

  UserDetails({
    this.name,
    this.profileImage,
    this.company,
    this.designation,
  });

  UserDetails copyWith({
    String? name,
    String? profileImage,
    String? company,
    String? designation,
  }) =>
      UserDetails(
        name: name ?? this.name,
        profileImage: profileImage ?? this.profileImage,
        company: company ?? this.company,
        designation: designation ?? this.designation,
      );

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: json["name"],
        profileImage: json["profile_image"],
        company: json["company"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile_image": profileImage,
        "company": company,
        "designation": designation,
      };
}
