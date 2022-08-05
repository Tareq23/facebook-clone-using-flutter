

import 'package:facebookclone/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class ContactList extends StatelessWidget {
  final List<User> users;

  const ContactList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 280.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Contacts",style: TextStyle(fontSize:18.0,fontWeight:FontWeight.w500,color: Colors.grey[600]),),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.search,size: 30.0,color: Colors.grey[600],),
                    const SizedBox(width: 10,),
                    Icon(Icons.more_horiz,size: 30.0,color: Colors.grey[600],),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: users.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: UserCard(user: users[index],),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
