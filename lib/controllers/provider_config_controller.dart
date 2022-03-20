import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:kubenav/models/provider_config_model.dart';

/// The [ProviderConfigController] is responsible for managing all the provider configs of a user. For that it holds a
/// list of [configs] and allows users to add / remove configs to that list. Everytime the list of [configs] is changed
/// it will save the changes back to the storage.
class ProviderConfigController extends GetxController {
  RxList<Rx<ProviderConfig>> configs = <Rx<ProviderConfig>>[].obs;

  /// [onInit] is used to initialize the [configs]. For that we are looking if the `providerConfigs` value is already
  /// saved in the storage. If this is the case we are reusing the saved value. If we could not found saved [configs] we
  /// initialize an empty list.
  ///
  /// Besides that we are also using the [ever] function so that all changes to the list of configs are saved back to
  /// the storage.
  @override
  void onInit() {
    List? storedConfigs = GetStorage().read<List>('providerConfigs');

    if (storedConfigs != null && storedConfigs.isNotEmpty) {
      configs =
          storedConfigs.map((e) => ProviderConfig.fromJson(e).obs).toList().obs;
    }

    ever(configs, (_) {
      GetStorage().write('providerConfigs', configs.toList());
    });

    super.onInit();
  }

  /// [addConfig] adds a new [config] to our list of [configs]. We are only checking if the provided config name is
  /// already used and return an error string in that case. Besides that all validation of the provided config values
  /// should happen outside of this controller.
  String? addConfig(ProviderConfig config) {
    for (var i = 0; i < configs.length; i++) {
      if (configs[i].value.name == config.name) {
        return 'A provider configuration with the same name already exists';
      }
    }

    configs.add(config.obs);
    return null;
  }

  /// [editConfig] modifies the properties of the provider configuration, so it is possible to change the credentials
  /// for a provider, without the need to remove the existing configuration and all it's clusters. Since we are saving
  /// the provider configuration name within the cluster configuration, it is not allowed to change the
  /// provider configuration name.
  String? editConfig(
    int configIndex,
    ProviderConfig config,
  ) {
    if (configs[configIndex].value.name != config.name) {
      return 'You are not allowed to change the provder configuration name';
    }

    configs[configIndex].value = config;

    GetStorage().write('providerConfigs', configs.toList());
    return null;
  }

  /// [deleteConfig] deletes the config with the given [index] from our [configs] list. We have to check if the config
  /// is still in use by a cluster, before this function is called.
  void deleteConfig(int index) {
    configs.removeAt(index);
  }

  ProviderConfig? getConfig(String name) {
    for (var config in configs) {
      if (config.value.name == name) {
        return config.value;
      }
    }

    return null;
  }
}
