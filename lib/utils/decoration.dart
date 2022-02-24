

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Padding padding  (){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 15));
}

BoxDecoration decoration(){
  return BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
    borderRadius: BorderRadius.circular(10),
  );
}

Icon person = Icon(FontAwesomeIcons.user);
Icon email = Icon(FontAwesomeIcons.mailBulk);
Icon address = Icon(FontAwesomeIcons.addressBook);
// Icon person = Icon(FontAwesomeIcons.user);
// Icon person = Icon(FontAwesomeIcons.user);
// Icon person = Icon(FontAwesomeIcons.user);
