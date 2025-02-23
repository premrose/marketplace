import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  final bool? ok;
  final List<MarketplaceRequest>? marketplaceRequests;
  final Pagination? pagination;

  Post({
    this.ok,
    this.marketplaceRequests,
    this.pagination,
  });

  Post copyWith({
    bool? ok,
    List<MarketplaceRequest>? marketplaceRequests,
    Pagination? pagination,
  }) =>
      Post(
        ok: ok ?? this.ok,
        marketplaceRequests: marketplaceRequests ?? this.marketplaceRequests,
        pagination: pagination ?? this.pagination,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        ok: json["ok"],
        marketplaceRequests: json["marketplace_requests"] == null
            ? []
            : List<MarketplaceRequest>.from(json["marketplace_requests"]!
                .map((x) => MarketplaceRequest.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "marketplace_requests": marketplaceRequests == null
            ? []
            : List<dynamic>.from(marketplaceRequests!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class MarketplaceRequest {
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

  MarketplaceRequest({
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

  MarketplaceRequest copyWith({
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
      MarketplaceRequest(
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

  factory MarketplaceRequest.fromJson(Map<String, dynamic> json) =>
      MarketplaceRequest(
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

class RequestDetails {
  final List<String>? cities;
  final FollowersRange? followersRange;
  final List<String>? categories;
  final int? creatorCountMin;
  final int? creatorCountMax;
  final String? budget;
  final String? brand;
  final List<String>? languages;
  final List<String>? platform;
  final String? gender;

  RequestDetails({
    this.cities,
    this.followersRange,
    this.categories,
    this.creatorCountMin,
    this.creatorCountMax,
    this.budget,
    this.brand,
    this.languages,
    this.platform,
    this.gender,
  });

  RequestDetails copyWith({
    List<String>? cities,
    FollowersRange? followersRange,
    List<String>? categories,
    int? creatorCountMin,
    int? creatorCountMax,
    String? budget,
    String? brand,
    List<String>? languages,
    List<String>? platform,
    String? gender,
  }) =>
      RequestDetails(
        cities: cities ?? this.cities,
        followersRange: followersRange ?? this.followersRange,
        categories: categories ?? this.categories,
        creatorCountMin: creatorCountMin ?? this.creatorCountMin,
        creatorCountMax: creatorCountMax ?? this.creatorCountMax,
        budget: budget ?? this.budget,
        brand: brand ?? this.brand,
        languages: languages ?? this.languages,
        platform: platform ?? this.platform,
        gender: gender ?? this.gender,
      );

  factory RequestDetails.fromJson(Map<String, dynamic> json) => RequestDetails(
        cities: json["cities"] == null
            ? []
            : List<String>.from(json["cities"]!.map((x) => x)),
        followersRange: json["followers_range"] == null
            ? null
            : FollowersRange.fromJson(json["followers_range"]),
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        creatorCountMin: json["creator_count_min"],
        creatorCountMax: json["creator_count_max"],
        budget: json["budget"],
        brand: json["brand"],
        languages: json["languages"] == null
            ? []
            : List<String>.from(json["languages"]!.map((x) => x)),
        platform: json["platform"] == null
            ? []
            : List<String>.from(json["platform"]!.map((x) => x)),
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "cities":
            cities == null ? [] : List<dynamic>.from(cities!.map((x) => x)),
        "followers_range": followersRange?.toJson(),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "creator_count_min": creatorCountMin,
        "creator_count_max": creatorCountMax,
        "budget": budget,
        "brand": brand,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "platform":
            platform == null ? [] : List<dynamic>.from(platform!.map((x) => x)),
        "gender": gender,
      };
}

class FollowersRange {
  final String? igFollowersMin;
  final String? igFollowersMax;
  final String? ytSubscribersMin;
  final String? ytSubscribersMax;

  FollowersRange({
    this.igFollowersMin,
    this.igFollowersMax,
    this.ytSubscribersMin,
    this.ytSubscribersMax,
  });

  FollowersRange copyWith({
    String? igFollowersMin,
    String? igFollowersMax,
    String? ytSubscribersMin,
    String? ytSubscribersMax,
  }) =>
      FollowersRange(
        igFollowersMin: igFollowersMin ?? this.igFollowersMin,
        igFollowersMax: igFollowersMax ?? this.igFollowersMax,
        ytSubscribersMin: ytSubscribersMin ?? this.ytSubscribersMin,
        ytSubscribersMax: ytSubscribersMax ?? this.ytSubscribersMax,
      );

  factory FollowersRange.fromJson(Map<String, dynamic> json) => FollowersRange(
        igFollowersMin: json["ig_followers_min"],
        igFollowersMax: json["ig_followers_max"],
        ytSubscribersMin: json["yt_subscribers_min"],
        ytSubscribersMax: json["yt_subscribers_max"],
      );

  Map<String, dynamic> toJson() => {
        "ig_followers_min": igFollowersMin,
        "ig_followers_max": igFollowersMax,
        "yt_subscribers_min": ytSubscribersMin,
        "yt_subscribers_max": ytSubscribersMax,
      };
}

class UserDetails {
  final String? name;
  final dynamic profileImage;
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
    dynamic profileImage,
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

class Pagination {
  final bool? hasMore;
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final dynamic nextPageUrl;
  final dynamic previousPageUrl;
  final String? url;

  Pagination({
    this.hasMore,
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.nextPageUrl,
    this.previousPageUrl,
    this.url,
  });

  Pagination copyWith({
    bool? hasMore,
    int? total,
    int? count,
    int? perPage,
    int? currentPage,
    int? totalPages,
    dynamic nextPageUrl,
    dynamic previousPageUrl,
    String? url,
  }) =>
      Pagination(
        hasMore: hasMore ?? this.hasMore,
        total: total ?? this.total,
        count: count ?? this.count,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        previousPageUrl: previousPageUrl ?? this.previousPageUrl,
        url: url ?? this.url,
      );

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        hasMore: json["has_more"],
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        nextPageUrl: json["next_page_url"],
        previousPageUrl: json["previous_page_url"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "has_more": hasMore,
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
        "next_page_url": nextPageUrl,
        "previous_page_url": previousPageUrl,
        "url": url,
      };
}
