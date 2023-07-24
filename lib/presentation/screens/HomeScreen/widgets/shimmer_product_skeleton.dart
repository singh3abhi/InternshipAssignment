import 'package:flutter/material.dart';
import 'package:internship_assignment/presentation/Commonwidgets/custom_shimmer_widget.dart';

class ShimmerProductSkeleton extends StatelessWidget {
  const ShimmerProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey.withOpacity(0.7),
                  Colors.grey.withOpacity(0.6),
                  Colors.grey.withOpacity(0.2),
                  Colors.grey.withOpacity(0.1),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: ShimmerWidget.rectangular(width: 100, height: 100, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
                const SizedBox(height: 20),
                ShimmerWidget.rectangular(width: 90, height: 20, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(width: 60, height: 20, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ShimmerWidget.rectangular(width: 60, height: 20, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(width: 60, height: 20, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ShimmerWidget.rectangular(width: 60, height: 20, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(width: 60, height: 20, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ShimmerWidget.rectangular(width: 60, height: 20, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
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
