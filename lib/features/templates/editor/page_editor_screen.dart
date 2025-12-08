import 'package:flutter/material.dart';

class PageEditorScreen extends StatefulWidget {
  final int pageNumber;

  const PageEditorScreen({Key? key, required this.pageNumber}) : super(key: key);

  @override
  State<PageEditorScreen> createState() => _PageEditorScreenState();
}

class _PageEditorScreenState extends State<PageEditorScreen> {
  // Store text blocks PER page
  final Map<int, List<_EditableTextBlock>> pages = {};
  int currentPage = 1;

  List<_EditableTextBlock> get textBlocks =>
      pages[currentPage] ??= []; // Auto create list for page

  void _addTextBlock(Offset position) {
    setState(() {
      textBlocks.add(_EditableTextBlock(
        text: "Double-tap to edit",
        position: position,
      ));
    });
  }

  void _changePage(int direction) {
    setState(() {
      currentPage += direction;
      if (currentPage < 1) currentPage = 1;
      pages[currentPage] ??= []; // ensure page initialized
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page $currentPage"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: currentPage > 1 ? () => _changePage(-1) : null,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => _changePage(1),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: (details) {
            final localPos = details.localPosition;
            if (_withinCanvas(localPos)) {
              _addTextBlock(localPos);
            }
          },
          child: Container(
            width: 280,
            height: 380,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Stack(
              children: textBlocks.map((block) {
                return Positioned(
                  left: block.position.dx,
                  top: block.position.dy,
                  child: Draggable(
                    feedback: Material(
                      color: Colors.transparent,
                      child: block._buildDisplay(),
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    onDragEnd: (details) {
                      final offset = details.offset - _canvasOffset(context);
                      setState(() {
                        block.position = offset;
                      });
                    },
                    child: GestureDetector(
                      onDoubleTap: () async {
                        final updated = await _openTextEditor(block.text);
                        if (updated != null && updated.isNotEmpty) {
                          setState(() => block.text = updated);
                        }
                      },
                      child: block._buildDisplay(),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  bool _withinCanvas(Offset pos) =>
      pos.dx >= 0 && pos.dy >= 0 && pos.dx <= 280 && pos.dy <= 380;

  Offset _canvasOffset(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  Future<String?> _openTextEditor(String initial) async {
    final controller = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Text"),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}


class _EditableTextBlock {
  String text;
  Offset position;

  _EditableTextBlock({
    required this.text,
    required this.position,
  });

  Widget _buildDisplay() => Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      );
}
