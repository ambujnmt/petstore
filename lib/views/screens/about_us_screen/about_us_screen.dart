import 'package:pinkpawscat/views/widgets/dotted_line_widget.dart';

import '../../../utils/app_imports.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'About Us'),
      body: (size) => ListView(
        children: [
          heightSpace10,
          Image.asset(
            height: 180,
            width: Get.width,
            fit: BoxFit.cover,
            Images.aboutUs,
          ),
          heightSpace20,
          Column(
            children: [
              _customWidget(
                'About Pink Paws',
                'British Shorthair breeder Jacksonville—that’s who we are. At Pink Paws Cattery, we’re a family-owned, TICA Registered cattery passionately raising healthy and socialized British Shorthair (and Longhair) kittens in a loving Jacksonville home.',
              ),
              _customWidget(
                'Who We Are',
                'At Pink Paws Cattery, our mission is to raise and nurture healthy British Shorthair and Longhair kittens that bring lasting joy and companionship to families. As trusted cat breeders in Florida, we take pride in offering kittens raised in a nurturing, ethical, and family-centered environment. Every kitten is prepared to transition smoothly into their forever home, ensuring lifelong happiness for both pet and owner.',
                subTitle: 'Purebred British Shorthair and Longhair Kittens',
              ),
              heightSpace10,
              Padding(
                padding: AppDimentions.defaultScreenPadding,
                child: SizedBox(
                  height: 280,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _customContainerWidget(
                        'Happy & Healthy',
                        'The health and happiness of our kittens are always our top priorities. Each kitten comes with age appropriate vaccinations, a microchip, dewormer, and a thorough veterinary check. As dedicated Florida cat breeders, we make sure every kitten has the best start in life, ready to enjoy a long and healthy journey with their new family.',
                      ),
                      widthSpace13,
                      _customContainerWidget(
                        'Ethical Practices & Standards',
                        'At Pink Paws Cattery, we follow strict ethical breeding practices and uphold the highest standards of care. As TICA-registered cat breeders in Florida, we ensure that all of our kittens receive proper health checks and socialization, so they grow into confident and affectionate companions.',
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
                      radius: 0),
                  CustomContainer.lightContainer(
                      height: 260,
                      width: 260,
                      shape: BoxShape.circle,
                      padding:
                          const EdgeInsets.all(AppDimentions.screenPaddingXXS),
                      child: Image.asset(Images.aboutUs2)),
                ],
              ),
              heightSpace20,
              _customWidget(
                'Nurtured with Love, Delivered with Care',
                'We are among the most trusted cat breeders in Florida, specializing in British Shorthair and Longhair kittens. Our focus is on quality over quantity, giving each kitten personalized attention, early socialization, and love from day one. Unlike large-scale breeders, our family-owned cattery raises cats in a warm, home-based environment. Each kitten is nurtured to be friendly, confident, and ready to become a cherished part of your family.',
                subTitle: 'Purebred British Shorthair and Longhair Kittens',
              ),
              heightSpace70
            ],
          )
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
