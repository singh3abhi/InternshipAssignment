import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/logic/cubits/searchModel_cubit/search_model_cubit.dart';
import 'package:internship_assignment/logic/cubits/searchModel_cubit/search_model_state.dart';
import 'package:internship_assignment/presentation/screens/SearchScreen/widgets/custom_app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const routeName = '/search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchModelCubit>(context).clearData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        key: scaffoldKey,
        drawer: const Drawer(
          child: Text('create drawer widget tree here'),
        ),
        appBar: CustomAppBar(scaffoldKey: scaffoldKey),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: GlobalVariables.primaryColor,
          shape: const CircleBorder(),
          child: const Center(
            child: Icon(
              Icons.arrow_circle_up,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<SearchModelCubit, SearchModelState>(
          builder: (context, state) {
            if (state is SearchModelInitialState) {
              return const SizedBox();
            }

            if (state is SearchModelLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SearchModelErrorState) {
              return const Center(
                child: Text('Some error has occured'),
              );
            }

            if (state is SearchModelLoadedState && state.makes.isEmpty && state.models.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No Results Found'),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Brand',
                      style: TextStyle(fontSize: 10.5, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    ListView.separated(
                      itemCount: state.makes.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        return Text(state.makes[index]);
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Mobile Model',
                      style: TextStyle(fontSize: 10.5, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    ListView.separated(
                      itemCount: state.models.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        return Text(state.models[index]);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
