import '../../../../../utils/app_imports.dart';

Widget odsCatCard() {
  return Card(
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
          child: Image.asset(
            'assets/images/featured_img.png',
            height: 192,
            width: double.infinity,
            fit: BoxFit.fill,
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
                  Expanded(
                    child: CustomText.pText(
                      'Black Golden Shaded',
                      size: 12,
                      color: const Color(0xFF4B5563),
                      align: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
