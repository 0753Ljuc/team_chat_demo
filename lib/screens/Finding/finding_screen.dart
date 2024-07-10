import 'package:flutter/material.dart';

class FindingScreen extends StatefulWidget {
  final TextEditingController searchTextController;
  final void Function()? onSearch;
  final void Function(String)? onChanged;
  String? errorText;

  FindingScreen(
      {super.key,
      required this.searchTextController,
      required this.onSearch,
      this.errorText,
      this.onChanged});

  @override
  State<FindingScreen> createState() => _FindingScreen();
}

class _FindingScreen extends State<FindingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: widget.searchTextController,
              autofocus: true,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                  labelText: "go to", errorText: widget.errorText),
              textInputAction: TextInputAction.search,
            )),
            IconButton(
                onPressed: widget.onSearch, icon: const Icon(Icons.search)),
          ],
        ));
  }
}
