import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/res/text_widget.dart';

import '../../../model/item_model.dart';
import '../../../service/db.dart';

class UpdateItemWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final int? id;
  final String title, subtitle;
  const UpdateItemWidget(
      {super.key,
      required this.titleController,
      required this.subtitleController,
      required this.id,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final item = ref.watch(db);
      return AlertDialog(
        title: const TextUtils(
          text: 'Update Item',
          align: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
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
              controller: subtitleController,
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
                    if (titleController.text.isEmpty) {
                      var itemEdit = ItemModel(
                          title: title, subTitle: subtitleController.text);
                      item
                          .updateItem(
                            id,
                            itemEdit,
                          )
                          .then((value) => Navigator.of(context).pop());
                    } else if (subtitleController.text.isEmpty) {
                      var itemEdit = ItemModel(
                          title: titleController.text, subTitle: subtitle);
                      item
                          .updateItem(
                            id,
                            itemEdit,
                          )
                          .then((value) => Navigator.of(context).pop());
                    } else if (titleController.text.isEmpty &&
                        subtitleController.text.isEmpty) {
                      Navigator.of(context).pop();
                    } else {
                      var itemEdit = ItemModel(
                          title: titleController.text,
                          subTitle: subtitleController.text);
                      item
                          .updateItem(
                            id,
                            itemEdit,
                          )
                          .then((value) => Navigator.of(context).pop());
                    }
                  },
                  child: const Text('Update')),
              ElevatedButton(
                  onPressed: () {
                    titleController.clear();
                    subtitleController.clear();
                  },
                  child: const Text('Clear')),
            ],
          )
        ],
      );
    });
  }
}
