import 'package:bloc_pattern_best/bloc/postDetailBloc.dart';
import 'package:bloc_pattern_best/modals/postDetialModal.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostDetailScreen extends StatefulWidget {
  PostDetailBloc bloc;
  PostDetailScreen(this.bloc);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  // PostDetailBloc postDetailBloc = PostDetailBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: StreamBuilder(
          stream: widget.bloc.postDetailStream,
          builder: (context, AsyncSnapshot<PostDetail> snapshot) {
            if (snapshot.hasError) {
              return CircularProgressIndicator();
            } else if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else
              return Center(
                child: ListTile(
                  title: Text(
                    snapshot.data.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    snapshot.data.body,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                  leading: Text("No:${snapshot.data.id.toString()}"),
                ),
              );
          }),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   widget.bloc.dispose();
  // }
}
