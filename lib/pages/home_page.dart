import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest_altice/cubit/post_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    final postCubit = context.read<PostCubit>();
    postCubit.getPosts();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Listado de Posts"),
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
              return ListView.builder(
                itemCount: state.posts!.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    title: Text(
                      state.posts![i].title,
                      style: _theme.headline6,
                    ),
                    subtitle: Text(
                      state.posts![i].body,
                      style: _theme.bodyText2,
                      overflow: TextOverflow.fade,
                    ),
                    onTap: () {},
                    trailing: CircleAvatar(),
                  ),
                ),
              );
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
