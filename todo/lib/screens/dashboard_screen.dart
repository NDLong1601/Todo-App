import 'package:flutter/material.dart';
import 'package:todo/components/app_boxshadow.dart';
import 'package:todo/components/app_text.dart';
import 'package:todo/components/app_textstyle.dart';
import 'package:todo/const/app_assets_path.dart';
import 'package:todo/const/app_color.dart';
import 'package:animated_analog_clock/animated_analog_clock.dart';
import 'package:todo/const/app_data.dart';
import 'package:todo/models/task.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _taskController = TextEditingController();
  String greeting = '';

  @override
  initState() {
    _taskController.text = 'Learn Flutter at 5 p.m';
    greeting = getGreeting();
    super.initState();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  void addTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thêm công việc mới'),
          content: TextField(
            controller: _taskController,
            decoration: const InputDecoration(
              hintText: 'Nhập tên công việc...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _taskController.clear();
                Navigator.pop(context);
              },
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_taskController.text.trim().isNotEmpty) {
                  setState(() {
                    AppData.tasks.add(Task(title: _taskController.text.trim()));
                  });
                  _taskController.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text('Thêm'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserInforWidget(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(title: greeting, style: AppTextstyle.boldTsSize12Black),
                SizedBox(width: 27),
              ],
            ),
            _buildAnalogClockWidget(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 27, bottom: 18, top: 21),
                child: AppText(
                  title: 'Tasks List',
                  style: AppTextstyle.boldTsSize18Black,
                ),
              ),
            ),
            _buildTasksListWidget(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildUserInforWidget({
    required double screenWidth,
    required double screenHeight,
  }) {
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: (307 / 812) * screenHeight,
          color: AppColors.lightBlue,
        ),
        Image.asset(AppAssetsPath.imgShape),
        Positioned(
          top: (133 / 812) * screenHeight,
          left: (screenWidth / 2) - 50,
          child: Container(
            width: (100 / 375) * screenWidth,
            height: (100 / 812) * screenHeight,
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
          top: (251 / 812) * screenHeight,
          left: (screenWidth / 2) - 90,
          child: AppText(
              title: 'Welcome, Oliva Grace',
              style: AppTextstyle.boldTsSize18White),
        ),
      ],
    );
  }

  Container _buildAnalogClockWidget({
    required double screenWidth,
    required double screenHeight,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: (120 / 812) * screenHeight,
      width: (120 / 375) * screenWidth,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          AppBoxShadow.custom(blurRadius: 4),
        ],
      ),
      child: AnimatedAnalogClock(
        location: 'Asia/Ho_Chi_Minh',
        size: (120 / 375) * screenWidth,
        backgroundColor: AppColors.white100,
        hourHandColor: AppColors.blue1,
        minuteHandColor: AppColors.blue2,
        secondHandColor: AppColors.gray1,
        centerDotColor: Color(0xFFEEEEEE),
        hourDashColor: Colors.lightBlue,
        minuteDashColor: Colors.white,
        dialType: DialType.values[2],
        numberColor: AppColors.blue1,
      ),
    );
  }

  Container _buildTasksListWidget(
      {required double screenWidth, required double screenHeight}) {
    return Container(
      height: (248 / 812) * screenHeight,
      width: screenWidth - 52,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          AppBoxShadow.custom(blurRadius: 15),
        ],
      ),
      padding: EdgeInsets.fromLTRB(21, 22, 24, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: 'Tasks List',
                style: AppTextstyle.regularTsSize14Black,
              ),
              GestureDetector(
                onTap: addTask,
                child: Image.asset(AppAssetsPath.icPlusCircle),
              ),
            ],
          ),
          Flexible(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              itemCount: AppData.tasks.length,
              itemBuilder: (context, index) {
                final task = AppData.tasks[index];
                final isCompleted = task.isCompleted;

                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          task.isCompleted = !isCompleted;
                        });
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color:
                              isCompleted ? Color(0xFF50C2C9) : AppColors.white,
                          border: Border.all(
                            color: isCompleted
                                ? Color(0xFF50C2C9)
                                : Color(0xFF2B8E94),
                            width: 1,
                          ),
                        ),
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        task.title,
                        style: AppTextstyle.regularTsSize12Black,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 18),
            ),
          ),
        ],
      ),
    );
  }
}
