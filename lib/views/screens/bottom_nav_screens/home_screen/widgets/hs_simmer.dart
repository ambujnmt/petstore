import '../../../../../utils/app_imports.dart';

class HsShimmer extends StatelessWidget {
  const HsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: AppDimentions.defaultScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade400,
                      ),
                      hintText: "Search here",
                      hintStyle: CustomText.pTextStyle(
                          size: 16, color: Colors.grey.shade400),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: grey[300]!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                customIconButton(
                  size: 45,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText.qText(
              'Category',
              size: 20,
              weight: FontWeight.w700,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                CustomText.pText(
                  'Find your perfect companion',
                  size: 12,
                  color: Colors.grey.shade400,
                ),
                const Spacer(),
                CustomText.pText(
                  'View all',
                  size: 10,
                  color: Colors.grey.shade400,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 130,
              child: Row(
                children: List.generate(
                    4,
                    (i) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              children: [
                                CustomContainer.darkContainer(
                                  width: 75,
                                  height: 75,
                                  shape: BoxShape.circle,
                                  hideShadow: true,
                                ),
                                const SizedBox(height: 6),
                                CustomText.pText(
                                  'category ["name"]!',
                                  size: 11,
                                  align: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText.qText(
              'Featured Pet to select',
              size: 20,
              weight: FontWeight.w700,
              color: const Color(0xFF1F2937),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomText.pText(
                    'Find your perfect companion',
                    size: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
                const Text('this is Text')
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/featured_img.png',
                              height: 192,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Image.asset(
                                'assets/images/featuredbtn.png',
                                width: 60,
                                height: 20,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText.qText(
                                  'Ornella',
                                  size: 17,
                                  weight: FontWeight.w700,
                                  color: const Color(0xFF2C3E50),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText.pText(
                                      'Female',
                                      size: 10,
                                      color: const Color(0xFF4E1C74),
                                      align: TextAlign.center,
                                    ),
                                    const SizedBox(width: 5),
                                    CustomText.pText(
                                      '1.5 years',
                                      size: 10,
                                      color: const Color(0xFFEE017C),
                                      align: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText.pText(
                                      'Queen, British Longhair',
                                      size: 12,
                                      color: const Color(0xFF4B5563),
                                      align: TextAlign.center,
                                    ),
                                  ],
                                ),
                                CustomText.pText(
                                  '\$1550.00',
                                  size: 16,
                                  color: const Color(0xFFEE017C),
                                  align: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFB45309),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                CustomText.pText(
                                  'Black Golden Shaded',
                                  size: 12,
                                  color: const Color(0xFF4B5563),
                                  align: TextAlign.center,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/viewdetails_btn.png',
                                    width: 90,
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomText.qText(
              'Pets Near You',
              size: 20,
              weight: FontWeight.w700,
              color: const Color(0xFF1F2937),
            ),
            Row(
              children: [
                CustomText.pText(
                  'Find your perfect match',
                  size: 12,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
            const SizedBox(height: 10),
            heightSpace100
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> categories = [
  {"image": "assets/images/cat1.png", "name": "Munchkin"},
  {"image": "assets/images/cat2.png", "name": "Ragdoll"},
  {"image": "assets/images/cat3.png", "name": "Persian"},
  {"image": "assets/images/cat4.png", "name": "Caracal"},
  {"image": "assets/images/cat5.png", "name": "British\nShorthair"},
];
