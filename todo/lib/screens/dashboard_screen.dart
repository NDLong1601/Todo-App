import 'package:flutter/material.dart';
import 'package:todo/const/app_assets_path.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final List<String> tasks = [
      'Cook Rice and Chicken at 10 a.m',
      'Learn Reactjs at 12 p.m',
      'Have Launch at 1 p.m',
      'Learn HTML and CSS at 3 p.m',
      'Have dinner at 7 p.m',
    ];
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 307,
                  color: Color(0xFF2B8E94),
                  // child: Image.asset(
                  //   AppAssetsPath.imgRectangle24,
                  //   // height: 307,
                  //   // width: 375,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Image.asset(AppAssetsPath.imgShape),
                Positioned(
                  top: 133,
                  left: (MediaQuery.of(context).size.width / 2) - 50,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF2B8E94),
                        width: 3,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        AppAssetsPath.imgAvatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 251,
                  left: (MediaQuery.of(context).size.width / 2) - 90,
                  child: Text('Welcome, Olivs Grace!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
                      )),
                ),
              ],
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(left: 244, right: 24),
              child: Text('Good Afternoon',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000).withValues(alpha: 0.75),
                  )),
            ),
            Text(
              isChecked ? 'You have 5 tasks today' : 'You have 3 tasks today',
            ),
            // Clock Image
            InkWell(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Container(
                margin: EdgeInsets.all(0),
                height: 120,
                width: 120,
                child: Image.asset(AppAssetsPath.imgClock),
              ),
            ),

            SizedBox(height: 21),
            Container(
              margin: EdgeInsets.only(left: 27, right: 251),
              child: Text('Tasks List',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000).withValues(alpha: 0.75),
                  )),
            ),

            SizedBox(height: 20),
            SizedBox(
              height: 248,
              width: 323,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withValues(alpha: 0.25),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 21, top: 26),
                          child: Text('Tasks List',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    Color(0xFF000000).withValues(alpha: 0.75),
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 190, top: 22),
                            child: Image.asset(AppAssetsPath.icPlusCircle)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        // scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 8),
                              Container(
                                width: 17,
                                height: 17,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Color(0xFF2B8E94),
                                    width: 2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              // Checkbox(
                              //   value: false,
                              //   onChanged: (bool? value) {},
                              //   visualDensity: VisualDensity.compact,
                              // ),
                              Expanded(
                                child: Text(
                                  tasks[index],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 18);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
