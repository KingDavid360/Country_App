import 'package:country_app/core/api_provider.dart';
import 'package:country_app/core/fliter_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static final providers = <SingleChildWidget>[
    ListenableProvider(create: (_) => ApiProvider()),
    ChangeNotifierProvider(create: (_) => FilterProvider())
  ];
}
