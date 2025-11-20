import '../../../../utils/app_imports.dart';
import '../screens/my_cart_screen/my_cart_screen.dart';
import '../screens/notifications_screen/notification_view.dart';

class AppSliverAppbar extends StatefulWidget {
  final Widget? body;
  const AppSliverAppbar({super.key, this.body});

  @override
  State<AppSliverAppbar> createState() => _AppSliverAppbarState();
}

class _AppSliverAppbarState extends State<AppSliverAppbar> {
  bool pinned = true;
  bool snap = false;
  bool floating = false;

  double _scrollOffset = 0.0;
  final ScrollController _scrollController = ScrollController();
  var isScrolled = false;

  final _minimumOffset = 165;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollOffset = _scrollController.offset;
      if (_scrollOffset > _minimumOffset && !isScrolled) {
        setState(() {
          isScrolled = true;
        });
      } else if (_scrollOffset < _minimumOffset && isScrolled) {
        setState(() {
          isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          surfaceTintColor: transparent,
          elevation: 0,
          backgroundColor: transparent,
          flexibleSpace: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            decoration: BoxDecoration(
              gradient: isScrolled
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFEE017C), Color(0xFF4E1C74)],
                    )
                  : null,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.qText('Let’s find a',
                  size: 20,
                  weight: FontWeight.w700,
                  color: Colors.white,
                  align: TextAlign.center),
              const SizedBox(height: 4),
              CustomText.qText(
                'Little Friends',
                size: 26,
                weight: FontWeight.w700,
                color: Colors.white,
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => Get.to(() => MyCartScreen()),
              icon: Image.asset(
                Images.cartIcon,
                width: 24,
                height: 24,
              ),
            ),
            IconButton(
              onPressed: () => Get.to(() => const NotificationView()),
              icon: Image.asset(
                Images.notificationIcon,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 300,
                    width: Get.width,
                    padding: const EdgeInsets.all(AppDimentions.screenPaddingS),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFEE017C), Color(0xFF4E1C74)],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        const Spacer(flex: 7),
                        Image.asset(
                          height: 220,
                          Images.dashCat,
                        ),
                        const Spacer(flex: 3),
                      ],
                    ),
                  )
                ],
              ),
              heightSpace45,
              widget.body ?? const SizedBox()
            ],
          ),
        ));
  }
}
