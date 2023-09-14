import 'package:flutter/material.dart';
import 'package:flutter_reddit/core/common/error_text.dart';
import 'package:flutter_reddit/core/common/loader.dart';
import 'package:flutter_reddit/features/community/controller/community_controller.dart';
import 'package:flutter_reddit/models/community_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({super.key});

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void navigateToCommunity(BuildContext context, Community community) {
    Routemaster.of(context).push('/r/${community.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Create a community'),
              leading: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onTap: () => navigateToCreateCommunity(context),
            ),
            ref.watch(userCommunitiesProvider).when(
                  data: (communities) => Expanded(
                    child: ListView.builder(
                      itemCount: communities.length,
                      itemBuilder: (BuildContext context, int index) {
                        final community = communities[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(community.avatar),
                          ),
                          title: Text("r/${community.name}"),
                          onTap: () => navigateToCommunity(context,community),
                        );
                      },
                    ),
                  ),
                  error: (error, stackTrade) => ErrorText(
                    error: error.toString(),
                  ),
                  loading: () => const Loader(),
                ),
          ],
        ),
      ),
    );
  }
}