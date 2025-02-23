import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/models/post.dart';
import 'package:marketplace/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:marketplace/modules/dashboard/bloc/dashboard_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/widgets/custom_image.dart';

import '../../../widgets/common_textfield.dart';
import '../../../widgets/common_widgets.dart';
import '../../post_details/bloc/post_details_bloc.dart';
import '../../post_details/bloc/post_details_event.dart';
import '../../post_details/view/post_details_screen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController textEditingController = TextEditingController();
  final List<String> filterLabel = [
    'For You',
    'Recent',
    'My Requests',
    'Top Deals',
    'Category'
  ];

  int selectedIndex = 0;

  final scrollContainer = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: CommonTextFormField(
              textFormFieldController: textEditingController,
              labelName: "Type your requirement here . . .",
              prefixIcon: CircleAvatar(
                radius: 16,
                child: ClipOval(
                  child: Image.asset(
                    "assets/empty-image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(filterLabel.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: ChoiceChip(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: Text(filterLabel[index]),
                    selected: false,
                    backgroundColor: selectedIndex == index
                        ? const Color(0xFFFFEFEF)
                        : Colors.white,
                    side: BorderSide(
                        color: selectedIndex == index
                            ? const Color(0xFFFE4545)
                            : const Color(0xFFE8E7EA)),
                    onSelected: (selected) {
                      CommonWidgets.showToast("Filter button is clicked");
                      if (selected) {
                        setState(() {
                          selectedIndex = index;
                        });
                      }
                    },
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 0.66.sh,
            child: BlocConsumer<DashboardBloc, DashboardState>(
                listener: (context, state) {
              // if (scrollContainer.position.maxScrollExtent ==
              //     scrollContainer.offset) {
              //   context
              //       .read<DashboardBloc>()
              //       .add(const FetchPostDataEvent(pageNumber: "0"));
              // }
            }, builder: (context, state) {
              if (state is DashboardLoading) {
                return CommonWidgets.circularProgressIndicator();
              }
              if (state is DashboardError) {
                return const Center(child: Text("Something went wrong!"));
              }
              if (state is DashboardLoaded) {
                final List<MarketplaceRequest> marketplaceRequests =
                    state.dashboardDataState.marketplaceRequests ?? [];
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: marketplaceRequests.length,
                    padding: EdgeInsets.zero,
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: scrollContainer,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PostDetailsScreen()));
                          context.read<PostDetailsBloc>().add(
                              FetchPostDetailsEvent(
                                  hashId: marketplaceRequests[index]
                                      .idHash
                                      .toString()));
                          CommonWidgets.showToast("Post is clicked");
                        },
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child:
                                postCard(marketplaceRequests[index], context),
                          ),
                          if (marketplaceRequests[index].isHighValue == true)
                            Positioned(
                              top: 2,
                              right: 18,
                              child: CommonWidgets.commonbadge(
                                  textName: "High Value  ",
                                  imagePath: "assets/high_value.svg",
                                  gradiantStartColor: const Color(0xFFFE9C13),
                                  gradiantEndColor: const Color(0xFFFB9428)),
                            ),
                          if (marketplaceRequests[index].isDealClosed == true)
                            Positioned(
                              top: 2,
                              right: 18,
                              child: CommonWidgets.commonbadge(
                                  textName: "Expiring Soon ",
                                  imagePath: "assets/high_value.svg",
                                  gradiantStartColor: const Color(0xFFFE9C13),
                                  gradiantEndColor: const Color(0xFFFB9428)),
                            )
                        ]),
                      );
                    });
              }
              return CommonWidgets.circularProgressIndicator();
            }),
          )
        ],
      ),
    );
  }

  Card postCard(MarketplaceRequest marketplaceData, context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: const Color(0xFFFFFFFF),
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFFE9E9E9), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.5,
                backgroundImage: marketplaceData.userDetails?.profileImage !=
                        null
                    ? NetworkImage(marketplaceData.userDetails?.profileImage)
                    : null,
                child: marketplaceData.userDetails?.profileImage == null
                    ? ClipOval(
                        child: Image.asset(
                          "assets/empty-image.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  spacing: 0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      marketplaceData.userDetails?.name ?? "",
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${marketplaceData.userDetails?.designation}"
                      " at ${marketplaceData.userDetails?.company}",
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
                          width: 12,
                          child: CustomImage(
                              imagePath: "assets/time.svg",
                              color: Color(0xFF7E7E7E)),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          marketplaceData.createdAt ?? "",
                          style: const TextStyle(
                              fontFamily: "Inter",
                              fontSize: 10,
                              color: Color(0xFF7E7E7E),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              const CustomImage(
                  imagePath: "assets/right_arrow.svg",
                  color: Color(0xFFAAAAAA)),
            ],
          ),
          if (marketplaceData.serviceType != null)
            CommonWidgets.commonLookingForRow(marketplaceData.serviceType!,
                Text("Looking for ${marketplaceData.serviceType}")),
          const Divider(
            color: Color(0xFFE9E9E9),
          ),
          CommonWidgets.commonDetails(marketplaceData, context),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Wrap(
              children: [
                if (marketplaceData.requestDetails?.cities != null)
                  CommonWidgets.chipsList(context,
                      iconName: "assets/building.svg",
                      listData: marketplaceData.requestDetails?.cities),
                if (marketplaceData.requestDetails?.followersRange != null)
                  CommonWidgets.chipsList(
                    context,
                    iconName: "assets/instagram.svg",
                    otherWidget: Text(
                        "${marketplaceData.requestDetails!.followersRange!.igFollowersMin} - ${marketplaceData.requestDetails?.followersRange!.igFollowersMax}"),
                  ),
                if (marketplaceData.requestDetails?.categories != null)
                  CommonWidgets.chipsList(context,
                      iconName: "assets/category.svg",
                      listData: marketplaceData.requestDetails?.categories),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
