import 'package:flutter/widgets.dart';
import 'package:whisky_app/styles.dart';

class RatingRow extends StatelessWidget {
  const RatingRow(this.rating, {this.full = true, this.size = 25});
  final int rating;
  final bool full;
  final double size;

  @override
  Widget build(BuildContext context) {
    List<Widget> ratingList = new List<Widget>();
    for (var i = 1; i <= 9; i++) {
      if (i <= rating) {
        ratingList.add(Icon(Styles.star, color: Styles.starColor, size: size,));
      } else if(full) {
        ratingList.add(Icon(Styles.starBordered, color: Styles.starColor, size: size,));
      }
    }

    return Wrap(children: ratingList);
  }
}
