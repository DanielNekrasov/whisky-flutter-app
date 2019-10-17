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
};

class Whisky {
  Whisky({
    @required this.id,
    @required this.name,
    @required this.imagePath,
    @required this.shortDescription,
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
  final String shortDescription;
  final String region;
  final WhiskyCategory category;
  final Flavour fragrance;
  final Flavour taste;
  final Flavour aftertaste;
  final int rating;
  final double abv;
  final String note;

  bool isFavorite;

  String get categoryName => whiskyCategoryNames[category];
  String get fragranceName => flavourNames[fragrance];
  String get tasteName => flavourNames[taste];
  String get afterTasteName => aftertasteNames[aftertaste];
}
