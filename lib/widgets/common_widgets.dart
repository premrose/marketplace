import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketplace/widgets/custom_image.dart';

class CommonWidgets {
  static Center circularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  static Container commonbadge(
      {required String textName,
      required String imagePath,
      required Color gradiantStartColor,
      required Color gradiantEndColor}) {
    return Container(
        width: 85,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            colors: [gradiantStartColor, gradiantEndColor],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 13,
              child: CustomImage(
                  imagePath: imagePath, color: const Color(0xFF7E7E7E)),
            ),
            Text(
              textName,
              style: const TextStyle(
                  height: 1.1, fontSize: 10, color: Colors.white),
            )
          ],
        ));
  }

  static Row commonLookingForRow(serviceType, textWidget) {
    return Row(
      children: [
        if (serviceType!.toLowerCase().contains("marketing"))
          const CustomImage(
              imagePath: "assets/looking_people.svg", color: Color(0xFFAAAAAA)),
        if (serviceType!.toLowerCase().contains("management"))
          const CustomImage(
              imagePath: "assets/people.svg", color: Color(0xFFAAAAAA)),
        if (serviceType!.toLowerCase().contains("photographer"))
          const CustomImage(
              imagePath: "assets/camera.svg", color: Color(0xFFAAAAAA)),
        if (serviceType!.toLowerCase().contains("affiliate"))
          const CustomImage(
              imagePath: "assets/tag.svg", color: Color(0xFFAAAAAA)),
        if (serviceType!.toLowerCase().contains("social"))
          const CustomImage(
              imagePath: "assets/activity.svg", color: Color(0xFFAAAAAA)),
        textWidget
      ],
    );
  }

  static Widget chipsList(BuildContext context,
      {required String iconName,
      List<dynamic>? listData,
      Color? bgColor,
      Widget? otherWidget}) {
    return (listData != null && listData.isNotEmpty) || otherWidget != null
        ? Card(
            color: bgColor ?? const Color(0xFFF5F6FB),
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 10, top: 4, bottom: 4),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomImage(
                    imagePath: iconName,
                    color: const Color(0xFF1C1B1F),
                  ),
                  SizedBox(
                      height: 20,
                      child: (listData != null && listData.isNotEmpty)
                          ? ListView.builder(
                              itemCount: listData.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Text(listData[index]),
                                    if (listData.length > 1 &&
                                        index >= 0 &&
                                        listData.length != index + 1)
                                      const Text(", "),
                                    if (listData.length > 3 && index == 4)
                                      Text("+${listData.length - 3} more")
                                  ],
                                );
                              })
                          : otherWidget),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  static Column commonDetails(data, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (data.requestDetails?.budget != null)
          Text(data.requestDetails!.budget!),
        if (data.requestDetails?.brand != null)
          Text(data.requestDetails!.brand!),
        if (data.requestDetails?.cities != null)
          listText("Location", data.requestDetails!.cities, context),
        if (data.requestDetails?.categories != null)
          listText("Type", data.requestDetails!.categories, context),
        if (data.requestDetails?.languages != null)
          listText("Language", data.requestDetails!.languages, context),
        Text(data.description ?? '',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      ],
    );
  }

  static listText(keyName, listData, context) {
    return listData.length > 0
        ? Row(
            children: [
              Text(
                "$keyName: ",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
                child: ListView.builder(
                    itemCount: listData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Text(
                        listData[index],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      );
                    }),
              ),
            ],
          )
        : const SizedBox.shrink();
  }

  static ElevatedButton commonButton(
      {required String buttonName,
      Color? buttonColor,
      Color? textColor,
      Color? borderColor,
      BorderRadius? borderRadius,
      Widget? iconWidget,
      bool isFromDashboard = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(50),
          side: BorderSide(
            color: borderColor ?? const Color(0xFFFE4545),
            width: 1.5,
          ),
        ),
        backgroundColor: buttonColor,
        foregroundColor: buttonColor,
        shadowColor: Colors.transparent,
      ),
      onPressed: () {
        showToast("Button is clicked");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconWidget != null)
            SizedBox(
              width: isFromDashboard ? 20 : 16,
              height: isFromDashboard ? 20 : 16,
              child: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: iconWidget,
              ),
            ),
          Text(
            buttonName,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: isFromDashboard ? 14 : 12),
          ),
        ],
      ),
    );
  }

  static Future<void> showToast(String message) async {
    await Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.SNACKBAR,
        textColor: Colors.black,
        backgroundColor: Colors.black12);
  }
}
