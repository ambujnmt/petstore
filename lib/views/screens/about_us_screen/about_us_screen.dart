import 'package:pinkpawscat/models/about_us_model.dart';
import 'package:pinkpawscat/views/widgets/dotted_line_widget.dart';

import '../../../utils/app_imports.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final isLoading = true.obs;

  final abotData = Rxn<AboutUsModel>();

  Future<void> _getFaqs() async {
    final res = await ApiServices.get('/about');
    if (res != null) {
      abotData.value = AboutUsModel.fromJson(res);
    }
    setState(() {});
  }

  Future<void> refreshData() async {
    isLoading(true);
    abotData.value = null;
    await _getFaqs();
    isLoading(false);
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'About Us'),
      body: (size) => Obx(
        () => isLoading.value
            ? AppLoader.widget()
            : abotData.value == null
                ? AppRefreshIndicator(
                    onRefresh: refreshData,
                    error: true,
                    message: 'Something went wrong, please try again.',
                  )
                : ListView(
                    children: [
                      heightSpace10,
                      AppNetworkImage(
                        imageUrl: abotData.value!.image1,
                        radiusValue: 0,
                        height: 180,
                        width: Get.width,
                      ),
                      heightSpace20,
                      Column(
                        children: [
                          if (abotData.value?.title != null &&
                              abotData.value!.description != null)
                            _customWidget(abotData.value!.title!,
                                abotData.value!.description!),
                          if (abotData.value?.wwrHeading != null &&
                              abotData.value!.wwrDescription != null)
                            _customWidget(
                              abotData.value!.wwrHeading!,
                              abotData.value!.wwrDescription!,
                              subTitle:
                                  'Purebred British Shorthair and Longhair Kittens',
                            ),
                          heightSpace10,
                          Padding(
                            padding: AppDimentions.defaultScreenPadding,
                            child: SizedBox(
                              height: 280,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (abotData.value?.hhTitle != null &&
                                      abotData.value!.hhDesc != null)
                                    _customContainerWidget(
                                      abotData.value!.hhTitle!,
                                      abotData.value!.hhDesc!,
                                    )
                                  else
                                    const Expanded(child: SizedBox()),
                                  widthSpace13,
                                  if (abotData.value?.ethicalBreedingHeading !=
                                          null &&
                                      abotData.value!
                                              .ethicalBreedingDescription !=
                                          null)
                                    _customContainerWidget(
                                      abotData.value!.ethicalBreedingHeading!,
                                      abotData
                                          .value!.ethicalBreedingDescription!,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          heightSpace30,
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomContainer.lightContainer(
                                  isGradient: true,
                                  bgColorOpacity: .65,
                                  width: Get.width,
                                  radiusValue: 0),
                              CustomContainer.lightContainer(
                                shape: BoxShape.circle,
                                padding: const EdgeInsets.all(
                                    AppDimentions.screenPaddingXXS),
                                child: CustomContainer.lightContainer(
                                  height: 260,
                                  width: 260,
                                  shape: BoxShape.circle,
                                  padding: EdgeInsets.zero,
                                  child: AppNetworkImage(
                                      radiusValue: 0,
                                      imageUrl: abotData.value!.image2),
                                ),
                              ),
                            ],
                          ),
                          heightSpace20,
                          if (abotData.value?.deliverTitle != null &&
                              abotData.value!.deliverDesc != null)
                            _customWidget(
                              abotData.value!.deliverTitle!,
                              abotData.value!.deliverDesc!,
                              subTitle:
                                  'Purebred British Shorthair and Longhair Kittens',
                            ),
                          heightSpace70
                        ],
                      )
                    ],
                  ),
      ),
    );
  }
}

Widget _customWidget(String title, String desc, {String? subTitle}) {
  return Padding(
    padding: AppDimentions.defaultScreenPadding,
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomText.qText(title,
                  color: ColorConstants.deleteColor,
                  size: 20,
                  weight: FontWeight.w700),
            ),
          ],
        ),
        if (subTitle != null) ...[
          heightSpace10,
          Row(
            children: [
              CustomText.qText(subTitle,
                  size: 14, weight: FontWeight.w500, color: grey),
            ],
          ),
        ],
        heightSpace10,
        CustomText.pText(desc, size: 12, lines: 30, weight: FontWeight.w500),
        heightSpace20,
      ],
    ),
  );
}

Widget _customContainerWidget(String title, String desc) {
  return Expanded(
    child: CustomContainer.lightContainer(
      isGradient: true,
      bgColorOpacity: .65,
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Center(
              child: CustomText.qText(title,
                  align: TextAlign.center,
                  weight: FontWeight.bold,
                  color: white),
            ),
          ),
          heightSpace10,
          const DottedLine(
            dashLength: 3.5,
            dashGap: 2,
            thickness: 1.5,
            color: black,
          ),
          heightSpace10,
          CustomText.pText(desc,
              weight: FontWeight.w500,
              align: TextAlign.left,
              lines: 30,
              color: white,
              size: 10),
        ],
      ),
    ),
  );
}
