import 'package:star_menu/star_menu.dart';
import 'package:flutter/material.dart';
import 'package:habits_home_screen/components/custom_appbar.dart';
import 'package:habits_home_screen/components/habit_status_icons.dart';
import 'package:habits_home_screen/components/habit_class.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final statusKey = GlobalKey();
  late List<List<HabitDetails>> habits_list = [
    [
      HabitDetails(
          'Go for a walk', 'Go to park at 8:00 AM', 1, Icons.directions_walk)
    ],
    [
      HabitDetails(
          'Go for a walk', 'Go to park at 8:00 AM', 1, Icons.directions_walk)
    ],
    [
      HabitDetails(
          'Go for a walk', 'Go to park at 8:00 AM', 1, Icons.directions_walk)
    ]
  ];

  List<Widget> status = [


    Container(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Done'),
          DoneIcon(onPressed: () {}),

        ],
      ),
    ),


    Container(
      width: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Pending'),
          PendingIcon(),
          SizedBox(width: 20,)
        ],
      ),
    ),

    Container(
      width: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Taken off'),
          NotDoneIcon(),
          SizedBox(width: 20,)
        ],
      ),
    ),
  ];

  //
  List<DateTime> completedDays = [DateTime(2023, 4, 14), DateTime(2023, 4, 13)];
  List<DateTime> notDoneDays = [DateTime(2023, 4, 15), DateTime(2023, 4, 16)];
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    StarMenuController centerStarMenuController = StarMenuController();

    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomAppBar(
          titleText: "Palash's habits",
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Today',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: habits_list.length,
                  separatorBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return Container(
                      padding: EdgeInsets.all(4),
                    );
                  },
                  itemBuilder: (
                    BuildContext context,
                    int cardIndex,
                  ) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 10),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12)),
                        child: ExpansionTile(
                          textColor: Colors.black,
                          iconColor: habits_list[cardIndex][0].get_color(),
                          collapsedIconColor:
                              habits_list[cardIndex][0].get_color(),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          leading: Container(
                            margin: EdgeInsets.only(left: 8),
                            height: double.infinity,
                            child: Icon(
                              habits_list[cardIndex][0].habit_icon,
                              size: 28,
                            ),
                          ),
                          title: Text(habits_list[cardIndex][0].habit_name),
                          subtitle:
                              Text(habits_list[cardIndex][0].habit_description),
                          trailing: (habits_list[cardIndex][0].status_icon == 1)
                              ? DoneIcon(
                                  onPressed: () =>
                                      centerStarMenuController.openMenu!(),
                                )
                              : (habits_list[cardIndex][0].status_icon == 2)
                                  ? PendingIcon()
                                  : NotDoneIcon(),
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: WeeklyDatePicker(
                                  doneDays: completedDays,
                                  notDoneDays: notDoneDays,
                                  selectedDay: _selectedDay,
                                  changeDay: (value) => (value) => setState(() {
                                        _selectedDay = value;
                                      }),
                                  selectedBackgroundColor: Colors.green,
                                  enableWeeknumberText: false,
                                  digitsColor: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Others',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: habits_list.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(4),
                    );
                  },
                  itemBuilder: (BuildContext context, int Index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 10),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12)),
                        child: ExpansionTile(
                          textColor: Colors.black,
                          iconColor: habits_list[Index][0].get_color(),
                          collapsedIconColor: habits_list[Index][0].get_color(),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          leading: Container(
                            margin: EdgeInsets.only(left: 8),
                            height: double.infinity,
                            child: Icon(
                              habits_list[Index][0].habit_icon,
                              size: 28,
                            ),
                          ),
                          title: Text(habits_list[Index][0].habit_name),
                          subtitle:
                              Text(habits_list[Index][0].habit_description),
                          trailing: (habits_list[Index][0].status_icon == 1)
                              ? StarMenu(
                                  params: StarMenuParameters(
                                    backgroundParams: BackgroundParams(
                                        sigmaX: 3,
                                        sigmaY: 3,
                                        backgroundColor: Colors.black54),
                                    shape: MenuShape.linear,
                                    linearShapeParams: LinearShapeParams(
                                      angle: 90,
                                      alignment: LinearAlignment.left,
                                      space: 15
                                    ),
                                    centerOffset: Offset(0, -70),
                                    openDurationMs: 150,
                                  ),
                                  items: status,
                                  child: DoneIcon(
                                    onPressed: () {},
                                  ),
                                )
                              : (habits_list[Index][0].status_icon == 2)
                                  ? PendingIcon()
                                  : NotDoneIcon(),
                          children: <Widget>[],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )));
  }
}
