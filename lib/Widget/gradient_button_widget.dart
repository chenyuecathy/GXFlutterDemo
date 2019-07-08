import 'package:flutter/material.dart';


// 未实现禁用状态等，无圆角  后期完善

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onTap,
    @required this.child,
  });

  final List<Color> colors; // 渐变色数组

  final double width;
  final double height;

  final Widget child;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    
    ThemeData theme = Theme.of(context);

    List<Color> _colors = colors ?? [theme.primaryColor , theme.primaryColorDark ?? theme.primaryColor ] ;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
      ),
      child: Material(
        type:MaterialType.transparency ,
        child: InkWell(
          splashColor: colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height,width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),),
    );
  }
}
