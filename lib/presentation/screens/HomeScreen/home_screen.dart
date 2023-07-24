import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/logic/product_cubit/product_cubit.dart';
import 'package:internship_assignment/logic/product_cubit/product_state.dart';
import 'package:internship_assignment/presentation/screens/HomeScreen/widgets/categorylist_component.dart';
import 'package:internship_assignment/presentation/screens/HomeScreen/widgets/custom_app_bar_delegate.dart';
import 'package:internship_assignment/presentation/screens/HomeScreen/widgets/products_component.dart';
import 'package:internship_assignment/presentation/screens/HomeScreen/widgets/shopbylist_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final PageController _controller = PageController();

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
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                        child: Text(
                          'Buy Top Brands',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54),
                        ),
                      ),
                      const CategoryListComponent(),
                      SizedBox(
                        height: 180,
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: 4,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizedBox(
                            child: Image.asset(
                              'assets/Banners/banner$index.png',
                              height: 180,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                        child: Text(
                          'Shop By',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54),
                        ),
                      ),
                      const ShopByListComponent(),
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
                      ),
                      // const ProductsComponent(),
                      const ProductComponent(),
                      loadMore(),
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

  Widget loadMore() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(87, 30, 87, 80),
          child: GestureDetector(
            onTap: () => BlocProvider.of<ProductCubit>(context).loadMoreProducts(),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 1.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  state is ProductLoadingMoreState ? 'Loading...' : 'Load More',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 0,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
