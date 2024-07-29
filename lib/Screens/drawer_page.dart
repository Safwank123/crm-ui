import 'package:crm_project/Screens/followupfillter_screen.dart';
import 'package:crm_project/Screens/leadfillter_screen.dart';
import 'package:crm_project/Screens/nofound_page.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.transparent,
                spreadRadius: 0,
                blurRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                //second circle
                top: -85,
                left: -116,
                height: 382,
                width: 382,
                child: CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.blueAccent.withOpacity(.1)),
              ),
              Positioned(
                //first circle
                top: -29,
                left: -60,
                height: 270,
                width: 270,

                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Color.fromRGBO(179, 188, 235, 1),
                ),
              ),
              Positioned(
                //picture circle
                top: 68,
                left: 26,
                width: 99,
                height: 99,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue.withOpacity(0.3),
                  child: Image.asset('assets/Ellipse 47.png'),
                ),
              ),
              Positioned(
                // third circle
                top: -148,
                left: -179,
                height: 508,
                width: 508,
                child: CircleAvatar(
                  radius: 170,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 115, left: 142),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(59, 51, 103, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 85,
                  left: 145,
                ),
                child: Text(
                  'Christopher',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(59, 51, 103, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160),
                child: ListView(
                  children: [
                       DrawerItem(
                      icon: Icons.dashboard,
                      text: 'Dashbord',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LeadFilterScreen()));
                      },
                    ),

                    DrawerItem(
                      icon: Icons.group_rounded,
                      text: 'Staff',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NofoundPage()));
                      },
                    ),
                    DrawerItem(
                      icon: Icons.list_alt_outlined,
                      text: 'Lead',
                      onPressed: () {},
                    ),
                    DrawerItem(
                      icon: Icons.how_to_reg,
                      text: 'Followup',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FollowupfilterScreen()));
                      },
                    ),
                    DrawerItem(
                      icon: Icons.directions_walk,
                      text: 'Walking',
                      onPressed: () {},
                    ),
                    DrawerItem(
                      icon: Icons.phone_in_talk_sharp,
                      text: 'Call Logs',
                      onPressed: () {},
                    ),
                    DrawerItem(
                      icon: Icons.people,
                      text: 'Customer',
                      onPressed: () {},
                    ),
                    DrawerItem(
                      icon: Icons.task_rounded,
                      text: 'Task',
                      onPressed: () {},
                    ),
                    DrawerItem(
                      icon: Icons.report,
                      text: 'Report',
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 140, top: 70),
                      child: DrawerItem(
                        icon: Icons.logout,
                        text: 'LogOut',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: Text('Drawer Page')),
      body: Center(child: Text('Drawer Page Content')),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const DrawerItem({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ),
      title: Text(text),
      onTap: onPressed,
    );
  }
}
