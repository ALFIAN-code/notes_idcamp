import 'package:notes/model/note_model.dart';
import 'package:get/get_rx/get_rx.dart';

class NotesController{
  List<Note> notes = [
    Note(
    category: Category.uncategorized,
    title: 'First Note', 
    content: """Pemrograman adalah proses menulis instruksi untuk komputer untuk melakukan tugas tertentu. Instruksi ini ditulis dalam bahasa yang disebut bahasa pemrograman. Bahasa pemrograman adalah seperangkat aturan yang digunakan untuk berkomunikasi dengan komputer.

Pemrograman adalah keterampilan yang penting dalam dunia modern. Komputer digunakan dalam berbagai bidang, termasuk bisnis, pendidikan, dan hiburan. Pemrograman diperlukan untuk membuat aplikasi, game, dan situs web.

Jenis-jenis pemrograman

Ada banyak jenis pemrograman yang berbeda, masing-masing dengan tujuannya sendiri. Beberapa jenis pemrograman yang paling umum adalah:""")
  ].obs;

  void addNote(Note note){
    notes.add(note);
  }

  void updateNote(Note note, int index){
    notes[index] = note;
  }

  void removeNote(int index){
    notes.removeAt(index);
  }
}

NotesController notesController = NotesController();