import 'package:auto_route/auto_route.dart';
import 'package:mobil_programlama_odev/ui/pages/add_new_product/add_new_product.dart';
import 'package:mobil_programlama_odev/ui/pages/add_product.page/add_product.dart';
import 'package:mobil_programlama_odev/ui/pages/introduction_page/introduction_page.dart';
import 'package:mobil_programlama_odev/ui/pages/login_page/login_page.dart';
import 'package:mobil_programlama_odev/ui/pages/main_page/tabs/home_tab_pages/home_tab_main_page.dart';
import 'package:mobil_programlama_odev/ui/pages/old_informations/old_informations.dart';
import 'package:mobil_programlama_odev/ui/pages/profile_page/profile_page.dart';
import 'package:mobil_programlama_odev/ui/pages/search_page/search_page.dart';
import 'package:mobil_programlama_odev/ui/pages/sign_up_landing_page/sign_up_landing_page.dart';
import 'package:mobil_programlama_odev/ui/pages/sign_up_with_email/sign_up_with_email.dart';
import 'package:mobil_programlama_odev/ui/pages/splash_page/splash_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LogInPage),
    AutoRoute(page: SignUpLandingPage),
    AutoRoute(page: SignUpWithEmailPage),
    AutoRoute(page: HomeTabMainPage),
    AutoRoute(page: OldInformationsPage),
    AutoRoute(page: AddNewProductPage),
    AutoRoute(page: SearchPage),
    AutoRoute(page: IntroductionPage),
    AutoRoute(page: ProfilePage),
    AutoRoute(page: AddProductPage)
  ],
)
class $AppRouter {}
