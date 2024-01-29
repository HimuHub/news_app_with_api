import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_with_api/controllers/home_controller.dart';
import 'package:news_app_with_api/models/headlinenewsmodel.dart';
import 'package:news_app_with_api/widget/trending_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
          elevation: 10.0,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'images/category_icon.png',
              height: 30,
              width: 30,
            ),
          ),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutter',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text(
                'News',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue),
              ),
            ],
          )),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return homeController.loading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Hottest News',
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text(
                              'see more',
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 350,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return TrendingNews(
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                                  tag: 'trending now',
                                  time: '2 days ago',
                                  title: 'djdjdjdjjdkjd',
                                  aurthor: 'ddd',
                                );
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('News for you',
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text(
                              'see more',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: Colors.amber,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text('Himu')
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: homeController.headlinesNewsData(),
      ),
    );
  }
}
