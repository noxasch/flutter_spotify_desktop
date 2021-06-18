import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/images/spotify_logo.png',
                height: 55.0,
                filterQuality: FilterQuality.high, // prevent blurry image on desktop
              ),
            ),
          ],
        ),
        _SideMenuIconTab(
          title: 'Home', 
          icon: Icons.home,
          onTap: () {},
        ),
        _SideMenuIconTab(
          title: 'Search', 
          icon: Icons.search,
          onTap: () {},
        ),
        _SideMenuIconTab(
          title: 'Radio', 
          icon: Icons.audiotrack,
          onTap: () {},
        ),
          
      ],),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    Key? key, 
    required this.icon, 
    required this.title, 
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis
      ),
      onTap: onTap,
    );
  }
}
