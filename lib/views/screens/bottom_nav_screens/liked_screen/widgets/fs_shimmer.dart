import 'package:pinkpawscat/utils/app_imports.dart';
import 'ls_card_widget.dart';

class FsShimmer extends StatelessWidget {
  const FsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        children: [
          GridView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .58),
            itemBuilder: (context, index) {
              return LsCardWidget(
                pet: PetModel(
                    id: 'id',
                    name: 'name',
                    price: 'price',
                    stock: 0,
                    stockStatus: 'stockStatus',
                    image: 'image',
                    color: 'color',
                    colorHex: '1f1f1f',
                    gender: 'gender',
                    age: 'age',
                    species: 'species',
                    description: 'description',
                    shortDescription: 'shortDescription',
                    attributes: {}),
              );
            },
          )
        ],
      ),
    );
  }
}
