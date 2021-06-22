import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertest_altice/BLoC/Post/post_cubit.dart';
import 'package:fluttertest_altice/models/post.dart';
import 'package:fluttertest_altice/widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postCubit = context.read<PostCubit>();
    postCubit.getPosts();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .2,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 40,
                  child: Text(
                    "SJ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Sobre la app"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("appdetails");
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 34, left: 16),
              child: Text(
                "Versión 1.0.0",
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Listado de Posts"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostFetching) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostFetched) {
              return PostsList(posts: state.posts!);
            } else if (state is PostError) {
              return Center(
                child: Text(state.error),
              );
            } else
              return Center();
          },
        ),
      ),
    );
  }
}

class PostsList extends StatelessWidget {
  const PostsList({Key? key, required List<Post> posts})
      : this.posts = posts,
        super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (_, i) => PostWidget(post: posts[i]),
    );
  }
}
