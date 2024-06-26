
import 'package:cached_network_image/cached_network_image.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      this.image,
      {this.width = 100,
        this.height = 100,
        this.bgColor,
        this.borderWidth = 0,
        this.borderColor,
        this.trBackground = false,
        this.fit = BoxFit.fill,
        this.isNetwork = true,
        this.radius = 6,
        this.borderRadius,
        this.isShadow = true,
        this.shape = false,
        this.horizontal = 0,
        this.vertical = 0,

      });

  final String image;
  final double width;
  final double horizontal;
  final double vertical;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final bool shape;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: horizontal,vertical: vertical),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        boxShadow: [
          if (isShadow)
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
        ],
      ),
      child: isNetwork ?
      shape ?
      CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) =>  SpinKitRipple(
          color: basicPink,
          size: 50.0,
        ),
        errorWidget: (context, url, error) =>  BlankImageWidget(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle  ,
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        ),
      ):  CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) =>  SpinKitRipple(
          color: basicPink,
          size: 50.0,
        ),
        errorWidget: (context, url, error) =>  BlankImageWidget(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        ),
      )
          : Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          image: DecorationImage(image: AssetImage(image), fit: fit),
        ),
      ),
    );
  }
}

class BlankImageWidget extends StatefulWidget {
  const BlankImageWidget({Key? key}) : super(key: key);

  @override
  _BlankImageWidgetState createState() => _BlankImageWidgetState();
}
class _BlankImageWidgetState extends State<BlankImageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Center(
          child: SizedBox(
              child: Icon(Icons.info_outline)
          )
      ),
    );
  }
}