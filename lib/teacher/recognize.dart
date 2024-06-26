import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../state_notifier.dart';
import '../functions/upload_image.dart';

class Recognize extends StatefulWidget {
  const Recognize({super.key});

  @override
  RecognizeState createState() => RecognizeState();
}

class RecognizeState extends State<Recognize> {
  Future<void> getImage(StateNotifier imageNotifier) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imageNotifier.setImage(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateNotifier>(
      create: (context) => StateNotifier(),
      child: Consumer<StateNotifier>(
        builder: (context, imageNotifier, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('拍照识别'),
            ),
            body: imageNotifier.image == null
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '使用前请先于“我的”——“配置服务端地址”中完成配置',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : Image.file(File(imageNotifier.image!.path)),
            floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.camera),
                  label: '拍照',
                  onTap: () => getImage(imageNotifier),
                ),
                SpeedDialChild(
                  child: const Icon(Icons.folder),
                  label: '相册',
                  onTap: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      imageNotifier.setImage(pickedFile);
                    }
                  },
                ),
                SpeedDialChild(
                  child: const Icon(Icons.cloud_upload),
                  label: '上传',
                  onTap: () async {
                    context.read<StateNotifier>().setLoading(true); // 开始加载
                    if (imageNotifier.image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('请先拍摄照片')),
                      );
                      context.read<StateNotifier>().setLoading(false); // 停止加载
                    } else {
                      await uploadImage(imageNotifier.image!.path, context);
                      if (context.mounted) {
                        context.read<StateNotifier>().setLoading(false); // 停止加载
                      }
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
