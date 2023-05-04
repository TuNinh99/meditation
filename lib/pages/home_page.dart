import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation/pages/choose_topic_page.dart';
import 'package:meditation/widgets/responsive_builder.dart';
import '../utils/themes.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: ResponsiveBuilder(
          potrait: Stack(
            children: [
              const GetStartedBackground(),
              const FractionallySizedBox(
                heightFactor: 0.35,
                child: GetStartedHeader(),
              ),
              Align(
                alignment: const Alignment(0.0, 0.8),
                child: GetStartedButton(
                  fixedSize: MaterialStateProperty.all(
                    Size(size.width * 0.9, size.height * 0.065),
                  ),
                  textStyle: MaterialStateProperty.all(
                    PrimaryFont.bold(size.height * 0.015),
                  ),
                ),
              )
            ],
          ),
          landscape: Row(
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    heightFactor: 0.7,
                    child: GetStartedHeader(),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    const GetStartedBackground(),
                    Align(
                      alignment: const Alignment(0.0, 0.8),
                      child: GetStartedButton(
                        fixedSize: MaterialStateProperty.all(
                          Size(size.width * 0.4, size.height * 0.065),
                        ),
                        textStyle: MaterialStateProperty.all(
                          PrimaryFont.bold(size.height * 0.015),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
    required this.fixedSize,
    required this.textStyle,
  });

  final MaterialStateProperty<Size> fixedSize;
  final MaterialStateProperty<TextStyle> textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('$ChooseTopicPage');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kColorLightGrey),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        fixedSize: fixedSize,
        textStyle: textStyle,
        foregroundColor: MaterialStateProperty.all(kColorDarkGrey),
      ),
      child: const Text(
        'GET STARTED',
      ),
    );
  }
}

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: context.orientation == Orientation.portrait ? 0.6 : 0.9,
        widthFactor: 1,
        child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.topCenter,
            child: SvgPicture.asset('assets/images/bg_get_started.svg')),
      ),
    );
  }
}

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
            flex: 2,
            fit: FlexFit.tight, //fix con se phai chiem het height cua cha
            child: SvgPicture.asset('assets/images/ic_logo.svg',
                alignment: const Alignment(0.0, -0.8))),
        Flexible(
          flex: 1,
          fit: FlexFit.tight, //f
          child: FittedBox(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Hi Afsar, Welcome\n',
                  style: PrimaryFont.black(30)
                      .copyWith(color: kColorLightYellow, height: 1.3),
                  children: [
                    TextSpan(
                      text: 'to Silent Moon',
                      style: PrimaryFont.medium(30)
                          .copyWith(color: kColorLightYellow),
                    )
                  ]),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight, //f
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Text(
                    'Explore the app, Find some peace of mind to\nprepare for meditation.',
                    style: PrimaryFont.light(16)
                        .copyWith(color: kColorLightGrey, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
