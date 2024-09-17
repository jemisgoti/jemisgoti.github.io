import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Works extends StatelessWidget {
  const Works({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 35),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Featured works',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Text(
                'View all',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Gap(24),
          ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) => Work(
              width: (size.width - 280) * 1,
            ),
            separatorBuilder: (context, index) => const Divider(
              height: 48,
            ),
          )
        ],
      ),
    );
  }
}

class Work extends StatelessWidget {
  const Work({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://wallpapers.com/images/high/a-focused-software-developer-at-work-xywmf50d3g3qxr3r.webp',
                width: 160,
                height: 120,
                fit: BoxFit.cover,
              ),
              const Gap(24),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Designing Dashboards',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Gap(12),
                    Row(
                      children: [
                        Chip(label: Text('2020')),
                        Text(
                          ' | Illustration',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Gap(12),
                    Text(
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
