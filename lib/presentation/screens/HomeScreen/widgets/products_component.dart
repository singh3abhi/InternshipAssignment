import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_assignment/logic/product_cubit/product_cubit.dart';
import 'package:internship_assignment/logic/product_cubit/product_state.dart';
import 'package:internship_assignment/presentation/screens/HomeScreen/widgets/product_skeleton.dart';
import 'package:internship_assignment/presentation/screens/HomeScreen/widgets/shimmer_product_skeleton.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            color: Colors.grey.shade100.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: state.products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 240,
                ),
                itemBuilder: (context, index) {
                  if (state is ProductLoadingState && state.products.isEmpty || state is ProductErrorState && state.products.isEmpty) {
                    return const ShimmerProductSkeleton();
                  }

                  return ProductSkeleton(item: state.products[index]);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
