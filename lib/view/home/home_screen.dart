import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rare_task/res/app_constants.dart';
import 'package:rare_task/res/text_widget.dart';
import 'package:rare_task/view/home/widgets/add_item_widget.dart';
import 'package:rare_task/view/home/widgets/empty_widget.dart';
import 'package:rare_task/view/home/widgets/update_item_widget.dart';
import '../../model/item_model.dart';
import '../../service/db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TextEditingController _subtitleEditingController =
      TextEditingController();
  final TextEditingController _titleEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _titleEditingController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final item = ref.watch(db);
      return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return Scaffold(
              appBar: AppBar(
                title: TextUtils(text: 'Home'),
                centerTitle: true,
              ),
              body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Center(
                    child: FutureBuilder(
                        future: DB.instance.getItems(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return const EmptyWidget();
                            } else {
                              return ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Image.asset(
                                    'assets/images/home.png',
                                    height: 260.h,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      ItemModel itemModel = ItemModel.fromMap(
                                          snapshot.data![index]);
                                      return Dismissible(
                                        key: UniqueKey(),
                                        direction: DismissDirection.endToStart,
                                        background: Container(
                                          padding: const EdgeInsets.all(15),
                                          color: Colors.red,
                                          child: const Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'Delete',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                              )),
                                        ),
                                        confirmDismiss:
                                            (DismissDirection direction) async {
                                          return await showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.warning,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Alert',
                                                  ),
                                                ],
                                              ),
                                              content: const Text(
                                                'Are you sure to delete this item?',
                                                textAlign: TextAlign.center,
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(false),
                                                      child: const Text('No'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        item.deleteItem(
                                                            itemModel.id);
                                                        Navigator.of(context)
                                                            .pop(true);
                                                      },
                                                      child: const Text('Yes'),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        onDismissed: (direction) async {
                                          Fluttertoast.showToast(
                                            msg: 'Item Removed',
                                            backgroundColor: Colors.grey,
                                          );
                                        },
                                        child: Card(
                                          color: AppConstants.orange,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ListTile(
                                              title: TextUtils(
                                                  text: itemModel.title),
                                              subtitle: TextUtils(
                                                  text: itemModel.subTitle),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return UpdateItemWidget(
                                                            title:
                                                                itemModel.title,
                                                            subtitle: itemModel
                                                                .subTitle,
                                                            titleController:
                                                                _titleController,
                                                            subtitleController:
                                                                _subtitleController,
                                                            id: itemModel.id,
                                                          );
                                                        });
                                                  },
                                                  icon: const Icon(Icons.edit)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            }
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  )),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddItemWidget(
                          title: _titleController,
                          subtitle: _subtitleController,
                        );
                      });
                },
                child: const Icon(Icons.add),
              ),
            );
          });
    });
  }
}
