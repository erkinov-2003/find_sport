import 'package:find_sport/src/controller/controller.dart';
import 'package:find_sport/src/core/constants/app_colors.dart';
import 'package:find_sport/src/core/constants/app_icons.dart';
import 'package:find_sport/src/core/localization/app_localizations.dart';
import 'package:find_sport/src/presentation/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blackColor,
        onPressed: () => mainController.navigationPages(
          context,
          const SignUpScreen(),
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: AppColors.whiteColor,
          size: 30,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    AppIcons.locationIcon,
                  ),
                  height: 80,
                ),
                const SizedBox(width: 12),
                Text(
                  "FindSport",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                )
              ],
            ),
            const Spacer(flex: 3),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 25),
                 child: Text(
                   AppLocalizations.of(context).language,
                   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                     color: AppColors.blackColor,
                     fontWeight: FontWeight.w400,
                   ),
                 ),
               ),
               const SizedBox(height: 15),
               Padding(
                 padding: const EdgeInsets.only(left: 25, right: 25),
                 child: ExpansionTile(
                   collapsedShape: const RoundedRectangleBorder(
                     side: BorderSide(color: Colors.black, width: 0.3),
                     borderRadius: BorderRadius.all(
                       Radius.circular(10),
                     )
                   ),
                   shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(
                       Radius.circular(6),
                     ),
                     side: BorderSide(color: AppColors.blackColor, width: 0.3),
                   ),
                   leading: const Image(
                     image: AssetImage(AppIcons.uzbIcon),
                     height: 25,
                   ),
                   title: const Text("Choose a Language"),
                   children: [
                     ListTile(
                       leading: const Image(
                         image: AssetImage(AppIcons.uzbIcon),
                         height: 25,
                       ),
                       title: const Text("Uzbekistan"),
                       onTap: () {
                         mainController.onPressedUz(
                           const Locale("uz"),
                         );
                       },
                     ),
                     ListTile(
                       leading: const Image(
                         image: AssetImage(AppIcons.enIcon),
                         height: 25,
                       ),
                       title: const Text("English"),
                       onTap: () {
                         mainController.onPressedEng(
                           const Locale("en"),
                         );
                       },
                     ),
                     ListTile(
                       leading: const Image(
                         image: AssetImage(AppIcons.russianIcon),
                         height: 30,
                         fit: BoxFit.cover,
                       ),
                       title: const Text("Russian"),
                       onTap: () {
                         mainController.onPressedRu(
                           const Locale("ru"),
                         );
                       },
                     ),
                   ],
                 ),
               ),
             ],
           ),
            const Spacer(flex: 1),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
