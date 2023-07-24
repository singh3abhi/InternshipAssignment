import 'package:flutter/material.dart';
import 'package:internship_assignment/constants/global_variables.dart';

class ShopByListComponent extends StatelessWidget {
  const ShopByListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: Colors.white,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          const SizedBox(width: 15),
          Container(
            // height: 100,
            width: GlobalVariables.shopByCategoryList.length * (77 + 20) - 20,
            // color: Colors.grey.shade100.withOpacity(0.3),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade100.withOpacity(0.2),
                  Colors.grey.shade100.withOpacity(0.2),
                  Colors.white,
                ],
              ),
            ),
            child: ListView.separated(
              itemCount: GlobalVariables.shopByCategoryList.length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 67,
                    width: 77,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        GlobalVariables.shopByCategoryList[index].imageURL,
                        height: 50,
                        width: 45,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 60,
                    child: Text(
                      GlobalVariables.shopByCategoryList[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black87, letterSpacing: 0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
