import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/article_cards.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Welcome, ',
                        style: h3(fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'User',
                        style: h3(),
                      )
                    ],
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, total) {
                        return const ArticleCardHorizontal(
                          title: 'necessitatibus',
                          content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar posuere fringilla. Quisque iaculis magna nec ullamcorper lacinia. Nunc nec dui enim. Praesent neque nunc, vehicula nec scelerisque sed, hendrerit vitae erat. Suspendisse feugiat gravida pretium. Duis tellus neque, sodales nec accumsan et, placerat vel turpis. Fusce sit amet metus luctus, ultrices mi ut, commodo eros. Suspendisse non justo a risus rhoncus molestie sit amet ultrices risus. Nullam vehicula diam ut hendrerit rutrum. Suspendisse at ornare justo.',
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: List.generate(
                      5, 
                      (index) {
                        return ArticleCardVertical(
                          image: Image.asset(
                            'assets/images/placeholder.png',
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 5
                          ), 
                          title: 'Voluptatem dolor vero ad officiis dolorem itaque', 
                          content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pulvinar posuere fringilla. Quisque iaculis magna nec ullamcorper lacinia. Nunc nec dui enim.', 
                          postedAt: '08 April 2022, 08:34:55'
                        );
                      }
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
