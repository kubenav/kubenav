import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/routes/app_routes.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';

class LoginController extends GetxController {
  GlobalSettingsController globalSettingsController = Get.find();

  @override
  void onInit() {
    authenticate();

    super.onInit();
  }

  void authenticate() async {
    while (true) {
      try {
        final LocalAuthentication auth = LocalAuthentication();
        final bool canAuthenticateWithBiometrics =
            await auth.canCheckBiometrics;
        final bool canAuthenticate =
            canAuthenticateWithBiometrics || await auth.isDeviceSupported();

        if (canAuthenticate) {
          final List<BiometricType> availableBiometrics =
              await auth.getAvailableBiometrics();

          if (availableBiometrics.isNotEmpty) {
            final bool didAuthenticate = await auth.authenticate(
              localizedReason: 'Authenticate to access your clusters',
              options: const AuthenticationOptions(useErrorDialogs: false),
            );

            if (didAuthenticate) {
              break;
            } else {
              Logger.log(
                'Authentication Failed',
                'You could not be authenticated, please try again',
              );
              snackbar(
                'Authentication Failed',
                'You could not be authenticated, please try again',
              );
            }
          } else {
            break;
          }
        } else {
          break;
        }
      } catch (err) {
        Logger.log(
          'Authentication Failed',
          err.toString(),
        );
        snackbar(
          'Authentication Failed',
          err.toString(),
        );
      }
    }

    Get.offAndToNamed(Routes.home);
  }
}
