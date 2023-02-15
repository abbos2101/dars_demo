import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SelectableText("HomePage")),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.state == HomeStates.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.state == HomeStates.fail) {
            return Center(
              child: SelectableText(
                provider.message,
                style: const TextStyle(fontSize: 32),
              ),
            );
          }
          if (provider.state == HomeStates.success) {
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              }),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: provider.posts.length,
                separatorBuilder: (_, i) => const SizedBox(height: 12),
                itemBuilder: (_, i) {
                  final model = provider.posts[i];
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.network(
                          model.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return Container(
                                width: 200,
                                height: 200,
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              );
                            }
                            return child;
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 200,
                              height: 200,
                              alignment: Alignment.center,
                              child: SelectableText("$error"),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              model.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            SelectableText(
                              model.body,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
          return Center(
            child: SelectableText(
              provider.state.name,
              style: const TextStyle(fontSize: 32),
            ),
          );
        },
      ),
    );
  }
}
