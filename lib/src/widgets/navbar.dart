import 'package:flutter/material.dart';
import 'package:rss_dart/dart_rss.dart';

import 'package:http/http.dart' as http;

// Responsive Navbar widget
class ResponsiveNavbar extends StatelessWidget implements PreferredSizeWidget {
  final Color primaryBlack = Colors.black;
  final Color hoverColor = Colors.black87;

  const ResponsiveNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // For larger screens: Show navbar with all items
          return AppBar(
            toolbarHeight: 90,
            title:
                const Text('Jemis Goti', style: TextStyle(color: Colors.white)),
            actions: [
              _buildNavItem('Works', () {}),
              _buildNavItem('Blogs', () {}),
              _buildNavItem('Packages', () {}),
              _buildContactButton(context),
            ],
          );
        } else {
          // For small screens: Show AppBar with hamburger menu (Drawer)
          return AppBar(
            backgroundColor: primaryBlack,
            title:
                const Text('Jemis Goti', style: TextStyle(color: Colors.white)),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click, // Change cursor to pointer
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              // Non-hover color
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              title,
              style: const TextStyle(color: Colors.black87, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click, // Change cursor to pointer
        child: GestureDetector(
          onTap: () {
           
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            decoration: BoxDecoration(
              color: Colors.black87, // Initial color
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "Contact",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }



  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Drawer for small screens
class ResponsiveDrawer extends StatelessWidget {
  const ResponsiveDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'Jemis Goti',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem('About Me', Icons.person, () {}),
          _buildDrawerItem('Projects', Icons.work, () {}),
          _buildDrawerItem('Packages', Icons.extension, () {}),
          _buildDrawerItem('Contact', Icons.contact_mail, () {
            // Handle Contact button action here
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }
}
