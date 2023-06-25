import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:flutter/material.dart';

class ArticleCardHorizontal extends StatelessWidget {
  final String title;
  final String content;

  const ArticleCardHorizontal({
    super.key, 
    required this.title, 
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 1.7,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 1),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: h4(color: primaryColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            content,
            style: h5(fontWeight: FontWeight.normal),
            textAlign: TextAlign.justify,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class ArticleCardVertical extends StatelessWidget {
  final Widget image;
  final String title;
  final String content;
  final String postedAt;

  const ArticleCardVertical({
    super.key, 
    required this.image, 
    required this.title, 
    required this.content, 
    required this.postedAt
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.7,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: backgroundColorPrimary)
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: image
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    title,
                    style: h5(fontWeight: FontWeight.normal),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width,
            child: Text(
              content,
              style: h5(fontWeight: FontWeight.normal),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 3
            ),
            child: Text(
              postedAt,
              style: h5(fontWeight: FontWeight.normal),
            )
          )
        ],
      ),
    );
  }
}