// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whisky_app/data/info.dart';
import 'package:whisky_app/styles.dart';
import 'package:whisky_app/widgets/rating_row.dart';
import 'package:whisky_app/widgets/settings_group.dart';
import 'package:whisky_app/widgets/settings_item.dart';

class SettingScreen extends StatelessWidget {
  SettingsItem _buildAboutItem(BuildContext context) {
    return SettingsItem(
      label: 'О приложении',
      icon: SettingsIcon(
        icon: Styles.infoIcon,
      ),
      content: SettingsNavigationIndicator(),
      onPress: () {
        Navigator.of(context).push<void>(
          CupertinoPageRoute(
            builder: (context) => AboutScreen(),
            title: 'О приложении',
          ),
        );
      },
    );
  }

  SettingsItem _buildRatingSystemItem(BuildContext context) {
    return SettingsItem(
      label: 'Система оценки',
      icon: SettingsIcon(
        icon: Styles.star,
      ),
      content: SettingsNavigationIndicator(),
      onPress: () {
        Navigator.of(context).push<void>(
          CupertinoPageRoute(
            builder: (context) => RatingSystemScreen(),
            title: 'Система оценки',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        color: Styles.scaffoldBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Инфо'),
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    SettingsGroup(
                      items: [
                        _buildAboutItem(context),
                        _buildRatingSystemItem(context)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Назад',
      ),
      backgroundColor: Styles.appBackground,
      child: ListView(
        children: [
          Image.asset(
            'assets/images/book.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text(
                    'Система оценки и основная часть информации взяты из книги «Чистый виски. Настольный путеводитель» Сирила Маля и Александра Вентье («Iconic Whisky» / Cyrille Mald & Alexandre Vingtier). Сама идея создания приложения возникла после прочтения именно этой книги. ',
                    style: Styles.paragraphText),
                SizedBox(height: 8),
                Text(
                    'Приложение не пытается конкурировать с ней или вовсе её заменить. Мы намеренно не приводим здесь значительный пласт информации, содержащийся в книге, который позволяет углубиться в суть виски: его типы, сырьевые и географические особенности, правила и процесс производства, основы дегустации и прочее. ',
                    style: Styles.paragraphText),
                SizedBox(height: 8),
                Text(
                    'Наше приложение призвано лишь помочь оперативно сделать выбор при покупке на основе ваших вкусовых предпочтений, сравнить или отличить виски друг от друга.',
                    style: Styles.paragraphText),
                SizedBox(height: 8),
                Text(
                    'Внимательно изучите раздел «Система оценки», чтобы не допустить ошибку, ориентируясь только на общий рейтинг, оформленный в виде звёзд.',
                    style: Styles.paragraphText)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RatingSystemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Padding> getFlavours() {
      List<Padding> rows = [];
      for (var item in infoFlavoursDescription.entries) {
        rows.add(Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: item.key + ': ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextSpan(text: item.value, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ));
      }

      return rows.toList();
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Назад',
      ),
      backgroundColor: Styles.appBackground,
      child: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text(
                      'Большая часть виски, представленных здесь, отобрана Сирилом Малем и Александром Вентье, ими же и дана оценка: как общего впечатления, так и отдельных вкусо-ароматических качеств. Общее впечатление оценивается по шкале от 1 до 9 звёзд, где 1 — «Приемлемо», а 9 — «Идеально». Если у виски, представленного в данном приложении, отсутствует общий рейтинг, это означает, что Маль и Вентье не уделили внимание этому продукту. При этом авторы приложения не взяли на себя ответственность награждения звёздами, но оценили его вкусо-ароматические качества, опираясь на уникальное «колесо ароматов» Маля и Вентье.',
                      style: Styles.paragraphText),
                  SizedBox(height: 8),
                  Text(
                      'Шкала оценок; соотношение звёзд со 100-бальной системой.',
                      style: Styles.paragraphText),
                  SizedBox(height: 8),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: infoRatingSystem
                          .asMap()
                          .entries
                          .map((entry) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingRow(entry.key + 1,
                                      full: false, size: 16),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    entry.value,
                                    textAlign: TextAlign.end,
                                    style: Styles.detailsTableValueText,
                                    maxLines: 2,
                                  ),
                                ],
                              ))
                          .toList()),
                  SizedBox(height: 8),
                  Text(
                      '«В своей книге мы представили новый взгляд на исследование мира виски, а главными её героями сделали ароматы. Путеводителем по этому миру вам послужит наше Колесо ароматов. Именно оно даёт ключ к пониманию всех открытий в этой области. Мы сделали графический акцент на доминантные ароматы каждого из 1000 отобранных виски, и это позволило нам в доступной и интересной форме рассказать об особенностях каждого из них и наметить основы вкусовые линии. Чтобы помочь вам сравнить или отличить виски друг от друга, мы приводим таблицу, в которой показано, какое из вкусовых семейств преобладает в их аромате, вкусе и послевкусии».',
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getFlavours(),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
