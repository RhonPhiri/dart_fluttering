import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipe_app/data/models/recipe.dart';
import 'package:recipe_app/ui/core/theme/colors.dart';
import 'package:recipe_app/ui/core/widgets/common.dart';
import 'package:recipe_app/ui/core/widgets/custom_dropdown.dart';

enum ListType { all, bookmarks }

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  //TODO: add search index key

  ListType currentType = ListType.all;
  late ScrollController _scrollController;
  late TextEditingController _searchTextController;
  List<Recipe> currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];
  bool newDataRequired = true;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(() {});
    _searchTextController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    // TODO Save Current Index
  }

  void getPreviousSearches() async {
    // TODO Get Current Index
  }

  @override
  Widget build(BuildContext context) {
    return switch (currentType) {
      ListType.all => buildRecipeList(),
      ListType.bookmarks => buildBookmarkList(),
    };
  }

  Widget buildRecipeList() {
    return buildScrollList([
      _buildHeader(),
      _buildTypePicker(),
      _buildSearchCard(),
    ], SliverFillRemaining(child: Placeholder()));
  }

  Widget buildScrollList(List<Widget> topList, Widget bottomWidget) {
    return Column(
      children: [
        ...topList,
        ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            physics: ClampingScrollPhysics(),
          ),
          child: Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(padding: allPadding8, sliver: bottomWidget),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBookmarkList() {
    return buildScrollList(
      [_buildHeader(), _buildTypePicker()],
      SliverFillRemaining(
        child: Placeholder(child: Center(child: Text("Bookmarks"))),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 160.0,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Container(decoration: BoxDecoration(color: lightGreen)),
            Center(
              child: Image.asset(
                "assets/images/background2.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SegmentedButton<ListType>(
        segments: [
          ButtonSegment<ListType>(
            value: ListType.all,
            label: Text("All"),
            enabled: true,
          ),
          ButtonSegment<ListType>(
            value: ListType.bookmarks,
            label: Text("Bookmarks"),
            enabled: true,
          ),
        ],
        selected: {currentType},
        onSelectionChanged: (p0) => setState(() {
          currentType = p0.first;
        }),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                startSearch(_searchTextController.text);
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              icon: Icon(Icons.search),
            ),
            sizedW8,
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        startSearch(_searchTextController.text);
                      },
                      controller: _searchTextController,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        setState(() => _searchTextController.text = ""),
                    icon: Icon(Icons.clear),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onSelected: (value) {
                      _searchTextController.text = value;
                      startSearch(_searchTextController.text);
                    },
                    itemBuilder: (context) => previousSearches
                        .map<CustomDropdownMenuItem<String>>(
                          (String value) => CustomDropdownMenuItem<String>(
                            value: value,
                            text: value,
                            callback: () {
                              setState(() {
                                previousSearches.remove(value);
                                savePreviousSearches();
                                Navigator.pop(context);
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startSearch(String value) {
    setState(() {
      currentSearchList.clear();
      newDataRequired = true;
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = false;
      value = value.trim();
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        savePreviousSearches();
      }
    });
  }
}
