import '../../utils/app_imports.dart';

class DottedLine extends StatelessWidget {
  final Axis axis;
  final Color? color;
  final double dashLength;
  final double dashGap;
  final double thickness;
  final double? length;
  final StrokeCap strokeCap;

  const DottedLine({
    super.key,
    this.axis = Axis.horizontal,
    this.color,
    this.dashLength = 6.0,
    this.dashGap = 4.0,
    this.thickness = 1.0,
    this.length,
    this.strokeCap = StrokeCap.butt,
  })  : assert(dashLength > 0),
        assert(dashGap >= 0),
        assert(thickness > 0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isHorizontal = axis == Axis.horizontal;
        final double maxAvailable =
            isHorizontal ? constraints.maxWidth : constraints.maxHeight;

        // When length is null and the constraints are unbounded (e.g., inside a ScrollView),
        // use a reasonable fallback length.
        final double usedLength = length ??
            (maxAvailable.isFinite ? maxAvailable : 100.0); // fallback 100

        final Size size = isHorizontal
            ? Size(usedLength, thickness)
            : Size(thickness, usedLength);

        return SizedBox(
          width: size.width,
          height: size.height,
          child: CustomPaint(
            painter: _DottedLinePainter(
              axis: axis,
              color: color ?? grey[400]!,
              dashLength: dashLength,
              dashGap: dashGap,
              thickness: thickness,
              strokeCap: strokeCap,
            ),
          ),
        );
      },
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Axis axis;
  final Color color;
  final double dashLength;
  final double dashGap;
  final double thickness;
  final StrokeCap strokeCap;

  _DottedLinePainter({
    required this.axis,
    required this.color,
    required this.dashLength,
    required this.dashGap,
    required this.thickness,
    required this.strokeCap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;

    final bool isHorizontal = axis == Axis.horizontal;
    final double totalLength = isHorizontal ? size.width : size.height;
    double start = 0.0;

    while (start < totalLength) {
      final double end = (start + dashLength).clamp(0.0, totalLength);
      if (isHorizontal) {
        final p1 = Offset(start, size.height / 2);
        final p2 = Offset(end, size.height / 2);
        canvas.drawLine(p1, p2, paint);
      } else {
        final p1 = Offset(size.width / 2, start);
        final p2 = Offset(size.width / 2, end);
        canvas.drawLine(p1, p2, paint);
      }
      start += dashLength + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant _DottedLinePainter old) {
    return old.axis != axis ||
        old.color != color ||
        old.dashLength != dashLength ||
        old.dashGap != dashGap ||
        old.thickness != thickness ||
        old.strokeCap != strokeCap;
  }
}
