import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_assignment/logic/cubits/searchModel_cubit/search_model_cubit.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isVisible = true;
  late final FocusNode _focusNode;
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      style: const TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.w400),
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(minWidth: 41, maxHeight: 30),
        suffixIconConstraints: const BoxConstraints(minWidth: 41, maxHeight: 30),
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.white, width: 5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.white, width: 5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.white, width: 5),
        ),
        hintText: 'Search with make and model..',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black87,
          fontSize: 13,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
        prefixIcon: _isVisible
            ? const Icon(
                Icons.search,
                size: 25,
                color: Colors.black54,
              )
            : null,
        suffixIcon: !_isVisible
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.clear();
                    _isVisible = true;
                  });
                },
                child: const Icon(
                  Icons.clear,
                  color: Colors.black87,
                  size: 22,
                ),
              )
            : null,
      ),
      onChanged: (value) {
        setState(() {
          if (value.isEmpty) {
            _isVisible = true;
          } else {
            _isVisible = false;
          }
        });

        BlocProvider.of<SearchModelCubit>(context).loadData(value);
      },
    );
  }
}
