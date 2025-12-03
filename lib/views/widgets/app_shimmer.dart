// import 'package:shimmer/shimmer.dart';
// import '../../utils/app_imports.dart';

// class AppShimmer extends StatelessWidget {
//   final Widget? child;
//   final EdgeInsetsGeometry? padding;
//   const AppShimmer({super.key, this.child, this.padding});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: grey[700]!,
//       highlightColor: grey[800]!,
//       child: SingleChildScrollView(
//         padding:
//             padding ??
//             EdgeInsets.symmetric(
//               horizontal: AppDimentions.defaultScreenPadding,
//             ),
//         child:
//             child ??
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 heightSpace10,

//                 /// Banner Shimmer
//                 ShimmerBox(height: 180, width: double.infinity, radius: 14),
//                 const SizedBox(height: 20),

//                 /// Title shimmer
//                 titleShimmer(),
//                 const SizedBox(height: 16),

//                 /// Horizontal List Shimmer
//                 SizedBox(
//                   height: 140,
//                   child: ListView.separated(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 5,
//                     separatorBuilder: (_, __) => const SizedBox(width: 8),
//                     itemBuilder: (_, __) =>
//                         ShimmerBox(height: 140, width: 120, radius: 12),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 /// Title shimmer
//                 titleShimmer(),
//                 const SizedBox(height: 16),

//                 /// Grid Shimmer (2-column)
//                 GridView.builder(
//                   itemCount: 4,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 1.3,
//                     mainAxisSpacing: 8,
//                     crossAxisSpacing: 8,
//                   ),
//                   itemBuilder: (_, __) => ShimmerBox(
//                     height: 150,
//                     width: double.infinity,
//                     radius: 12,
//                   ),
//                 ),

//                 const SizedBox(height: 30),
//               ],
//             ),
//       ),
//     );
//   }
// }

// Widget titleShimmer() {
//   return ShimmerBox(height: 18, width: 150);
// }

// Widget listtileShimmer() {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 12),
//     child: Row(
//       children: [
//         ShimmerBox(height: 70, width: 75),
//         widthSpace10,
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ShimmerBox(height: 12, width: Get.width * .4),
//               heightSpace8,
//               ShimmerBox(height: 8, width: Get.width),
//               heightSpace8,
//               ShimmerBox(height: 8, width: Get.width),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// class ShimmerBox extends StatelessWidget {
//   final double height;
//   final double width;
//   final double? radius;

//   const ShimmerBox({
//     super.key,
//     required this.height,
//     required this.width,
//     this.radius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         color: white,
//         borderRadius: BorderRadius.circular(
//           radius ?? AppDimentions.boxRadiusXS,
//         ),
//       ),
//     );
//   }
// }
