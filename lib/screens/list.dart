import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whisky_app/data/app_state.dart';
import 'package:whisky_app/data/whisky.dart';
import 'package:whisky_app/styles.dart';
import 'package:whisky_app/widgets/animated_logo.dart';
import 'package:whisky_app/widgets/search_bar.dart';
import 'package:whisky_app/widgets/whisky_headline.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen>
    with SingleTickerProviderStateMixin {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  Animation<double> animation;
  AnimationController animationController;

  String terms = '';

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);

    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInBack)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
    animationController.forward();
  }

  @override
  void dispose() {
    focusNode.dispose();
    animationController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() => terms = controller.text);
  }

  Widget _createSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SearchBar(
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }

  Widget _buildSearchResults(List<Whisky> whiskies, String terms) {
    Widget _generateWhiskyRow(Whisky whisky) {
      return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: FutureBuilder<Set<WhiskyCategory>>(
            future: null,
            builder: (context, snapshot) {
              return WhiskyHeadline(whisky);
            }),
      );
    }

    if (whiskies.isEmpty) {
      if (terms == '') {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: AnimatedLogo(animation: animation),
          ),
        );
      }

      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Нет ничего с таким названием',
            style: Styles.headlineDescription,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: whiskies.length,
      itemBuilder: (context, index) {
        return _generateWhiskyRow(whiskies[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppState>(context);

    return CupertinoTabView(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Styles.scaffoldBackground,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _createSearchBox(),
                Expanded(
                  child: CupertinoScrollbar(
                    child:
                        _buildSearchResults(model.searchWhiskies(terms), terms),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
