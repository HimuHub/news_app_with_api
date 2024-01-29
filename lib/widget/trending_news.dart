import 'package:flutter/material.dart';

class TrendingNews extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String aurthor;

  const TrendingNews(
      {super.key,
      required this.imageUrl,
      required this.tag,
      required this.time,
      required this.title,
      required this.aurthor});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(5),
          width: 280,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(imageUrl),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' $tag',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    '$time',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '$title',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.amber,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Himu')
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
