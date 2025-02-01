import 'package:flutter/material.dart';

import '../models/cat.dart';

final List<String> replies = [
  " 나 김보니일세",
  "어느 강아지별에서 왔니?",
  "대장으로써 충성따윈 안해",
  "므요",
  "간식 내놔라 디진다",
  "필살기 개짖기",
];

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.cat,
  });

  final Cat cat;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.title),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
                bottom: 60.0,
              ),
              physics: const ClampingScrollPhysics(),
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    widget.cat.link,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cat.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF777777),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(isLiked ? Icons.thumb_up : Icons.thumb_up_outlined),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                            // 좋아요 버튼 눌렀을 때 동작 추가
                          },
                        ),
                        Text(
                          widget.cat.likeCount.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  "댓글 ${replies.length}개",
                ),
                ...List.generate(
                  replies.length,
                      (int index) =>
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "익명",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.0),
                            ),
                            Text(replies[index]),
                          ],
                        ),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    "${widget.cat.created.year}년 ${widget.cat.created
                        .month}월 ${widget.cat.created.day}일",
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Theme
                    .of(context)
                    .canvasColor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autocorrect: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: const OutlineInputBorder(),
                          hintText: "댓글 작성",
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // 댓글 보내기 동작 추가
                      },
                      icon: const Icon(Icons.send, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
