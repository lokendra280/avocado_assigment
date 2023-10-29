import 'package:flutter/material.dart';
import 'package:video_app/common/app/theme.dart';
import 'package:video_app/features/dashboard/ui/pages/video_page.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller.addListener(() {
      selectTab = controller.index;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 175, 78, 1),
        title: const Text(
          "Video",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.share,
            color: Colors.white,
          ),
        ],
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight - 15,
              child: TabBar(
                controller: controller,
                indicatorColor: CustomTheme.primaryColor,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                isScrollable: true,
                labelColor: CustomTheme.black,
                tabs: const [
                  Tab(
                    text: "Trending",
                  ),
                  Tab(
                    text: "Trending",
                  ),
                  Tab(
                    text: "Trending feature",
                  ),
                  Tab(
                    text: "Trending",
                  ),
                  Tab(
                    text: "Trending",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  VideoPage(),
                  VideoPage(),
                  VideoPage(),
                  VideoPage(),
                  VideoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
