import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:live_project_1/controller/page_controller/page_controller.dart';
import 'package:live_project_1/widgets/custom_appbar_widget.dart';

class HomeView extends GetView<PageControllers> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Positioned(
            top: 0.0,
            child: SizedBox(
              height: 800,
              width: MediaQuery.of(context).size.width,
              child: ColoredBox(
                color: Colors.black87.withOpacity(0.5),
                child: Image.asset(
                  'assets/logo1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: CustomAppBarWidget(
                controller: controller.pageController,
              ),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)
                  // borderRadius: BorderRadius.circular(20),
                  ),
            ),
          ),
          Align(
            alignment: const Alignment(0.7, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                HomePageCardWidget(),
                HomePageCardWidget(),
                HomePageCardWidget(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  color: Colors.red,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomePageCardWidget extends StatelessWidget {
  const HomePageCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Installation Service',
                  style: TextStyle(
                    color: Color(0xff353477),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset(
                    'assets/icons8-maintenance-96.png',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Expanded(
                child: Text(
                  'cjdbsdkkwdbiak  jcdghdchkwv,sc,vsimnds jsdbdjdbbwk, ',
                  style: TextStyle(fontSize: 18, color: Colors.grey
                      // overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 10),
                  child: Text(
                    'Read More',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        height: 250,
        width: 300,

        // color: Colors.white,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: const Color(0xffE1E1E1),
          ),
          // borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color(0xffE1E1E1),
              Color(0xffF4F4F4),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}
