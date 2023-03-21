//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <qualaroo/qualaroo_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) qualaroo_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "QualarooPlugin");
  qualaroo_plugin_register_with_registrar(qualaroo_registrar);
}
