// group_card_trending.dart

import 'package:book_wallert/functions/global_navigator_functions.dart';
import 'package:book_wallert/screens/main_screen/group_profile_screen/group_profile_screen_body.dart';
import 'package:book_wallert/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:book_wallert/colors.dart';
import 'package:book_wallert/models/group_model.dart';

class GroupCardTrending extends StatelessWidget {
  final int rank;
  final GroupModel group;

  const GroupCardTrending({
    super.key,
    required this.rank,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to GroupProfileScreenBody when the card is tapped
        screenChange(context, const GroupProfileScreenBody());
      },
      child: Card(
        color: MyColors.panelColor, // Card background color
        margin: const EdgeInsets.all(5), // Margin around the card
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Padding inside the card
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .start, // Align items at the start horizontally
            children: [
              Padding(
                padding:
                    const EdgeInsets.all(8.0), // Padding around the rank text
                child: Text('$rank',
                    style: const TextStyle(
                      color: MyColors.textColor, // Text color
                      fontSize: 20, // Font size
                      fontWeight: FontWeight.bold, // Bold font weight
                    )),
              ),
              const SizedBox(width: 10), // Add space between rank and avatar
              // CircleAvatar widget to display the group image
              CircleAvatar(
                backgroundImage: AssetImage(
                  group.imageUrl, // Use imageUrl from the group object
                ),
                radius: 25,
              ),
              const SizedBox(width: 10), // Add space between avatar and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align text at the start horizontally
                  children: [
                    // Display the group name
                    Text(
                      group.name,
                      style: const TextStyle(
                        color: MyColors.textColor, // Text color
                        fontSize: 16, // Font size
                        fontWeight: FontWeight.bold, // Bold font weight
                      ),
                    ),
                    const SizedBox(height: 5), // Add space between texts
                    // Display member count and discussion count in a row
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // Space between texts
                      children: [
                        Text(
                          'Members: ${group.memberCount}', // Use memberCount from the group object
                          style: const TextStyle(color: MyColors.text2Color),
                        ),
                        Text(
                          'Discussions: ${group.discussionCount}', // Use discussionCount from the group object
                          style: const TextStyle(color: MyColors.text2Color),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4), // Add space at the bottom
                    Row(
                      children: [
                        CustomToggleButton(
                          beforeText:
                              'Send Request', // Button text before toggle
                          afterText: 'Requested', // Button text after toggle
                          press: () {
                            // Add your onPressed functionality here
                          },
                          verticalalSpace:
                              10, // Vertical space around the button text
                          horizontalSpace:
                              15, // Horizontal space around the button text
                          textSize: 12, // Button text size
                        ),
                        const SizedBox(width: 15), // Add space between buttons
                        // const Expanded(
                        //   // child: Text(
                        //   //   'Suggested By: Ravindu Pathirage and ...',
                        //   //   style: TextStyle(
                        //   //       color: MyColors.text2Color, fontSize: 12),
                        //   //   overflow: TextOverflow.ellipsis,
                        //   // ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
