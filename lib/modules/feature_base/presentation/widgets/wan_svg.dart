import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WanSvgData {

  const WanSvgData(
    this.path,
  );

  final String path;
}

class WanSvg extends StatelessWidget {
  const WanSvg(
    this.svg, {
    super.key,
    this.size,
    this.color,
    this.blendMode = BlendMode.srcIn,
  });

  final WanSvgData svg;

  final Size? size;

  final Color? color;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).iconTheme.color;

    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: SvgPicture.asset(
        _normalized(),
        width: size?.width,
        height: size?.height,
        colorFilter: iconColor != null && blendMode != null
            ? ColorFilter.mode(
                iconColor,
                blendMode!,
              )
            : null,
      ),
    );
  }

  String _normalized() {
    var path = svg.path;

    if (!path.toLowerCase().startsWith('assets/')) {
      path = 'assets/images/$path';
    }

    if (!path.toLowerCase().endsWith('.svg')) {
      path = '$path.svg';
    }

    return path;
  }
}
