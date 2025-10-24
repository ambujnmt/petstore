import '../../../utils/app_imports.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: customAppBar(title: 'FAQs'),
    );
  }
}
