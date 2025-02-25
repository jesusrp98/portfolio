import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:portfolio/home/widgets/contact_button.dart';
import 'package:portfolio/home/widgets/home_card.dart';
import 'package:portfolio/utils/personal_info.dart';
import 'package:portfolio/utils/portfolio_urls.dart';
import 'package:portfolio/widgets/star_clipper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final axis = context.layout.value(
      md: Axis.horizontal,
      xs: Axis.vertical,
    );

    final titleTextStyle = Theme.of(context).textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w500,
        );

    final descriptionTextStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            );

    final body = Column(
      crossAxisAlignment: axis == Axis.horizontal
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      spacing: GridSpacing.s16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: axis == Axis.horizontal
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          'Greetings!',
                          style: titleTextStyle,
                          maxLines: 1,
                        ),
                      ),
                      GridSpacing.gap16,
                      Icon(
                        Symbols.waving_hand_rounded,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: titleTextStyle?.fontSize,
                        fill: 1,
                      ),
                    ],
                  ),
                  AutoSizeText(
                    "I'm ${PersonalInfo.name}",
                    style: titleTextStyle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        AutoSizeText.rich(
          PersonalInfo.description1,
          style: descriptionTextStyle,
          textAlign: axis == Axis.vertical ? TextAlign.center : null,
          maxLines: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (axis == Axis.horizontal)
              Text("Let's have a chat!", style: descriptionTextStyle),
            Expanded(
              child: Flex(
                spacing:
                    axis == Axis.horizontal ? GridSpacing.s12 : GridSpacing.s16,
                mainAxisAlignment: MainAxisAlignment.end,
                direction: axis,
                children: [
                  ContactButton(
                    label: 'Email',
                    style: descriptionTextStyle,
                    onPressed: () => launchUrlString(PortfolioUrls.email),
                    expand: axis == Axis.vertical,
                  ),
                  ContactButton(
                    label: 'LinkedIn',
                    style: descriptionTextStyle,
                    onPressed: () => launchUrlString(PortfolioUrls.linkedIn),
                    expand: axis == Axis.vertical,
                  ),
                  ContactButton(
                    label: 'GitHub',
                    style: descriptionTextStyle,
                    onPressed: () => launchUrlString(PortfolioUrls.gitHub),
                    expand: axis == Axis.vertical,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

    return HomeCard(
      padding: HomeCard.defaultPadding.copyWith(
        right: axis == Axis.horizontal ? GridSpacing.s72 : null,
      ),
      shape: axis == Axis.horizontal ? const StadiumBorder() : null,
      child: Flex(
        direction: axis,
        spacing: axis == Axis.horizontal ? GridSpacing.s32 : GridSpacing.s16,
        children: [
          const _RotatingProfileImage(),
          if (axis == Axis.vertical) body else Expanded(child: body),
        ],
      ),
    );
  }
}

class _RotatingProfileImage extends StatefulWidget {
  const _RotatingProfileImage();

  @override
  State<StatefulWidget> createState() => _RotatingProfileImageState();
}

class _RotatingProfileImageState extends State<_RotatingProfileImage>
    with SingleTickerProviderStateMixin {
  static const animationDuration = Duration(seconds: 24);

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: animationDuration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final headerImageHeight =
        context.layout.value<double>(xs: 197, md: 256);

    return AnimatedBuilder(
      animation: _controller,
      child: Image.asset(
        'assets/images/profile.jpg',
        height: headerImageHeight,
      ),
      builder: (context, child) {
        final clipper = StarClipper(
          rotation: _controller.value,
          innerRadiusRatio: .9,
          cornerRadius: 16,
          points: 16,
        );

        return CustomPaint(
          foregroundPainter: StarBorderPainter(
            borderColor: Theme.of(context).colorScheme.secondary,
            clipper: clipper,
            borderWidth: 8,
          ),
          child: ClipPath(
            clipper: clipper,
            child: child,
          ),
        );
      },
    );
  }
}
