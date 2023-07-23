import 'package:flutter/material.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/presentation/widgets/appbar_header.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const routeName = '/search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 87,
          backgroundColor: GlobalVariables.primaryColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Column(
              children: [
                AppBarHeader(scaffoldKey: scaffoldKey),
                const SizedBox(height: 10),
                Container(
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
                )
              ],
            ),
          ),
        ),
        body: const Center(
          child: Text('Search Screen'),
        ),
      ),
    );
  }
}
