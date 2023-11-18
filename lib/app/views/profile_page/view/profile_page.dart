import 'package:currency_converter/app/views/login_page/view/login_page.dart';
import 'package:currency_converter/app/views/profile_page/widgets/ListTileWidget.dart';
import 'package:currency_converter/helpers/color_resources.dart';
import 'package:currency_converter/helpers/dimensions.dart';
import 'package:currency_converter/helpers/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // First Container
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    color: ColorResources.gold,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: Dimensions.paddingSizeLarge),
                        width: screenWidth * 0.5,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: ColorResources.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: Dimensions.paddingSizeSmall),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: Dimensions.paddingSizeTwentyThree,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "YASA",
                                    style: profileTextStyle(
                                      color: ColorResources.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "0895-2568-3801",
                                    style: profileTextStyle(
                                      color: ColorResources.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorResources.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                ),
                // Second Container
                
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                ),
                Divider(
                  height: Dimensions.marginSizeSmall,
                  color: ColorResources.grey,
                  thickness: 8,
                ),
                MyListViewWidget(),
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Butuh Bantuan?',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                ),
                // Logout Container
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  ),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: ColorResources.red,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorResources.black),
                    ),
                    child: Center(
                      child: Text(
                        "LOGOUT",
                        style: profileTextStyle(
                          color: ColorResources.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
