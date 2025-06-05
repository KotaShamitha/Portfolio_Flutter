import 'package:flutter/material.dart';

Color withOpacitySafe(Color color, double opacity) =>
    color.withAlpha((opacity * 255).round());
