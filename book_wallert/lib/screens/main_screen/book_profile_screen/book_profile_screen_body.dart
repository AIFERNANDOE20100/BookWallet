import 'package:book_wallert/screens/main_screen/book_profile_screen/book_profile_screen_details.dart';
import 'package:book_wallert/screens/main_screen/book_profile_screen/book_profile_screen_list_view.dart';
import 'package:flutter/material.dart';
import 'package:book_wallert/colors.dart';
import 'package:book_wallert/widgets/buttons/selection_bar.dart';

class BookProfileScreenBody extends StatefulWidget {
  const BookProfileScreenBody({super.key});

  @override
  State<BookProfileScreenBody> createState() {
    // returns a screen as state
    return _BookProfileScreenBodyState();
  }
}

class _BookProfileScreenBodyState extends State<BookProfileScreenBody>
    with SingleTickerProviderStateMixin {
  // ''with ticker'' is to make sure connnection between clicking and swiping
  late TabController _tabController;

  // add name to buttons on panel
  final List<String> _tabNames = [
    'Reviews',
    'Locations',
    'Read Online',
  ];

  @override
  void initState() {
    // Tab controller
    super.initState();
    _tabController = TabController(
        length: _tabNames.length,
        vsync: this); // animation details are mentioned here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Column(
        children: [
          const BookProfileScreenDetails(),
          SelectionBar(tabController: _tabController, tabNames: _tabNames),
          Expanded(
            child: TabBarView(
              // adding corresponding screens to each button on SelectionBar.
              controller: _tabController,
              children: [
                BookProfileScreenListView(screenName: 'Reviews'), // Reviews
                BookProfileScreenListView(screenName: 'Locations'), // Locations
                BookProfileScreenListView(
                    screenName: 'Read Online'), // Read Online
              ],
            ),
          ),
        ],
      ),
    );
  }
}
