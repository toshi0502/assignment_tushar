import 'package:assignment_tg/edit_screen.dart';
import 'package:assignment_tg/resume_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final ResumeProvider provider;

  const HomeScreen({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResumeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Builder'),
      ),
      body: ListView.builder(
        itemCount: provider.resumeItems.length,
        itemBuilder: (context, index) {
          final item = provider.resumeItems[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.details.isNotEmpty ? item.details[0] : ''),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => provider.deleteSection(index),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditSectionScreen(
                  index: index,
                  provider: provider,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => provider.addSection('New Section'),
      ),
    );
  }
}
