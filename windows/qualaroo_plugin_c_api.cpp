#include "include/qualaroo/qualaroo_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "qualaroo_plugin.h"

void QualarooPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  qualaroo::QualarooPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
