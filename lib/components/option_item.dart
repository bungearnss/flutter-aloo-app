import 'package:flutter/material.dart';
import 'package:flutter_aloo_app/utils/app_color.dart';

import '../model/options.dart';

class OptionItem extends StatelessWidget {
  Options item;
  OptionItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            border: item.last == null
                ? Border(
                    bottom: BorderSide(
                      color: AppColors.greyColor.withOpacity(0.3),
                      width: 0.8,
                    ),
                  )
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      item.label,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: 6),
                    item.sublabel != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 1.5),
                            child: Text(
                              item.sublabel!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    item.value != null
                        ? Text(
                            "${item.value}",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 16),
                          )
                        : Container(),
                    item.unit != null
                        ? Text(" ${item.unit}",
                            style: Theme.of(context).textTheme.bodyText1)
                        : Container(),
                    IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        item.onPressed;
                      },
                      icon: const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.greyColor,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        item.last == true
            ? Text(
                "Connect the device via bluetooth to get"
                " your missing informations & keep tracking your"
                " daily activity",
                style: Theme.of(context).textTheme.bodyText1)
            : Container(),
      ],
    );
  }
}
