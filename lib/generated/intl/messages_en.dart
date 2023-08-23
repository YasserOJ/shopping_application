// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, one: 'Total (1 item):', other: 'Total (${count} items):')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_to_cart_label":
            MessageLookupByLibrary.simpleMessage("Add to cart"),
        "cart_label": MessageLookupByLibrary.simpleMessage("Cart"),
        "cart_total_items_label": m0,
        "check_out_label": MessageLookupByLibrary.simpleMessage("Check Out"),
        "discover_label": MessageLookupByLibrary.simpleMessage("Discover"),
        "home_subtitle_label":
            MessageLookupByLibrary.simpleMessage("Best modern products"),
        "product_details_label":
            MessageLookupByLibrary.simpleMessage("Product Details"),
        "search_for_products_hint_label":
            MessageLookupByLibrary.simpleMessage("Search your Products")
      };
}
