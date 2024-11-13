import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_github_borwita/presentation/blocs/detail_user/detail_user_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/search_user/search_user_bloc.dart';
import 'package:user_github_borwita/presentation/pages/main_page.dart';
import 'package:user_github_borwita/presentation/pages/user_detail_page.dart';
import 'package:user_github_borwita/utils/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<SearchUserBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailUserBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: kReleaseMode ? false : true,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const MainPage(),
          '/user_detail': (BuildContext context) => const UserDetailPage(),
        },
      ),
    );
  }
}
