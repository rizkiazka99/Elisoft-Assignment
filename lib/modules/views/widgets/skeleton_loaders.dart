import 'package:elisoft_techincal_assignment/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class PlainSkeletonLoader extends StatelessWidget {
  const PlainSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      shimmerColor: Colors.white,
      borderRadius: BorderRadius.circular(8),
      shimmerDuration: 800,
      child: Container(
        height: 26,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(color: backgroundColorPrimary)
          ]
        ),
      ),
    );
  }
}

class SkeletonLoaderHorizontal extends StatelessWidget {
  const SkeletonLoaderHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 1.7,
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonAnimation(
            shimmerColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            shimmerDuration: 800,
            child: Container(
              height: 26,
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 4.5
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [BoxShadow(color: backgroundColorPrimary)]
              ),
            ),
          ),
          const SizedBox(height: 8),
          SkeletonAnimation(
            shimmerColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            shimmerDuration: 800,
            child: Container(
              height: MediaQuery.of(context).size.height / 4 - 34,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(color: backgroundColorPrimary)
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget skeletonBar(double height, double? width) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8), 
      color: skeletonBarColor
    )
  );
}

class SkeletonLoaderVertical extends StatelessWidget {
  const SkeletonLoaderVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.7,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          SkeletonAnimation(
            shimmerColor: Colors.white,
            shimmerDuration: 800,
            child: Container(
              height: MediaQuery.of(context).size.height / 3.7,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(color: backgroundColorPrimary)
                ]
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    skeletonBar(
                      MediaQuery.of(context).size.height / 10,
                      MediaQuery.of(context).size.width / 5
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: skeletonBar(
                        MediaQuery.of(context).size.height / 20,
                        MediaQuery.of(context).size.width / 1.5
                      )
                    )
                  ],
                ),
                const SizedBox(height: 8),
                skeletonBar(
                  MediaQuery.of(context).size.height / 10,
                  MediaQuery.of(context).size.width
                ),
                const SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3
                  ),
                  child: skeletonBar(
                    24, 
                    MediaQuery.of(context).size.width
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}