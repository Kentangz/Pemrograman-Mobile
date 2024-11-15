import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoPage extends StatelessWidget {
  final BookController bookController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _showAddBookDialog(context),
              child: const Text('Tambah Buku'),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: bookController.getBooksStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                // Cek apakah snapshot.data null atau tidak
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      return ListTile(
                        title: Text(doc['judul']),
                        subtitle: Text(doc['publish-date'].toDate().toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _showEditBookDialog(context, doc),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => bookController.deleteBook(doc.id),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(child: Text("No books available"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Dialog untuk menambah buku
  void _showAddBookDialog(BuildContext context) {
    final titleController = TextEditingController();
    final dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Buku'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Judul Buku'),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Tanggal Terbit'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    dateController.text = pickedDate.toString();
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    dateController.text.isNotEmpty) {
                  bookController.addBook(
                    titleController.text,
                    DateTime.parse(dateController.text),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  // Dialog untuk mengedit buku
  void _showEditBookDialog(BuildContext context, DocumentSnapshot doc) {
    final titleController = TextEditingController(text: doc['judul']);
    final dateController =
        TextEditingController(text: doc['publish-date'].toDate().toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Buku'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Judul Buku'),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Tanggal Terbit'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: doc['publish-date'].toDate(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    dateController.text = pickedDate.toString();
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    dateController.text.isNotEmpty) {
                  bookController.updateBook(
                    doc.id,
                    titleController.text,
                    DateTime.parse(dateController.text),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}
