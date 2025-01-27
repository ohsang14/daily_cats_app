import 'package:flutter/material.dart';

import '../models/cat.dart';

final List<String> replies = [];

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.title),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
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
                      icon: const Icon(
                        Icons.thumb_up_outlined,
                      ),
                      onPressed: () {
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
              "댓글 ${widget.cat.replyCount}개",
            ),
            ...List.generate(
              replies.length,
              (int index) => Padding(
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
                    Text(
                      replies[index],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                "${widget.cat.created.year}년 ${widget.cat.created.month}월 ${widget.cat.created.day}일",
                style: const TextStyle(
                    color: Color(
                  0xFFAAAAAA,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
