import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation/data/model/topic.dart';
import 'package:meditation/data/topic_storage.dart';
import 'package:meditation/widgets/responsive_builder.dart';

import '../utils/themes.dart';

final topicStoreage = AssetTopicStorage();

class ChooseTopicPage extends StatelessWidget {
  const ChooseTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          potrait: Column(
            children: const [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: _Header(),
              ),
              Flexible(flex: 3, child: _TopicGird())
            ],
          ),
          landscape: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  children: const [
                    Expanded(
                      child: _Header(),
                    ),
                    Spacer()
                  ],
                ),
              ),
              const Flexible(flex: 2, child: _TopicGird())
            ],
          ),
        ),
      ),
    );
  }
}

class _TopicGird extends StatelessWidget {
  const _TopicGird({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: topicStoreage.load(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final topics = snapshot.data!;
        return MasonryGridView.count(
          crossAxisCount: 2,
          itemCount: topics.length,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final topic = topics[index];
            return DecoratedBox(
              decoration: BoxDecoration(
                  color: topic.bgColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SvgPicture.asset(
                        topic.thumbnail,
                        width: constraints.maxWidth,
                      );
                    },
                  ),
                  // Text(topics[index].title),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 3,
          ),
          Flexible(
            flex: 3,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: 'What Brings you\n',
                  style: PrimaryFont.black(28)
                      .copyWith(color: Colors.black, height: 1.35),
                  children: [
                    TextSpan(
                      text: 'to Silent Moon?',
                      style: PrimaryFont.light(28)
                          .copyWith(color: Colors.black, height: 1.35),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            flex: 1,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                'choose a topic to focuse on:',
                style: PrimaryFont.light(20),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
