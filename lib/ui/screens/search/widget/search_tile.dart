import 'package:bright_life_providers/ui/widgets/custom_network_image.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    Key? key,
    required this.title,
    required this.description,
    required this.location,
    required this.rating,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  final String title;
  final String description;
  final String image;
  final String location;
  final double rating;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            CustomNetworkImage(
              url: image,
              height: 80,
              width: 80,
              border: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: MyColors.secondary,
                        ),
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: MyColors.grey,
                      ),
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 13,
                        color: MyColors.grey,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
