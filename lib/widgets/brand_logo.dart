import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BrandLogo extends StatelessWidget {
  final bool compact;
  final bool inverse;

  const BrandLogo({
    super.key,
    this.compact = false,
    this.inverse = false,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = compact ? 36.0 : 44.0;
    final double fontSize = compact ? 18.0 : 22.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: inverse ? Colors.white : AppColors.indigo950,
            borderRadius: BorderRadius.circular(compact ? 12 : 16),
            boxShadow: [
              BoxShadow(
                color: AppColors.indigo950.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            'J',
            style: TextStyle(
              color: inverse ? AppColors.indigo950 : Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: compact ? 18 : 22,
            ),
          ),
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: 'Jodo',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
              color: inverse ? Colors.white : AppColors.slate900,
            ),
            children: const [
              TextSpan(
                text: '.',
                style: TextStyle(
                  color: AppColors.orange500,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
