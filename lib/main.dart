import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:white_matrix_ecommerce/helpers/cart_provider.dart';
import 'package:white_matrix_ecommerce/helpers/routes.dart';
import 'package:white_matrix_ecommerce/screens/splash.dart';
import 'package:white_matrix_ecommerce/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: WAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) => Routes.generateRoute(
        routeSettings,
      ),
      home: const ScreenSplash(),
    );
  }
}
