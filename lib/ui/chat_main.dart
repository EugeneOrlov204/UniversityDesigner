import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => StreamChat(
        client: client,
        child: child,
      ),
      home: const ChannelListPage(),
    );
  }
}

class ChannelListPage extends StatelessWidget {
  const ChannelListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChannelsBloc(
        child: ChannelListView(
          filter: Filter.in_(
            'members',
            [StreamChat.of(context).currentUser!.id],
          ),
          channelPreviewBuilder: _channelPreviewBuilder,
          sort: [SortOption('last_message_at')],
          limit: 20,
          channelWidget: const ChannelPage(),
        ),
      ),
    );
  }

  Widget _channelPreviewBuilder(BuildContext context, Channel channel) {
    final lastMessage = channel.state?.messages.reversed.firstWhere(
      (message) => !message.isDeleted,
    );

    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Общая группа",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 50"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "КН 3.02.01",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 12"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Пикник",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 35"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(300.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Методы оптимизации",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 65"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Танчики",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 15"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Деканат",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 55"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Ролевые игры по Героям",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 50"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Велоезда",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 76"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Группа КН 3.02.01",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 50"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                ),
              ),
            );
          },
          leading: ChannelAvatar(
            channel: channel,
          ),
          title: Text(
            "Домашка",
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Количество участников: 25"),
          trailing: channel.state!.unreadCount > 0
              ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
              : const SizedBox(),
        ),
      ],
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 19, 173, 181),
        foregroundColor: Colors.white,
        title: Text(
          'Группа КН 3.02.01',
          style: GoogleFonts.openSans(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(24, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Новости",
                  style:
                      GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Ссылки на пары",
                  style:
                      GoogleFonts.openSans(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              threadBuilder: (_, parentMessage) => ThreadPage(
                parent: parentMessage,
              ),
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}

class ThreadPage extends StatelessWidget {
  const ThreadPage({
    Key? key,
    this.parent,
  }) : super(key: key);

  final Message? parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThreadHeader(
        parent: parent!,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              parentMessage: parent,
            ),
          ),
          MessageInput(
            parentMessage: parent,
          ),
        ],
      ),
    );
  }
}
