import 'package:cached_network_image/cached_network_image.dart';
import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:elisoft_techincal_assignment/core/font_sizes.dart';
import 'package:elisoft_techincal_assignment/core/helpers/date_formatter.dart';
import 'package:elisoft_techincal_assignment/data/api/repository.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/content/articles_cubit.dart';
import 'package:elisoft_techincal_assignment/modules/controllers/content/articles_state.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/article_cards.dart';
import 'package:elisoft_techincal_assignment/modules/views/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesCubit(
        repository: Repository()
      ),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<ArticlesCubit, ArticlesState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const LoadingScreen();
                } else if (state is ErrorState) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/error.avif',
                          width: 250,
                          height: 250,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Something went wrong',
                          style: h4(),
                        )
                      ],
                    ),
                  );
                } else if (state is LoadedState) {
                    final articles = state.articles.articles;

                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Row(
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
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context.read<ArticlesCubit>().logout();
                                    }, 
                                    child: const Icon(
                                      Icons.logout,
                                      color: contextRed,
                                    )
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 35),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: articles.map((article) {
                                  return ArticleCardHorizontal(
                                    title: article.title,
                                    content: article.content,
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Column(
                              children: List.generate(articles.length, (index) {
                                return ArticleCardVertical(
                                  image: articles[index].image != null || articles[index].image != '' ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height / 10,
                                    width: MediaQuery.of(context).size.width / 5,
                                    imageUrl: articles[index].image,
                                    fadeInDuration: const Duration(milliseconds: 300),
                                    errorWidget: ((context, url, error) => const Icon(Icons.error)),
                                    placeholder: (context, url) => const SpinKitRipple(
                                      color: primaryColor,
                                      size: 20
                                    ),
                                  ) : Image.asset(
                                    'assets/images/placeholder.png',
                                    height: MediaQuery.of(context).size.height / 10,
                                    width: MediaQuery.of(context).size.width / 5,
                                  ),
                                  title: articles[index].title,
                                  content: articles[index].content,
                                  postedAt: DateFormatter.monthNameExcluded(articles[index].created.date, 'id_ID')
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ),
        ),
      ),
    );
  }
}
