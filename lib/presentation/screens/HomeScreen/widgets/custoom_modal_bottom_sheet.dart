import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/logic/cubits/getFilters_cubit/get_filters_cubit.dart';
import 'package:internship_assignment/logic/cubits/getFilters_cubit/get_filters_state.dart';

class CustomModelBottomSheet extends StatelessWidget {
  const CustomModelBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      height: height * 0.9,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23),
                  topRight: Radius.circular(23),
                ),
              ),
              child: BlocBuilder<GetFiltersCubit, GetFiltersState>(builder: (context, state) {
                if (state is GetFiltersInitialState) {
                  return const SizedBox(height: 0, width: 0);
                }
                if (state is GetFiltersLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetFiltersErrorState) {
                  return Center(
                    child: Text('Some Error Has Occured : ${state.message}'),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Filters',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.7),
                                    wordSpacing: 0,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    bottom: 0, // Space between underline and text
                                  ),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.red,
                                        width: 1.5, // Underline thickness
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Clear Filter",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      height: 0,
                                      fontWeight: FontWeight.w500,
                                      wordSpacing: -1.5,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            ListView.separated(
                              itemCount: state.filtersData.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => const SizedBox(height: 15),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.filtersData[index].name,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.66),
                                        wordSpacing: 0,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    FilterItem(filters: state.filtersData[index].filterList),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 15),
                            const PriceComponent(),
                            const SizedBox(height: 200),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: GlobalVariables.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                              child: Text(
                            'APPLY',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.cancel_outlined,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.filters,
  });

  final List<String> filters;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      color: Colors.white,
      child: ListView.separated(
        itemCount: filters.length + 1,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return index == 0
              ? Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 213, 218),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Center(
                        child: Text(
                      'All',
                      style: TextStyle(
                        fontSize: 14,
                        wordSpacing: 0,
                        letterSpacing: 0,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Center(
                        child: Text(
                      filters[index - 1],
                      style: TextStyle(
                        fontSize: 14,
                        wordSpacing: 0,
                        letterSpacing: 0,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                  ),
                );
        },
      ),
    );
  }
}

class PriceComponent extends StatefulWidget {
  const PriceComponent({super.key});

  @override
  State<PriceComponent> createState() => _PriceComponentState();
}

class _PriceComponentState extends State<PriceComponent> {
  RangeValues _currentRangeValues = const RangeValues(0, 400000);
  late final TextEditingController _minController;
  late final TextEditingController _maxController;
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _minController = TextEditingController(text: _currentRangeValues.start.round().toString());
    _maxController = TextEditingController(text: _currentRangeValues.end.round().toString());
  }

  @override
  void dispose() {
    super.dispose();
    _minController.dispose();
    _maxController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.66),
            wordSpacing: 0,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 2),
        if (showError)
          const Text(
            'Maximum Price cannot be less than Minimum Price',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.red,
              wordSpacing: 0,
              letterSpacing: -0.5,
            ),
          ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Min',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.66),
                    wordSpacing: 0,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 85,
                  child: TextField(
                    controller: _minController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    cursorColor: GlobalVariables.primaryColor,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: GlobalVariables.primaryColor, width: 2),
                      ),
                    ),
                    onChanged: (minValue) {
                      setState(() {
                        if (int.parse(minValue) > _currentRangeValues.end.toInt()) {
                          // Show the error
                          showError = true;
                        } else {
                          showError = false;
                          _currentRangeValues = RangeValues(double.parse(minValue), _currentRangeValues.end);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Max',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.66),
                    wordSpacing: 0,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 85,
                  child: TextField(
                    controller: _maxController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: GlobalVariables.primaryColor, width: 2),
                      ),
                    ),
                    onChanged: (maxValue) {
                      setState(() {
                        if (maxValue.isEmpty) {
                        } else if (int.parse(maxValue) < _currentRangeValues.start.toInt()) {
                          // Show Error
                          showError = true;
                        } else {
                          showError = false;
                          _currentRangeValues = RangeValues(_currentRangeValues.start, double.parse(maxValue));
                        }
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 15),
        RangeSlider(
          values: _currentRangeValues,
          max: 400000,
          activeColor: GlobalVariables.primaryColor,
          inactiveColor: Colors.black12,
          divisions: 1000,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;

              if (_currentRangeValues.start > _currentRangeValues.end) {
                _currentRangeValues = RangeValues(
                  _currentRangeValues.end,
                  _currentRangeValues.end,
                );
              }

              _minController.text = _currentRangeValues.start.toInt().toString();
              _maxController.text = _currentRangeValues.end.toInt().toString();
            });
          },
        ),
      ],
    );
  }
}
