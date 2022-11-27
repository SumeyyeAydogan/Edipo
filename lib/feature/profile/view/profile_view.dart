import 'package:edipo/core/extension/context_extension.dart';
import 'package:edipo/core/init/theme/edipo_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/image_manager.dart';
import '../../../product/widgets/user_properties_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final mockListTitle = [
    "Ödeme Yap",
    "Kampanya Kodları",
    "Sözleşmeler",
    "Ayarlar",
    "Çıkış Yap"
  ];

  final List<Widget> list = [
    Column(children: [Text("Text")],),
    Column(children: [Text("Text")],),
    Column(children: [Text("Text")],),
    Column(children: [Text("Text")],),
  ];

  final mockListIcon = [
    ImageManager.instance.payIcon,
    ImageManager.instance.offersIcon,
    ImageManager.instance.contractsIcon,
    ImageManager.instance.settingsIcon,
    ImageManager.instance.exitIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImageManager.instance.introductionBg)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                )),
            _BodyBuildWidget(
                list: list,
                mockListTitle: mockListTitle,
                mockListIcon: mockListIcon),
          ],
        ),
      ));
  }
}

class _BodyBuildWidget extends StatelessWidget {
  const _BodyBuildWidget({
    Key? key,
    required this.list,
    required this.mockListTitle,
    required this.mockListIcon,
  }) : super(key: key);

  final List<Widget> list;
  final List<String> mockListTitle;
  final List<String> mockListIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 0,
                        child: Padding(
                            padding: context.paddingMediumVertical,
                            child: CircleAvatar(
                                maxRadius: 40,
                                child: SvgPicture.asset(
                                          ImageManager.instance.appleIcon,
                                          fit: BoxFit.cover,
                                        ),
                                ))),
                    _UserTitleWidget(fullName: "Sümeyye Aydoğan"),
                    UserFeatureWidgets(
                      isRate: false,
                      carrierValue: 10,
                      gainValue: 20,
                      ratingValue: 4.5,
                      senderValue: 5,
                    ),
                    _UserProfileListWidgets(
                        list: list,
                        mockListTitle: mockListTitle,
                        mockListIcon: mockListIcon),
                  ],
                ),
        ));
  }
}

class _UserProfileListWidgets extends StatelessWidget {
  const _UserProfileListWidgets({
    Key? key,
    required this.list,
    required this.mockListTitle,
    required this.mockListIcon,
  }) : super(key: key);

  final List<Widget> list;
  final List<String> mockListTitle;
  final List<String> mockListIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: mockListTitle.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.paddingHighHorizontal,
              child: InkWell(
                onTap: () {
                  if (index == 4) {
                    //quit(context);
                  } else {
                    showModalBottomSheet(
                        useRootNavigator: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        isScrollControlled: true,
                        context: context, 
                        builder: (context) => list[index]);
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                  color: EdipoTheme
                      .defaultTheme.colorScheme.secondaryContainer,
                  child: Padding(
                    padding: context.paddingMediumLowVertical,
                    child: ListTile(
                      title: Text(
                        mockListTitle[index],
                        style: EdipoTheme.defaultTheme.textTheme.headline3,
                      ),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: context.paddingLow,
                          child: SvgPicture.asset(mockListIcon[index]),
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

/* void quit(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  context.router
      .pushAndPopUntil(const IntroductionRoute(), predicate: (route) => false);
} */

class _UserTitleWidget extends StatelessWidget {
  final String fullName;
  const _UserTitleWidget({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 0,
        child: Padding(
          padding: context.paddingMediumVertical,
          child: Text(
            fullName,
            style: EdipoTheme.defaultTheme.textTheme.headline1,
          ),
        ));
  }
}
