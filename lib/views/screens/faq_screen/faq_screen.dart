import '../../../utils/app_imports.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final isLoading = true.obs;

  final faqList = Rxn<List>();

  Future<void> _getFaqs() async {
    final res = await ApiServices.get('/faq');
    if (res != null) {
      faqList.value = res['faq_list'];
    }
    setState(() {});
  }

  Future<void> refreshData() async {
    isLoading(true);
    faqList.value = null;
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
      appBar: customAppBar(title: 'FAQs'),
      body: (size) => Obx(
        () => isLoading.value
            ? AppLoader.widget()
            : faqList.value == null
                ? AppRefreshIndicator(
                    onRefresh: refreshData,
                    error: true,
                    message: 'Something went wrong, Please try again.',
                  )
                : AppRefreshIndicator(
                    onRefresh: refreshData,
                    child: ListView(
                      children: [
                        heightSpace10,
                        _customWidget('Answering Our Most Popular Questions',
                            'Find answers to the most commonly asked questions about Pink Paws Cattery.'),
                        Image.asset(
                          height: 180,
                          width: Get.width,
                          fit: BoxFit.cover,
                          Images.faqImg,
                        ),
                        heightSpace20,
                        ...faqList.value!.map<Widget>((faq) {
                          return _customContainerWidget(
                            faq['question'] ?? '',
                            faq['answer'] ?? '',
                          );
                        }),
                        heightSpace70
                      ],
                    ),
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

Widget _customContainerWidget(String title, String desc, {RxBool? isExpanded}) {
  isExpanded ??= false.obs;
  return CustomContainer.lightContainer(
    margin: const EdgeInsets.symmetric(
        horizontal: AppDimentions.screenPadding,
        vertical: AppDimentions.screenPaddingXS),
    child: Obx(
      () => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText.qText(title,
                    size: 16,
                    weight: FontWeight.bold,
                    color: ColorConstants.deleteColor),
              ),
              widthSpace10,
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: isExpanded!.toggle,
                icon: Icon(
                  isExpanded.value
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  size: 35,
                ),
              ),
            ],
          ),
          if (isExpanded.value) ...[
            heightSpace10,
            CustomText.pText(
              desc,
              size: 12,
              lines: 30,
              weight: FontWeight.w500,
            ),
          ],
        ],
      ),
    ),
  );
}
