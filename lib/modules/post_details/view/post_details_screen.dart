import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/models/post_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/common_widgets.dart';
import '../../../widgets/custom_image.dart';
import '../bloc/post_details_bloc.dart';
import '../bloc/post_details_state.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                CommonWidgets.showToast("Delete button is clicked");
              },
              icon: const CustomImage(
                  imagePath: "assets/delete.svg", color: Colors.white)),
          IconButton(
              onPressed: () {
                CommonWidgets.showToast("Share button is clicked");
              },
              icon: const CustomImage(
                  imagePath: "assets/share.svg", color: Colors.white))
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<PostDetailsBloc, PostDetailsState>(
          builder: (context, state) {
            if (state is PostDetailsLoading) {
              return CommonWidgets.circularProgressIndicator();
            }
            if (state is PostDetailsError) {
              return SizedBox(
                  height: 0.8.sh,
                  child: const Center(child: Text("Something went wrong!")));
            }
            if (state is PostDetailsLoaded) {
              final WebMarketplaceRequests? webMarketplaceRequests =
                  state.postDetailsDataState.webMarketplaceRequests;
              return webMarketplaceRequests != null
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top profile widgets
                  ColoredBox(
                    color: const Color(0xFFF5F6FB),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: webMarketplaceRequests
                                          .userDetails?.profileImage !=
                                      null
                                  ? NetworkImage(webMarketplaceRequests
                                      .userDetails!.profileImage!)
                                  : null,
                              child: webMarketplaceRequests
                                          .userDetails?.profileImage ==
                                      null
                                  ? ClipOval(
                                      child: Image.asset(
                                        "assets/empty-image.png",
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      webMarketplaceRequests
                                              .userDetails?.name ??
                                          "",
                                      style: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: SizedBox(
                                        height: 12,
                                        child: Image.asset(
                                          "assets/linkedin.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                      child: CustomImage(
                                          imagePath: "assets/verified.svg",
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                                Text(
                                  "${webMarketplaceRequests.userDetails?.designation}"
                                  " at ${webMarketplaceRequests.userDetails?.company}",
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12,
                                      color: Color(0xFF7E7E7E),
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 14,
                                      height: 14,
                                      child: CustomImage(
                                          imagePath: "assets/building.svg",
                                          color: Color(0xFF7E7E7E)),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      webMarketplaceRequests
                                              .userDetails?.company ??
                                          "",
                                      style: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 12,
                                          color: Color(0xFF7E7E7E),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            webMarketplaceRequests.createdAt ?? "",
                            style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 10,
                                color: Color(0xFF7E7E7E),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (webMarketplaceRequests.serviceType != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Looking for",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                      height: 1.8,
                                      color: Color(0xFF7E7E7E),
                                      fontWeight: FontWeight.w400),
                                ),
                                CommonWidgets.commonLookingForRow(
                                    webMarketplaceRequests.serviceType!,
                                    Text(
                                      webMarketplaceRequests.serviceType!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                              ],
                            ),
                          ),
                        const Divider(height: 0),
                        // highlights widgets
                        Wrap(
                          children: [
                            if (webMarketplaceRequests.requestDetails?.budget !=
                                    null ||
                                webMarketplaceRequests.requestDetails?.brand !=
                                    null)
                              const Text("Highlights",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                      height: 2,
                                      color: Color(0xFFAAAAAA),
                                      fontWeight: FontWeight.w600)),
                            if (webMarketplaceRequests.requestDetails?.budget !=
                                null)
                              CommonWidgets.chipsList(context,
                                  iconName: "assets/rupees.svg",
                                  otherWidget: Text(webMarketplaceRequests
                                      .requestDetails!.budget!)),
                            if (webMarketplaceRequests.requestDetails?.brand !=
                                null)
                              CommonWidgets.chipsList(context,
                                  iconName: "assets/speaker.svg",
                                  otherWidget: Text(webMarketplaceRequests
                                      .requestDetails!.brand!)),
                          ],
                        ),
                        // common details widgets
                        CommonWidgets.commonDetails(
                            webMarketplaceRequests, context),
                      ],
                    ),
                  ),
                  // share buttons widgets
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonWidgets.commonButton(
                              buttonName: " Share via WhatsApp",
                              buttonColor:
                                  const Color.fromRGBO(11, 220, 78, 0.12),
                              textColor: const Color(0xFF1F1F1F),
                              borderColor: Colors.transparent,
                              iconWidget: Image.asset("assets/whatsapp.png"),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: CommonWidgets.commonButton(
                              buttonName: " Share via LinkedIn",
                              textColor: const Color(0xFF1F1F1F),
                              buttonColor:
                                  const Color.fromRGBO(0, 102, 200, 0.12),
                              borderColor: Colors.transparent,
                              iconWidget: Image.asset("assets/linkedin.png"),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ],
                    ),
                  ),
                  // key highlights widgets
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Text(
                      "Key Highlighted Details",
                      style: TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Wrap(
                      children: [
                        if (webMarketplaceRequests.requestDetails?.categories !=
                            null)
                          commonData(
                              webMarketplaceRequests.requestDetails?.categories,
                              "Catagory"),
                        if (webMarketplaceRequests.requestDetails?.cities !=
                            null)
                          commonData(
                              webMarketplaceRequests.requestDetails?.cities,
                              "Location"),
                        if (webMarketplaceRequests.requestDetails?.languages !=
                            null)
                          commonData(
                              webMarketplaceRequests.requestDetails?.languages,
                              "Language"),
                        if (webMarketplaceRequests.requestDetails?.platform !=
                            null)
                          commonData(
                              webMarketplaceRequests.requestDetails?.platform,
                              "Brand Collab with"),
                      ],
                    ),
                  )
                ],
                    )
                  : SizedBox(
                      height: 0.8.sh,
                      child:
                          const Center(child: Text("Something went wrong!")));
            }
            return CommonWidgets.circularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: context.watch<PostDetailsBloc>().state
              is PostDetailsLoaded
          ? Container(
              height: 88,
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(width: 0.1))),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 12,
                          child: CustomImage(
                              imagePath: "assets/time.svg",
                              color: Color(0xFFAAAAAA)),
                        ),
                        Text(
                          "Your post has will be expired on 26 July",
                          style:
                              TextStyle(height: 1.1, color: Color(0xFF1F1F1F)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CommonWidgets.commonButton(
                              buttonName: "Edit",
                              textColor: const Color(0xFFFE4545))),
                      const SizedBox(width: 8),
                      Expanded(
                          child: CommonWidgets.commonButton(
                              buttonName: "Close",
                              buttonColor: const Color(0xFFFE4545))),
                    ],
                  ),
                ],
              ),
            )
          : null,
    );
  }

  commonData(data, title) {
    return SizedBox(
      width: 0.4.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 20,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length ?? 0,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        data?[index] ?? "",
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xFFAAAAAA)),
                      ),
                      if (data.length > 1 &&
                          index >= 0 &&
                          data.length != index + 1)
                        const Text(", ",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xFFAAAAAA))),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
