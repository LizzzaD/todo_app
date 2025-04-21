import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../extension/build_context_extension.dart';

import 'animated_background.dart';

class DateAndProgressWidget extends StatelessWidget {
  const DateAndProgressWidget({required this.date, super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AnimatedBackground(),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMMM d').format(date),
                  style: context.styles.semibold24.copyWith(
                    color: context.colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '3/7 tasks',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 12,
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          value: 3 / 7,
                          borderRadius: BorderRadius.circular(16),
                          backgroundColor: context.colors.white,
                          valueColor: AlwaysStoppedAnimation(
                            context.colors.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
