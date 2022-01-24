import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TagTranslator {
  final BuildContext context;

  TagTranslator(this.context);

  String? translate(String tag) {
    final Map<String, String> _tagsMap = {
      'st.png': AppLocalizations.of(context)!.stShawerma_png,
      'st.jpg': AppLocalizations.of(context)!.stShawerma_jpg,
      'st.svg.png': AppLocalizations.of(context)!.stShawerma_svg,
      'ch.png': AppLocalizations.of(context)!.chShawerma_png,
      'ch.jpg': AppLocalizations.of(context)!.chShawerma_jpg,
      'ch.svg.png': AppLocalizations.of(context)!.chShawerma_svg,
      'cup.png': AppLocalizations.of(context)!.cup_png,
      'cup.jpg': AppLocalizations.of(context)!.cup_jpg,
      'cup.svg.png': AppLocalizations.of(context)!.cup_svg,
      'tea.png': AppLocalizations.of(context)!.tea_png,
      'tea.jpg': AppLocalizations.of(context)!.tea_jpg,
      'tea.svg.png': AppLocalizations.of(context)!.tea_svg
    };

    return _tagsMap[tag];
  }
}