import 'package:flutter/material.dart';
import 'package:internship_assignment/constants/global_variables.dart';

class CategoryListComponent extends StatelessWidget {
  const CategoryListComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.white,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          const SizedBox(width: 15),
          Container(
            height: 75,
            width: (GlobalVariables.brandCategoryImages.length + 1) * (77 + 10) - 10,
            color: Colors.grey.shade100.withOpacity(0.3),
            child: ListView.separated(
              itemCount: GlobalVariables.brandCategoryImages.length + 1,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => Center(
                child: Container(
                  height: 67,
                  width: 77,
                  decoration: BoxDecoration(
                    color: index == GlobalVariables.brandCategoryImages.length ? Colors.grey.shade400 : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: index == GlobalVariables.brandCategoryImages.length
                        ? const Text('Show all')
                        : Image.asset(
                            GlobalVariables.brandCategoryImages[index],
                            height: 70,
                            width: 50,
                          ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
