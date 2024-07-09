import 'package:flutter/material.dart';

class FindingScreen extends StatefulWidget {
  final void Function() onSearch;
  final TextEditingController searchTextController;
  const FindingScreen(
      {super.key, required this.onSearch, required this.searchTextController});

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
              decoration: const InputDecoration(
                labelText: "go to",
              ),
              textInputAction: TextInputAction.search,
            )),
            IconButton(
                onPressed: widget.onSearch, icon: const Icon(Icons.search)),
          ],
        ));
  }
}
