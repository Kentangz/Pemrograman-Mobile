import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  final CollectionReference _booksCollection =
      FirebaseFirestore.instance.collection('books');

  // Tambah Buku
  Future<void> addBook(String title, DateTime publishDate) async {
    await _booksCollection.add({
      'judul': title,
      'publish-date': publishDate,
    });
  }

  // Update Buku
  Future<void> updateBook(String id, String newTitle, DateTime newDate) async {
    await _booksCollection.doc(id).update({
      'judul': newTitle,
      'publish-date': newDate,
    });
  }

  // Hapus Buku
  Future<void> deleteBook(String id) async {
    await _booksCollection.doc(id).delete();
  }

  // Mendapatkan Stream dari koleksi buku
  Stream<QuerySnapshot> getBooksStream() {
    return _booksCollection.snapshots();
  }
}