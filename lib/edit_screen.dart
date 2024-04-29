import 'package:assignment_tg/resume_provider.dart';
import 'package:flutter/material.dart';

class AddEditSectionScreen extends StatefulWidget {
  final int? index;
  final ResumeProvider provider;

  const AddEditSectionScreen({Key? key, this.index, required this.provider})
      : super(key: key);

  @override
  _AddEditSectionScreenState createState() => _AddEditSectionScreenState();
}

class _AddEditSectionScreenState extends State<AddEditSectionScreen> {
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();
  List<String> _details = [];

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      final item = widget.provider.resumeItems[widget.index!];
      _titleController.text = item.title;
      _details = item.details;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index != null ? 'Edit Section' : 'Add Section'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Section Title'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _details.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller:
                              TextEditingController(text: _details[index]),
                          onChanged: (value) => _details[index] = value,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            setState(() => _details.removeAt(index)),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _detailsController,
                    decoration: InputDecoration(hintText: 'Add Detail'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () =>
                      setState(() => _details.add(_detailsController.text)),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.index != null) {
                  widget.provider.updateSection(
                      widget.index!, _titleController.text, _details);
                } else {
                  widget.provider.addSection(_titleController.text);
                }
                Navigator.pop(context);
              },
              child: Text(widget.index != null ? 'Save' : 'Add Section'),
            ),
          ],
        ),
      ),
    );
  }
}
