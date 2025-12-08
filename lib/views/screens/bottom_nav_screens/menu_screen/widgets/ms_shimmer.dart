import 'package:pinkpawscat/utils/app_imports.dart';

class MsShimmer extends StatelessWidget {
  const MsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        padding: AppDimentions.defaultScreenPadding,
        itemCount: 5,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .9,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) =>
                      CustomContainer.lightContainer(
                    shape: BoxShape.circle,
                    padding: EdgeInsets.zero,
                    height: constraints.maxHeight,
                    width: constraints.maxHeight,
                    child: const AppNetworkImage(),
                  ),
                ),
              ),
              heightSpace5,
              CustomText.qText('cat title', size: 20)
            ],
          );
        },
      ),
    );
  }
}
