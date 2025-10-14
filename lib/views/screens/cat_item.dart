import '../../utils/app_imports.dart';

class CartItemView extends StatefulWidget {
  const CartItemView({super.key});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  @override
  Widget build(BuildContext context) {
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
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/featured_img.png',
                  height: 150,
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
                      child: Image.asset(
                        'assets/images/fav.png',
                        width: 10,
                        height: 10,
                      )),
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
                      'Emir',
                      size: 17,
                      weight: FontWeight.w700,
                      color: const Color(0xFF2C3E50),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/location.png',
                          width: 8,
                          height: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText.pText(
                          '2.5 km',
                          size: 10,
                          color: const Color(0xFF4E1C74),
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
                          'King, British Shorthair',
                          size: 12,
                          color: const Color(0xFF4B5563),
                          align: TextAlign.center,
                        ),
                      ],
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
                    CustomText.pText(
                      'Details',
                      size: 16,
                      color: const Color(0xFFEE017C),
                      align: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText.pText(
                      '\$1550.00',
                      size: 16,
                      color: const Color(0xFFEE017C),
                      align: TextAlign.center,
                    ),
                    const Spacer(),
                    AppButton(
                      onTap: () => AppToast.show('Coming soon!'),
                      text: 'Add To Cart',
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
}
