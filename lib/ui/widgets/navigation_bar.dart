import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final List<String> items;
  final int selectedItem;
  final ValueChanged<int> onItemTap;

  const NavigationBar({
    Key key,
    this.items,
    this.selectedItem,
    this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final item in items) ...[
          FlatButton(
            onPressed: () => onItemTap(items.indexOf(item)),
            child: Text(
              item,
              style: TextStyle(
                fontSize: 24,
                color: items.indexOf(item) == selectedItem
                    ? Theme.of(context).textTheme.headline6.color
                    : Theme.of(context).textTheme.caption.color,
                fontWeight: items.indexOf(item) == selectedItem
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
          SizedBox(width: 8),
        ]
      ],
    );
  }
}
