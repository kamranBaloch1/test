import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _img1 = "https://images.unsplash.com/photo-1537202108838-e7072bad1927?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5zdGl0dXRlfGVufDB8fDB8fHww";
  final String _img2 = "https://images.unsplash.com/photo-1561444654-6a5fb8dcb23d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  final String _img3 = "https://images.unsplash.com/photo-1622760061324-b479c8a2b203?q=80&w=2061&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  final String _img4 = "https://images.unsplash.com/photo-1543505298-b8be9b52a21a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(155.h),
        child: Stack(
          children: [
            AppBar(
              backgroundColor: const Color.fromARGB(255, 105, 107, 158),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22.r),
                  bottomRight: Radius.circular(22.r),
                ),
              ),
              centerTitle: true,
              title: const Text("Institutes"),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list_alt),
                  onPressed: () {},
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 63.h,
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: const Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 0.w,
                            minHeight: 0.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResultsDesign(imageUrl: _img1, text: "Edwird School"),
            ResultsDesign(imageUrl: _img2, text: "Kinder Garden"),
            ResultsDesign(imageUrl: _img3, text: "Xaviers Internationls"),
            ResultsDesign(imageUrl: _img4, text: "WillingTon Cambridge"),
          ],
        ),
      ),
    );
  }
}

class ResultsDesign extends StatelessWidget {
  final String imageUrl;
  final String text;

  const ResultsDesign({
    Key? key,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: Container(
        padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 40.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.w),
                CustomRow(
                  icon: Icons.location_pin,
                  text: "527 Statan NY 12483",
                ),
                SizedBox(height: 5.w),
                CustomRow(
                  icon: Icons.school,
                  text: "Higher Secondary School",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.red,
        ),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            color: const Color.fromARGB(255, 105, 107, 158),
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}