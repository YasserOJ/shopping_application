import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/core/utils/dependency_injection/component/app_component.dart';
import 'package:shopping_application/core/utils/ui_utils/config_setup/config.dart';

class ConfigManager extends StatelessWidget {
  const ConfigManager({
    Key? key,
    required this.builder,
    this.initializeConfig = false,
  }) : super(key: key);

  final Widget Function(
      BuildContext context, Config config, StackRouter appRouter) builder;
  final bool initializeConfig;

  @override
  Widget build(BuildContext context) {
    final Config config = locator<Config>();
    final StackRouter appRouter = AutoRouter.of(context);

    if (initializeConfig) {
      config.init(context);
    }
    return builder(context, config, appRouter);
  }
}
