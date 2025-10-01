import 'package:flutter/material.dart';
import 'package:pinkpawscat/utils/custom_text.dart';

class CartItemView extends StatefulWidget {
  const CartItemView({super.key});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {

  final customText = CustomText();

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
                    customText.kText('Emir', 17, FontWeight.w700,
                        const Color(0xFF2C3E50), TextAlign.start),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Image.asset('assets/images/location.png',
                        width: 8,
                          height: 10,
                        ),
                        const SizedBox(width: 5,),
                        customText.kPText(
                          '2.5 km',
                          10,
                          FontWeight.w500,
                          const Color(0xFF4E1C74),
                          TextAlign.center,
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
                        customText.kPText(
                          'King, British Shorthair',
                          12,
                          FontWeight.w500,
                          const Color(0xFF4B5563),
                          TextAlign.center,
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
                    customText.kPText(
                      'Black Golden Shaded',
                      12,
                      FontWeight.w500,
                      const Color(0xFF4B5563),
                      TextAlign.center,
                    ),
                    const Spacer(),

                    customText.kPText(
                      'Details',
                      16,
                      FontWeight.w500,
                      const Color(0xFFEE017C),
                      TextAlign.center,
                    ),
                  ],
                ),


                Row(
                  children: [
                    customText.kPText(
                      '\$1550.00',
                      16,
                      FontWeight.w500,
                      const Color(0xFFEE017C),
                      TextAlign.center,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/addto.png',
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
    );
  }
}
