import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/content/image_content_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/content/text_content_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/notes/note_with_content_widget.dart';
import 'package:flutter/material.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  final List<NoteWithContentImpl> notes = [
    NoteWithContentImpl(
      title: 'This is first note',
      description:
          'This is description, и тут можно писать своё описание заметки',
      content: [
        const TextContentImpl('this is macbook'),
        const TextContentImpl('some text in note'),
        const ImageContentImpl(
            'https://xstore.md/images/product/2022/06/Apple-Macbook-Air-M2-Space-Gray-2.jpg'),
      ],
    ),
    NoteWithContentImpl(
      title: 'This is first note',
      description:
          'This is description, и тут можно писать своё описание заметки',
      content: [
        const TextContentImpl('this is macbook'),
        const TextContentImpl('some text in note'),
      ],
    ),
    NoteWithContentImpl(
      title: 'This is first note',
      description:
          'This is description, и тут можно писать своё описание заметки',
      content: [
        const TextContentImpl('this is macbook'),
        const TextContentImpl('some text in note'),
      ],
    ),
    NoteWithContentImpl(
      title: 'This is first note',
      description:
          'This is description, и тут можно писать своё описание заметки',
      content: [
        const TextContentImpl('this is macbook'),
        const TextContentImpl('some text in note'),
      ],
    ),
    NoteWithContentImpl(
      title: 'This is first note',
      description:
          'This is description, и тут можно писать своё описание заметки',
      content: [
        const TextContentImpl('this is macbook'),
        const TextContentImpl('some text in note'),
      ],
    ),
    NoteWithContentImpl(
      title: 'This is first note',
      description:
          'This is description, и тут можно писать своё описание заметки',
      content: [
        const TextContentImpl('this is macbook'),
        const TextContentImpl('some text in note'),
      ],
    ),
    NoteWithContentImpl(
      title: 'This is first note',
      description:
          'This is description, и тут можно писать своё описание заметки',
      content: [
        const TextContentImpl('this is macbook'),
        const TextContentImpl('some text in note'),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    NoteWithContentWidget(note: notes[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: notes.length)),
      ),
    );
  }
}
