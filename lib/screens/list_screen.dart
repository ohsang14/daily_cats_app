import 'package:daily_cats_app/screens/detail_screen.dart';
import 'package:daily_cats_app/screens/upload_screen.dart';
import 'package:flutter/material.dart';
import '../models/cat.dart';

final List<Cat> cats = [
  Cat(
    id: "0",
    name: "김보니",
    title: "오늘의 귀염둥이",
    link: "assets/images/cat_00.jpg",
    likeCount: 1930,
    replyCount: 6,
    created: DateTime(2022, 11, 13, 22, 14, 53, 982),
  ),
  Cat(
    id: "1",
    name: "보보니",
    title: "너만 보인다 말이야~",
    link: "assets/images/cat_01.jpg",
    likeCount: 3023,
    replyCount: 9,
    created: DateTime(2022, 10, 24, 11, 00, 23, 689),
  ),
  Cat(
    id: "2",
    name: "보니",
    title: "멀 보노? 디질래",
    link: "assets/images/cat_02.jpg",
    likeCount: 1003,
    replyCount: 2,
    created: DateTime(2022, 1, 5, 11, 24, 9, 253),
  ),
  Cat(
    id: "3",
    name: "굿보이",
    title: "고양이와 함께 귀염둥이",
    link: "assets/images/cat_03.jpg",
    likeCount: 2211,
    replyCount: 53,
    created: DateTime(2021, 11, 13, 22, 14, 53, 982),
  ),
  Cat(
    id: "4",
    name: "차라",
    title: "하늘에 달린 아드레날린",
    link: "assets/images/cat_04.jpg",
    likeCount: 443,
    replyCount: 1,
    created: DateTime(2022, 11, 13, 33, 14, 53, 725),
  )
];

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily cats"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const UploadScreen(),
              );
            },
            icon: const Icon(Icons.camera_alt),
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemCount: cats.length,
        itemBuilder: (_, int index) => GestureDetector(
          // 상세 화면으로 이동
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  cat: cats[index],
                ),
              ),
            );
          },
          child: Image.asset(
            cats[index].link,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
