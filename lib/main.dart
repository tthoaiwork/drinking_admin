import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hovering/hovering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin - Drinking Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isHovered = false;
  List<Question> questions = [
    Question(
        id: 1,
        type: 'Trắc nghiệm',
        content: 'Trên trời có triệu vì sao, ở dưới đất có J97 nè, hỏi naruto sinh năm bao nhiêu?'),
    Question(id: 2, type: 'Tự luận', content: 'Câu hỏi 2'),
    Question(id: 3, type: 'Trắc nghiệm', content: 'Câu hỏi 3'),
    Question(id: 1, type: 'Trắc nghiệm', content: 'Câu hỏi 1'),
    Question(id: 2, type: 'Tự luận', content: 'Câu hỏi 2'),
    Question(id: 3, type: 'Trắc nghiệm', content: 'Câu hỏi 3'),
    Question(id: 1, type: 'Trắc nghiệm', content: 'Câu hỏi 1'),
    Question(id: 2, type: 'Tự luận', content: 'Câu hỏi 2'),
    Question(id: 3, type: 'Trắc nghiệm', content: 'Câu hỏi 3'),
    Question(id: 1, type: 'Trắc nghiệm', content: 'Câu hỏi 1'),
    Question(id: 2, type: 'Tự luận', content: 'Câu hỏi 2'),
    Question(id: 3, type: 'Trắc nghiệm', content: 'Câu hỏi 3'),
    Question(id: 1, type: 'Trắc nghiệm', content: 'Câu hỏi 1'),
    Question(id: 2, type: 'Tự luận', content: 'Câu hỏi 2'),
    Question(id: 3, type: 'Trắc nghiệm', content: 'Câu hỏi 3'),
    Question(id: 1, type: 'Trắc nghiệm', content: 'Câu hỏi 1'),
    Question(id: 2, type: 'Tự luận', content: 'Câu hỏi 2'),
    Question(id: 3, type: 'Trắc nghiệm', content: 'Câu hỏi 3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.sizeOf(context).width,
          color: const Color(0xFFF5F7FD),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black)),
                                child: const Row(
                                  children: [
                                    Icon(Icons.search),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Tìm kiếm câu hỏi',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Thêm câu hỏi',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      _header(),
                      const Gap(10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: questions.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = questions[index];
                            return _item(item, index);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _item(Question item, int index) {
    return HoverableItem(
      index: index,
      question: item,
      styleRowContent: _styleRowContent(),
    );
  }

  Container _header() {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('STT', style: _styleTitle()),
          ),
          Expanded(
            flex: 3,
            child: Text('TYPE', style: _styleTitle()),
          ),
          Expanded(
            flex: 7,
            child: Text(
              'QUESTION',
              style: _styleTitle(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'OPTION',
              style: _styleTitle(),
            ),
          ),
        ],
      ),
    );
  }

  _styleTitle() {
    return const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold);
  }

  _styleRowContent() {
    return const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold);
  }
}

class Question {
  final int id;
  final String type;
  final String content;

  Question({required this.id, required this.type, required this.content});
}

class HoverableItem extends StatefulWidget {
  final int index;
  final Question question;
  final TextStyle styleRowContent;

  const HoverableItem({
    Key? key,
    required this.index,
    required this.question,
    required this.styleRowContent,
  }) : super(key: key);

  @override
  State<HoverableItem> createState() => _HoverableItemState();
}

class _HoverableItemState extends State<HoverableItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        transform: isHovered ? Matrix4.translationValues(-2, 0, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: isHovered ? [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 2, blurRadius: 3)] : [],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text('${widget.index + 1}', style: widget.styleRowContent),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(widget.question.type, style: widget.styleRowContent),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  widget.question.content,
                  style: widget.styleRowContent,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.border_color,
                    color: Colors.green,
                  ),
                  Gap(20),
                  Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
String? selectedValue;
