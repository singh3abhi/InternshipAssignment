import 'package:flutter/material.dart';
import 'package:internship_assignment/constants/global_variables.dart';

class BannerComponent extends StatefulWidget {
  const BannerComponent({super.key});

  @override
  State<BannerComponent> createState() => _BannerComponentState();
}

class _BannerComponentState extends State<BannerComponent> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      child: PageView.builder(
        controller: _controller,
        itemCount: 4,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final width = MediaQuery.of(context).size.width;

          if (index == 0) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 92, 128, 156),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/Banners/banner$index.png',
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 0,
                  right: width * 0.48,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      height: 100,
                      width: width * 0.43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color.fromARGB(255, 95, 101, 123),
                            Color.fromARGB(255, 30, 33, 49),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sell your phone in\nfew steps',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                wordSpacing: 0,
                                letterSpacing: 0,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade500,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Buy Now >',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.48,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      height: 100,
                      width: width * 0.43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color.fromARGB(255, 254, 255, 255),
                            Color.fromARGB(255, 212, 214, 226),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Buy your dream\nphone in few steps',
                              style: TextStyle(
                                color: GlobalVariables.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                wordSpacing: 0,
                                letterSpacing: 0,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: GlobalVariables.primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Buy Now >',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox(
            child: Image.asset(
              'assets/Banners/banner$index.png',
              height: 180,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
