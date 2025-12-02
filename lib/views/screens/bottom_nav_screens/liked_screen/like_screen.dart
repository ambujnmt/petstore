import 'package:pinkpawscat/views/screens/bottom_nav_screens/liked_screen/widgets/ls_card_widget.dart';

import '../../../../utils/app_imports.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppScaffold(
        appBar: customAppBar(title: 'Favorite', hideLeadign: true),
        body: (size) => ListView(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              children: [
                heightSpace15,
                GridView.builder(
                  itemCount: _favItems.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .58),
                  itemBuilder: (context, index) {
                    final item = _favItems[index];
                    return LsCardWidget(item: item);
                  },
                )
              ],
            ));
  }
}

final _favItems = [
  {
    'title': 'Emir',
    'desc': 'King, British Shorthair',
    'tag': 'Cinnamon',
    'rate': '\$1550',
    'img': 'assets/images/fav-cat1.jpg',
    'distance': '2.5 km',
    'gender': 'Male',
    'age': '2 years'
  },
  {
    'title': 'Pegas',
    'desc': 'King, British Shorthair',
    'tag': 'Black Golden Shell',
    'rate': '\$1850',
    'img': 'assets/images/fav-cat2.jpeg',
    'distance': '1.5 km',
    'gender': 'Male',
    'age': '3 years'
  },
  {
    'title': 'Leonette',
    'desc': 'Queen, British Shorthair',
    'tag': 'Blue',
    'rate': '\$2050',
    'img': 'assets/images/fav-cat2.jpeg',
    'distance': '4.3 km',
    'gender': 'Female',
    'age': '1.5 years'
  },
  {
    'title': 'Kylie',
    'desc': 'Queen, British Longhair',
    'tag': 'Black Silver Shaded',
    'rate': '\$2550',
    'img': 'assets/images/fav-cat1.jpg',
    'distance': '1.8 km',
    'gender': 'Female',
    'age': '3 years'
  },
];
