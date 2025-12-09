import 'utils/app_imports.dart';
import 'views/screens/authorization/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pink Paws',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      theme: ThemeData(
        scaffoldBackgroundColor: white,
        colorScheme:
            ColorScheme.fromSeed(seedColor: ColorConstants.selectedColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routingCallback: (routing) {
        if (routing != null) {
          closeKeyboard();
        }
      },
    );
  }
}
