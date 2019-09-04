import 'package:flutter/material.dart';

/// 评分组件
class Rate extends StatelessWidget {
  final double value;
  final double size;
  final Color color;

  const Rate({
    Key key,
    @required this.value,
    this.size = 14,
    this.color = Colors.orange,
  }) : super(key: key);

  Widget _buildStar(int index) {
    final val = value.round();
    return Icon(
      val >= index
          ? Icons.star
          : val < index - 1 ? Icons.star : Icons.star_half,
      color: val < index - 1 ? Colors.grey : color,
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...[2, 4, 6, 8, 10].map(_buildStar).toList(),
        SizedBox(width: 4.0),
        Text(
          '${value.toStringAsFixed(1)}',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
