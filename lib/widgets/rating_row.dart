import 'package:flutter/widgets.dart';
import 'package:whisky_app/styles.dart';

class RatingRow extends StatelessWidget {
  const RatingRow(this.rating);
  final int rating;

  @override
  Widget build(BuildContext context) {
    List<Widget> ratingList = new List<Widget>();
    for (var i = 1; i <= 9; i++) {
      if (i <= rating) {
        ratingList.add(Icon(Styles.star, color: Styles.starColor));
      } else {
        ratingList.add(Icon(Styles.starBordered, color: Styles.starColor));
      }
    }

    return Row(children: ratingList);
  }
}
