import '../../../../utils/app_imports.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppScaffold(
        appBar: customAppBar(title: 'Category', hideLeadign: true),
        body: (_) => ListView(
              children: [
                heightSpace15,
                GridView.builder(
                  itemCount: _cats.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .9),
                  itemBuilder: (context, index) {
                    final item = _cats[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Column(
                        children: [
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) =>
                                  CustomContainer.lightContainer(
                                shape: BoxShape.circle,
                                padding: EdgeInsets.zero,
                                height: constraints.maxHeight,
                                width: constraints.maxHeight,
                                child: Image.asset(item['img']!,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          heightSpace5,
                          CustomText.qText(item['title']!, size: 20)
                        ],
                      ),
                    );
                  },
                ),
              ],
            ));
  }
}

final _cats = [
  {'title': 'Munchkin', 'img': 'assets/images/cat1.png'},
  {'title': 'Ragdoll', 'img': 'assets/images/cat2.png'},
  {'title': 'British shorthair', 'img': 'assets/images/cat3.png'},
  {'title': 'Persian', 'img': 'assets/images/cat4.png'},
  {'title': 'Caracal', 'img': 'assets/images/cat5.png'},
  {'title': 'Maine coon', 'img': 'assets/images/fav-cat1.jpg'}
];
