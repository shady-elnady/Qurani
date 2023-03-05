import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../App/Services/services_locator.dart';
import '../Modules/Quran/Presentation/Bloc/Index/index_bloc.dart';
import '../Modules/Quran/Presentation/Pages/quran_index_screen.dart';
import '../Modules/formJson/Pages/index.dart';
import '../Views/Pages/splash_screen.dart';
import 'not_found_page.dart';

part 'route_pages.dart';

class Routes extends RoutePages {
  static MaterialPageRoute<dynamic> goTo({required Widget page}) =>
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      );

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      //
      case RoutePages.intial:
        return goTo(
          page: const SplashScreen(),
        );
      //
      case RoutePages.index:
        return goTo(
          page: const IndexPage(),
        );
      case RoutePages.quran:
        return goTo(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<IndexBloc>()..add(GetIndexEvent()),
              ),
            ],
            child: const QuranIndexScreen(),
          ),
        );
      default:
        return goTo(
          page: const RouteNotFound(),
        );
    }
  }
}
