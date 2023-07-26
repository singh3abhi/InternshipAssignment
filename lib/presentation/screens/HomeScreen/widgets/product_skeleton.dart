import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internship_assignment/data/models/getListings/product_item_model.dart';
import 'package:internship_assignment/logic/services/formatter.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({
    super.key,
    required this.item,
  });
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: item.images![1].fullImage!,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const Center(child: SizedBox()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          maxWidthDiskCache: 150,
                          maxHeightDiskCache: 150,
                        ),
                        // child: CachedNetworkImage(
                        //   imageUrl: item.images![1].fullImage!,
                        //   placeholder: (context, url) => const Center(child: SizedBox()),
                        //   errorWidget: (context, url, error) => const Icon(Icons.error),
                        //   maxWidthDiskCache: 150,
                        //   maxHeightDiskCache: 150,
                        //   fadeInDuration: Duration.zero,
                        //   fadeOutDuration: Duration.zero,
                        //   fit: BoxFit.contain,
                        //   height: 100,
                        //   width: 100,
                        // ),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 2,
                    top: 6,
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Text(
              '₹ ${Formatter.formatPrice(item.listingNumPrice!)}',
              style: const TextStyle(
                fontSize: 16.5,
                height: 0,
                fontWeight: FontWeight.w600,
                wordSpacing: 0,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              item.model!,
              style: TextStyle(
                fontSize: 12,
                height: 0,
                wordSpacing: 0,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.deviceStorage!,
                  style: TextStyle(
                    fontSize: 9.5,
                    wordSpacing: 0,
                    letterSpacing: 0,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Condition: ${item.deviceCondition}',
                  style: TextStyle(
                    fontSize: 9.5,
                    wordSpacing: 0,
                    letterSpacing: 0,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.listingLocation!,
                  style: TextStyle(
                    fontSize: 9.5,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                    wordSpacing: 0,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  Formatter.formatDate(item.listingDate!),
                  style: TextStyle(
                    fontSize: 9.5,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                    wordSpacing: 0,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
