import 'package:elisoft_techincal_assignment/modules/views/widgets/skeleton_loaders.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

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
                  const PlainSkeletonLoader(),
                  const SizedBox(height: 35),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, total) {
                        total = 5;
                        return const SkeletonLoaderHorizontal();
                      }
                    ),
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: List.generate(
                      5, 
                      (index) => const SkeletonLoaderVertical()
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