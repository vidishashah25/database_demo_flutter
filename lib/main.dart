import 'package:flutter/material.dart';
import 'package:database_demo/note.dart';
import 'database_helper.dart';
import 'dart:async';

Future main() async {
  List notes;
  var db = new DatabaseHelper();

  await db.saveNote(new Note("Flutter Tutorials", "Create SQLite Tutorial"));
  await db.saveNote(new Note("Android Development", "Build Firebase Android Apps"));
  await db.saveNote(new Note("Mobile App R&D", "Research more cross-flatforms"));

  print('=== getAllNotes() ===');
  notes = await db.getAllNotes();
  notes.forEach((note) => print(note));

  int count = await db.getCount();
  print('Count: $count');

  print('=== getNote(2) ===');
  Note note = await db.getNote(2);
  print(note.toMap());

  print('=== updateNote[id:1] ===');
  Note updatedNote =
  Note.fromMap({'id': 1, 'title': 'Flutter Tuts', 'description': 'Create SQLite Tut'});
  await db.updateNote(updatedNote);

  notes = await db.getAllNotes();
  notes.forEach((note) => print(note));

  print('=== deleteNote(2) ===');
  await db.deleteNote(2);
  notes = await db.getAllNotes();
  notes.forEach((note) => print(note));

  await db.close();
}