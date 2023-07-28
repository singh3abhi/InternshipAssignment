import 'package:flutter/material.dart';

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
            width: (8 + 1) * (77 + 10) - 10,
            color: Colors.grey.shade100.withOpacity(0.3),
            child: ListView.separated(
              itemCount: 8 + 1,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => Center(
                child: Container(
                  height: 67,
                  width: 77,
                  decoration: BoxDecoration(
                    color: index == 8 ? Colors.grey.shade400 : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: index == 8
                        ? const Text('Show all')
                        : Image.asset(
                            'assets/Categories/${index + 1}.png',
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
