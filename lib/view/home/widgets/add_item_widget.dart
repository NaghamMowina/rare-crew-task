import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/res/text_widget.dart';

import '../../../model/item_model.dart';
import '../../../service/db.dart';

class AddItemWidget extends StatelessWidget {
  final TextEditingController title;
  final TextEditingController subtitle;
  const AddItemWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final item = ref.watch(db);
      return AlertDialog(
        title: const TextUtils(
          text: 'Add Item',
          align: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: title,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                label: const Text('Title'),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: subtitle,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                label: const Text('Subtitle'),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var itemExist =
                        ItemModel(title: title.text, subTitle: subtitle.text);
                    item.insertItem(itemExist).then((value) {
                      Navigator.of(context).pop();
                      title.clear();
                      subtitle.clear();
                    });
                  },
                  child: const Text('Add item')),
              ElevatedButton(
                  onPressed: () {
                    title.clear();
                    subtitle.clear();
                  },
                  child: const Text('Clear')),
            ],
          )
        ],
      );
    });
  }
}
