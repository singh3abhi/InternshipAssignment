import 'package:flutter/material.dart';

import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/presentation/screens/search_screen.dart';
import 'package:internship_assignment/presentation/widgets/appbar_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        key: scaffoldKey,
        drawer: const Drawer(
          child: Text('create drawer widget tree here'),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            if (notification.leading) {
              notification.paintOffset = 45;
            }
            return true;
          },
          child: RefreshIndicator(
            color: GlobalVariables.primaryColor,
            backgroundColor: GlobalVariables.backgroundColor,
            onRefresh: () => Future(() => null),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: CustomAppBarDelegate(scaffoldKey),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                        child: Text(
                          'Buy Top Brands',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black54),
                        ),
                      ),
                      const CategoryList(),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                        child: Text(
                          'Shop By',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black54),
                        ),
                      ),
                      const ShopByList(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
                        child: Row(
                          children: [
                            const Text(
                              'Best Deals Near You',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black54),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.only(
                                bottom: 0, // Space between underline and text
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.amber,
                                    width: 1.5, // Underline thickness
                                  ),
                                ),
                              ),
                              child: const Text(
                                "India",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 20,
                                  height: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomAppBarDelegate(this.scaffoldKey, [this.height = 87]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 87,
      backgroundColor: GlobalVariables.primaryColor,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          children: [
            AppBarHeader(scaffoldKey: scaffoldKey),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, SearchScreen.routeName),
              child: Container(
                height: 35,
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(Icons.search),
                      SizedBox(width: 8),
                      Text(
                        'Search with make and model..',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class CategoryList extends StatelessWidget {
  const CategoryList({
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
          const SizedBox(width: 20),
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

class ShopByList extends StatelessWidget {
  const ShopByList({super.key});

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
          const SizedBox(width: 20),
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
