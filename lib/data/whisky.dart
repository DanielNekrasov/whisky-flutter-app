import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

enum WhiskyCategory {
  blended,
  bourbon,
  corn,
  malt,
  mixed_irish,
  rye,
  single_malt,
  wheat,
  unknown,
}

const Map<WhiskyCategory, String> whiskyCategoryNames = {
  WhiskyCategory.blended: 'Купажированный',
  WhiskyCategory.bourbon: 'Бурбон',
  WhiskyCategory.corn: 'Зерновой',
  WhiskyCategory.malt: 'Солодовый',
  WhiskyCategory.mixed_irish: 'Традиционный смешанный ирландский',
  WhiskyCategory.rye: 'Ржаной',
  WhiskyCategory.single_malt: 'Односолодовый',
  WhiskyCategory.wheat: 'Пшеничный',
  WhiskyCategory.unknown: 'Неизвестный',
};

const Map<WhiskyCategory, Color> accentColors = {
  WhiskyCategory.blended: Color(0xff8e88a0),
  WhiskyCategory.bourbon: Color(0xffc59b35),
  WhiskyCategory.corn: Color(0xffa76930),
  WhiskyCategory.malt: Color(0xffa18b73),
  WhiskyCategory.mixed_irish: Color(0xff417d41),
  WhiskyCategory.rye: Color(0xffce6873),
  WhiskyCategory.single_malt: Color(0xffa18b73),
  WhiskyCategory.wheat: Color(0xffde8c66),
};

enum Flavour {
  cereal,
  floral,
  fruit,
  marine,
  mineral,
  oil,
  smoky,
  sweet,
  vegetable,
  wine,
  woody,
  unknown
}

const Map<Flavour, String> flavourNames = {
  Flavour.cereal: 'Злаковый',
  Flavour.floral: 'Цветочный',
  Flavour.fruit: 'Плодовый',
  Flavour.marine: 'Морской',
  Flavour.mineral: 'Минеральный',
  Flavour.oil: 'Масляный',
  Flavour.smoky: 'Дымный',
  Flavour.sweet: 'Сладкий',
  Flavour.vegetable: 'Растительный',
  Flavour.wine: 'Винный',
  Flavour.woody: 'Древесный',
  Flavour.unknown: '',
};

const Map<Flavour, String> aftertasteNames = {
  Flavour.cereal: 'Злаковое',
  Flavour.floral: 'Цветочное',
  Flavour.fruit: 'Плодовое',
  Flavour.marine: 'Морское',
  Flavour.mineral: 'Минеральное',
  Flavour.oil: 'Масляное',
  Flavour.smoky: 'Дымное',
  Flavour.sweet: 'Сладкое',
  Flavour.vegetable: 'Растительное',
  Flavour.wine: 'Винное',
  Flavour.woody: 'Древесное',
  Flavour.unknown: '',
};

class Whisky {
  Whisky({
    @required this.id,
    @required this.name,
    @required this.imagePath,
    @required this.description,
    @required this.region,
    @required this.category,
    @required this.fragrance,
    @required this.taste,
    @required this.aftertaste,
    @required this.rating,
    @required this.abv,
    this.note,
    this.isFavorite = false,
  });

  final int id;
  final String name;
  final String imagePath;
  final String description;
  final String region;
  final WhiskyCategory category;
  final Flavour fragrance;
  final Flavour taste;
  final Flavour aftertaste;
  final int rating;
  final String abv;
  final String note;

  bool isFavorite;

  factory Whisky.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Whisky(
      id: json['id'] as int,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
      region: json['region'] as String,
      category: whiskyCategoryNames.keys.firstWhere(
          (k) => whiskyCategoryNames[k] == json['category'],
          orElse: () => WhiskyCategory.unknown),
      fragrance: flavourNames.keys.firstWhere(
          (k) => flavourNames[k] == json['fragrance'],
          orElse: () => Flavour.unknown),
      taste: flavourNames.keys.firstWhere(
        (k) => flavourNames[k] == json['taste'],
        orElse: () => Flavour.unknown,
      ),
      aftertaste: aftertasteNames.keys.firstWhere(
        (k) => aftertasteNames[k] == json['aftertaste'],
        orElse: () => Flavour.unknown,
      ),
      rating: json['rating'] as int,
      abv: json['abv'] as String,
      note: json['note'] as String,
    );
  }

  String get categoryName => whiskyCategoryNames[category];
  String get fragranceName => flavourNames[fragrance];
  String get tasteName => flavourNames[taste];
  String get afterTasteName => aftertasteNames[aftertaste];
  Color get accentColor => accentColors[category];
}
