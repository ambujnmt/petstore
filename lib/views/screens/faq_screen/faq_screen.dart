import '../../../utils/app_imports.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'FAQs'),
      body: (size) => ListView(
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
          _customContainerWidget('How does the adoption process work?',
              'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
              isExpanded: true.obs),
          _customContainerWidget(
            'What is included when I purchase a kitten?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'What are the options for picking up orreceiving my kitten?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'Are your kittens purebred?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'What do I need to bring when I pick up my kitten?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'Can I visit my kitten before adopting them?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'Where is your cattery located?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'Do you provide registration papers for the kittens?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'Do you only breed British Longhair and Shorthair kittens?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'How can I get in contact with your cattery?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'Do you have a returns policy?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          _customContainerWidget(
            'What are the requirements for adopting a kitten from your cattery?',
            'We are so excited that you are considering adopting a cat from us! We aim to make this process as simple as we can. Browse our available kittens on our site or contact us to schedule a visit. Once you have chosen the kitten you want, add it to your cart and follow the instructions provided. There you will have the option to pay in full, put down a deposit, or pay in installments. You can also choose how you would like your kitten delivered or if you would rather pick them up in person.',
          ),
          heightSpace70
        ],
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
