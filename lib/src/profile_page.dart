import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/src/widgets/footer.dart';
import 'package:flutter_portfolio/src/widgets/navbar.dart';
import 'package:flutter_portfolio/src/widgets/works.dart';
import 'package:gap/gap.dart';
import 'package:rss_dart/dart_rss.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rss_dart/dart_rss.dart';

import 'package:http/http.dart' as http;

class ProfilePage extends StatelessWidget {
  final TextStyle sectionTitleStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );

  final TextStyle textStyle = const TextStyle(
    fontSize: 18,
    height: 1.5,
  );

  const ProfilePage({super.key});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ResponsiveNavbar(),
      drawer: ResponsiveDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Posts(),
            Works(),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(String label, String url, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: () => _launchURL(url),
        child: Text(label),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding:
          const EdgeInsets.only(left: 140, right: 140, top: 140, bottom: 70),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, I am John,\nCreative Technologist',
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.25,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://wallpapers.com/images/high/professional-profile-pictures-1080-x-1080-460wjhrkbwdcp1ig.webp',
                  width: 240,
                  height: 240,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 35),
      decoration: const BoxDecoration(color: Color.fromRGBO(233, 240, 248, 1)),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Recent posts',
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
          FutureBuilder<RssFeed>(
              future: fetchAndParseRssFeed(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var rssFeed = snapshot.data;
                  if (rssFeed == null) {
                    return const Text("No post");
                  } else {
                    return Wrap(
                        runSpacing: 16,
                        spacing: 16,
                        children: rssFeed.items
                            .map(
                              (item) => Post(
                                width: (size.width - 280) * 0.5 - 16,
                                item: item,
                              ),
                            )
                            .toList());
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }

  Future<RssFeed> fetchAndParseRssFeed() async {
    const String url =
        'https://medium.com/feed/@jemisgoti'; // Replace with your Medium username

    try {
      // Fetch the RSS feed
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the RSS feed
        return RssFeed.parse(response.body);
      } else {
        throw PlatformException(
            code:
                'Failed to load RSS feed. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw PlatformException(
          code: 'Error fetching or parsing the RSS feed: $e');
    }
  }
}

class Post extends StatelessWidget {
  const Post({super.key, required this.width, required this.item});
  final double width;
  final RssItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title ?? "",
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Gap(12),
              Row(
                children: [
                  Text(
                    item.pubDate?.toString().substring(0, 16) ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    ' | ${item.dc?.type ?? ""}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const Gap(12),
              Text(
                (RegExp(r'<p>(.*?)<\/p>', dotAll: true)
                        .firstMatch(item.content?.value ?? "")
                        ?.group(1) ??
                    ""),
                maxLines: 6,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
