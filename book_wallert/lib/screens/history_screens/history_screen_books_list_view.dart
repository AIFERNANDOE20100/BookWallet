import 'package:book_wallert/colors.dart';
import 'package:book_wallert/controllers/history_controller.dart';
import 'package:book_wallert/widgets/cards/book_cards/book_card.dart';
import 'package:book_wallert/widgets/progress_indicators.dart';
import 'package:flutter/material.dart';

class HistoryListViewBooks extends StatefulWidget {
  final int userId;

  const HistoryListViewBooks({
    super.key,
    required this.userId,
  });

  @override
  State<HistoryListViewBooks> createState() => _HistoryListViewBooksState();
}

class _HistoryListViewBooksState extends State<HistoryListViewBooks> {
  late HistoryController _historyController;
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _historyController = HistoryController(widget.userId);
    _fetchMoreData();

    // Add listener to scroll controller for infinite scrolling
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchMoreData() async {
    setState(() {
      _isLoading = true;
    });

    await _historyController.fetchBooks((updatedBooks) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: _isLoading && _historyController.historyBooks.isEmpty
          ? Center(child: buildProgressIndicator())
          : _historyController.historyBooks.isEmpty
              ? const Center(
                  child: Text('No books',
                      style: TextStyle(color: MyColors.textColor)))
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: _historyController.historyBooks.length +
                      (_isLoading ? 1 : 0), // Add an extra item if loading
                  itemBuilder: (context, index) {
                    if (index < _historyController.historyBooks.length) {
                      return Column(
                        children: [
                          const SizedBox(height: 3),
                          BookCard(
                              book: _historyController.historyBooks[index]),
                        ],
                      );
                    } else {
                      return buildProgressIndicator(); // Show loading indicator when more data is being fetched
                    }
                  },
                ),
    );
  }
}
