import 'package:get/get.dart';
import 'package:shopix/App/Cart/cart_view.dart';
import 'package:shopix/App/Product/product_view.dart';
import 'package:shopix/Bindings/cart_binding.dart';
import 'package:shopix/Bindings/product_binding.dart';
import 'package:shopix/Bindings/splash_binding.dart';
import '../App/Checkout/checkout_view.dart';
import '../App/Login/login_view.dart';
import '../App/OrderDetails/order_details_view.dart';
import '../App/Signup/signup_view.dart';
import '../App/Splash/splash_view.dart';
import '../App/TabBar/tabbar_view.dart';
import '../Bindings/checkout_binding.dart';
import '../Bindings/login_binding.dart';
import '../Bindings/order_binding.dart';
import '../Bindings/signup_binding.dart';
import '../Bindings/tabbar_binding.dart';

class AppRoutes {
  static List<GetPage<dynamic>> getPages = [
    /// Splash
    GetPage(
        name: '/splash',
        binding: SplashBinding(),
        page: () => const SplashView()
    ),
    /// Login
    GetPage(
        name: '/login',
        binding: LoginBinding(),
        page: () => const LoginView()
    ),
    /// Signup
    GetPage(
        name: '/signup',
        binding: SignupBinding(),
        page: () => const SignupView()
    ),
    /// Home
    GetPage(
        name: '/tab',
        binding: TabBarBinding(),
        page: () => const TabBarView()
    ),
    /// Product
    GetPage(
      name: '/product',
      binding: ProductBinding(),
      page: () => const ProductView()
    ),
    /// Cart
    GetPage(
      name: '/cart',
      binding: CartBinding(),
      page: () => const CartView()
    ),
    /// Checkout
    GetPage(
        name: '/checkout',
        binding: CheckoutBinding(),
        page: () => const CheckoutView()
    ),
    /// Order Details
    GetPage(
        name: '/order',
        binding: OrderBinding(),
        page: () => const OrderDetailsView()
    ),
  ];
}