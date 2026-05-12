import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ─────────────────────────────────────────────
//  ENTRY — replace with your own main() / router
// ─────────────────────────────────────────────
void main() => runApp(const _PreviewApp());

class _PreviewApp extends StatelessWidget {
  const _PreviewApp();
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: ThemeMode.system,
    home: const HomePage(),
  );
}

// ─────────────────────────────────────────────
//  THEME
// ─────────────────────────────────────────────
class AppTheme {
  static const _primary = Color(0xFF1A73E8);
  static const _onPrimary = Colors.white;
  static const _online = Color(0xFF34C759);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF2F2F7),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFF1C1C1E),
      elevation: 0,
      scrolledUnderElevation: 1,
      shadowColor: Color(0x14000000),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: _primary.withOpacity(0.12),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
    ),
    dividerColor: const Color(0x1F000000),
    cardColor: Colors.white,
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primary,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF000000),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1C1C1E),
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 1,
      shadowColor: Color(0x40000000),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF1C1C1E),
      indicatorColor: _primary.withOpacity(0.20),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
    ),
    dividerColor: const Color(0x1FFFFFFF),
    cardColor: const Color(0xFF1C1C1E),
  );

  static const online = _online;
  static const primary = _primary;
  static const onPrimary = _onPrimary;
}

// ─────────────────────────────────────────────
//  MOCK DATA MODELS
// ─────────────────────────────────────────────
class _Story {
  final String name;
  final Color color;
  final bool isOwn;
  final bool isSeen;
  final bool isOnline;
  const _Story({
    required this.name,
    required this.color,
    this.isOwn = false,
    this.isSeen = false,
    this.isOnline = false,
  });
}

class _Chat {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;
  final Color avatarColor;
  final bool isOnline;
  final bool isMuted;
  final bool isPinned;
  final bool isGroup;
  final bool isSent;
  final bool isRead;
  const _Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarColor,
    this.unread = 0,
    this.isOnline = false,
    this.isMuted = false,
    this.isPinned = false,
    this.isGroup = false,
    this.isSent = false,
    this.isRead = false,
  });
}

const _stories = <_Story>[
  _Story(name: 'You', color: Color(0xFF1A73E8), isOwn: true),
  _Story(name: 'Alice', color: Color(0xFFE91E8C), isOnline: true),
  _Story(name: 'Bob', color: Color(0xFF9C27B0), isSeen: true),
  _Story(name: 'Carol', color: Color(0xFF00BCD4), isOnline: true),
  _Story(name: 'David', color: Color(0xFFFF5722)),
  _Story(name: 'Eve', color: Color(0xFF4CAF50), isSeen: true),
  _Story(name: 'Frank', color: Color(0xFFFF9800)),
];

const _chats = <_Chat>[
  _Chat(
    name: 'Design Team',
    lastMessage: 'Alice: New mockups are ready 🎨',
    time: '9:41',
    avatarColor: Color(0xFF6C3EEF),
    unread: 5,
    isGroup: true,
    isPinned: true,
  ),
  _Chat(
    name: 'Alice Johnson',
    lastMessage: 'Can you review the PR?',
    time: '9:15',
    avatarColor: Color(0xFFE91E8C),
    unread: 2,
    isOnline: true,
    isSent: true,
  ),
  _Chat(
    name: 'Bob Martinez',
    lastMessage: 'See you at the meeting!',
    time: 'Yesterday',
    avatarColor: Color(0xFF9C27B0),
    isSent: true,
    isRead: true,
  ),
  _Chat(
    name: 'Flutter Devs 🚀',
    lastMessage: 'Carol: Check out Flutter 4.0!',
    time: 'Yesterday',
    avatarColor: Color(0xFF00BCD4),
    unread: 12,
    isGroup: true,
    isMuted: true,
  ),
  _Chat(
    name: 'Carol Williams',
    lastMessage: 'Thanks! Talk later 👋',
    time: 'Mon',
    avatarColor: Color(0xFF00BCD4),
    isOnline: true,
    isSent: true,
    isRead: true,
  ),
  _Chat(
    name: 'David Lee',
    lastMessage: 'Sent a photo',
    time: 'Mon',
    avatarColor: Color(0xFFFF5722),
  ),
  _Chat(
    name: 'Eve Thompson',
    lastMessage: 'Sure, I\'ll handle it.',
    time: 'Sun',
    avatarColor: Color(0xFF4CAF50),
    isSent: true,
    isRead: true,
  ),
  _Chat(
    name: 'Work Updates 📋',
    lastMessage: 'Admin: Q3 report is live',
    time: 'Sun',
    avatarColor: Color(0xFF607D8B),
    isGroup: true,
    isMuted: true,
  ),
  _Chat(
    name: 'Frank Garcia',
    lastMessage: 'On my way!',
    time: 'Sat',
    avatarColor: Color(0xFFFF9800),
    isSent: true,
    isRead: true,
  ),
  _Chat(
    name: 'Grace Kim',
    lastMessage: 'Loved the presentation!',
    time: 'Sat',
    avatarColor: Color(0xFF3F51B5),
    unread: 1,
  ),
];

// ─────────────────────────────────────────────
//  HOME PAGE
// ─────────────────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _AppBarWidget(),
        body: Column(
          children: const [
            _StoriesRow(),
            _SearchBar(),
            _ChatTabBar(),
            Expanded(child: _ChatTabView()),
          ],
        ),
        bottomNavigationBar: const _BottomNavBar(),
        floatingActionButton: const _ComposeFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  APP BAR  (Material)
// ─────────────────────────────────────────────
class _AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: _AvatarWithDot(
          initials: 'Me',
          color: AppTheme.primary,
          size: 34,
          showDot: false,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Messages',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.4,
              color: scheme.onSurface,
            ),
          ),
          Text(
            'Online',
            style: TextStyle(
              fontSize: 11,
              color: AppTheme.online,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search_rounded, color: scheme.onSurface),
          tooltip: 'Search',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert_rounded, color: scheme.onSurface),
          tooltip: 'Menu',
          onPressed: () {},
        ),
        const SizedBox(width: 4),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.5),
        child: Divider(height: 0.5, thickness: 0.5, color: Theme.of(context).dividerColor),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  STORIES ROW  (Material)
// ─────────────────────────────────────────────
class _StoriesRow extends StatelessWidget {
  const _StoriesRow();

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).cardColor;
    return Container(
      color: bg,
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        itemCount: _stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, i) => _StoryItem(story: _stories[i]),
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final _Story story;
  const _StoryItem({required this.story});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Ring border
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: story.isSeen
                        ? null
                        : const LinearGradient(
                      colors: [Color(0xFFF58529), Color(0xFFDD2A7B), Color(0xFF8134AF)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    color: story.isSeen ? const Color(0xFFCCCCCC) : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: story.isOwn ? Colors.white : story.color,
                      child: story.isOwn
                          ? const Icon(Icons.add_rounded, color: AppTheme.primary, size: 22)
                          : Text(
                        story.name[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                // Online dot (Cupertino style)
                if (story.isOnline && !story.isOwn)
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: _OnlineDot(size: 13),
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              story.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  SEARCH BAR  (Material)
// ─────────────────────────────────────────────
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.fromLTRB(14, 6, 14, 10),
      child: TextField(
        readOnly: true,
        onTap: () {},
        style: TextStyle(fontSize: 15, color: scheme.onSurface),
        decoration: InputDecoration(
          hintText: 'Search chats, messages...',
          hintStyle: TextStyle(fontSize: 15, color: scheme.onSurface.withOpacity(0.4)),
          prefixIcon: Icon(Icons.search_rounded, color: scheme.onSurface.withOpacity(0.4), size: 20),
          filled: true,
          fillColor: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFEFEFF4),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  TAB BAR  (Material)
// ─────────────────────────────────────────────
class _ChatTabBar extends StatelessWidget {
  const _ChatTabBar();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            labelColor: AppTheme.primary,
            unselectedLabelColor: scheme.onSurface.withOpacity(0.5),
            indicatorColor: AppTheme.primary,
            indicatorWeight: 2.5,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Unread'),
              Tab(text: 'Groups'),
              Tab(text: 'Channels'),
            ],
          ),
          Divider(height: 0.5, thickness: 0.5, color: Theme.of(context).dividerColor),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  TAB VIEW  (Material)
// ─────────────────────────────────────────────
class _ChatTabView extends StatelessWidget {
  const _ChatTabView();

  @override
  Widget build(BuildContext context) {
    final allChats = _chats;
    final unread = _chats.where((c) => c.unread > 0).toList();
    final groups = _chats.where((c) => c.isGroup).toList();

    return TabBarView(
      children: [
        _ChatListView(chats: allChats, showArchive: true, showPinned: true),
        _ChatListView(chats: unread),
        _ChatListView(chats: groups),
        _EmptyTab(label: 'No channels yet', icon: Icons.campaign_outlined),
      ],
    );
  }
}

class _EmptyTab extends StatelessWidget {
  final String label;
  final IconData icon;
  const _EmptyTab({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 52, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)),
          const SizedBox(height: 12),
          Text(label,
              style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.35))),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  CHAT LIST VIEW  (Material)
// ─────────────────────────────────────────────
class _ChatListView extends StatelessWidget {
  final List<_Chat> chats;
  final bool showArchive;
  final bool showPinned;
  const _ChatListView({
    required this.chats,
    this.showArchive = false,
    this.showPinned = false,
  });

  @override
  Widget build(BuildContext context) {
    final pinnedChats = chats.where((c) => c.isPinned).toList();
    final regularChats = chats.where((c) => !c.isPinned).toList();

    return ListView(
      children: [
        // Archive row
        if (showArchive) const _ArchiveRow(),

        // Pinned section
        if (showPinned && pinnedChats.isNotEmpty) ...[
          _SectionHeader(label: 'Pinned'),
          ...pinnedChats.map((c) => _ChatTile(chat: c, isPinned: true)),
          _SectionHeader(label: 'All messages'),
        ],

        // Regular chats
        ...regularChats.map((c) => _ChatTile(chat: c)),

        const SizedBox(height: 80),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  ARCHIVE ROW  (Material)
// ─────────────────────────────────────────────
class _ArchiveRow extends StatelessWidget {
  const _ArchiveRow();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {},
      child: Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.archive_outlined, color: AppTheme.primary, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                'Archived chats',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: scheme.onSurface),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('3',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary)),
            ),
            const SizedBox(width: 6),
            Icon(Icons.chevron_right_rounded, color: scheme.onSurface.withOpacity(0.35), size: 20),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  SECTION HEADER  (Material)
// ─────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  CHAT TILE  (Material)
// ─────────────────────────────────────────────
class _ChatTile extends StatelessWidget {
  final _Chat chat;
  final bool isPinned;
  const _ChatTile({required this.chat, this.isPinned = false});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final hasUnread = chat.unread > 0;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dismissible(
      key: ValueKey(chat.name),
      // Layout only — no actual dismiss logic
      confirmDismiss: (_) async => false,
      background: _SwipeBackground(
        alignment: Alignment.centerLeft,
        color: chat.isMuted ? Colors.blue : Colors.orange,
        icon: chat.isMuted ? Icons.notifications_rounded : Icons.notifications_off_rounded,
        label: chat.isMuted ? 'Unmute' : 'Mute',
      ),
      secondaryBackground: const _SwipeBackground(
        alignment: Alignment.centerRight,
        color: Colors.red,
        icon: Icons.delete_rounded,
        label: 'Delete',
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              _AvatarWithDot(
                initials: chat.isGroup ? null : chat.name[0],
                color: chat.avatarColor,
                size: 52,
                showDot: chat.isOnline,
                isGroup: chat.isGroup,
              ),
              const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (isPinned)
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(Icons.push_pin_rounded,
                                size: 13,
                                color: scheme.onSurface.withOpacity(0.35)),
                          ),
                        if (chat.isMuted)
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(Icons.notifications_off_rounded,
                                size: 13,
                                color: scheme.onSurface.withOpacity(0.35)),
                          ),
                        Expanded(
                          child: Text(
                            chat.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w500,
                              color: scheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Time
                        Text(
                          chat.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: hasUnread
                                ? (chat.isMuted
                                ? scheme.onSurface.withOpacity(0.4)
                                : AppTheme.primary)
                                : scheme.onSurface.withOpacity(0.4),
                            fontWeight: hasUnread ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        // Sent ticks
                        if (chat.isSent)
                          Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: Icon(
                              chat.isRead
                                  ? Icons.done_all_rounded
                                  : Icons.done_rounded,
                              size: 14,
                              color: chat.isRead
                                  ? AppTheme.primary
                                  : scheme.onSurface.withOpacity(0.4),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            chat.lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: scheme.onSurface.withOpacity(hasUnread ? 0.65 : 0.45),
                              fontWeight: hasUnread ? FontWeight.w500 : FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        // Unread badge
                        if (hasUnread) _UnreadBadge(count: chat.unread, muted: chat.isMuted),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  SWIPE BACKGROUND  (Material)
// ─────────────────────────────────────────────
class _SwipeBackground extends StatelessWidget {
  final AlignmentGeometry alignment;
  final Color color;
  final IconData icon;
  final String label;
  const _SwipeBackground({
    required this.alignment,
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isLeft = alignment == Alignment.centerLeft;
    return Container(
      color: color.withOpacity(0.9),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: alignment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLeft) ...[
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 6),
            Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
          ] else ...[
            Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
            const SizedBox(width: 6),
            Icon(icon, color: Colors.white, size: 22),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  AVATAR WITH DOT  (Cupertino-styled dot)
// ─────────────────────────────────────────────
class _AvatarWithDot extends StatelessWidget {
  final String? initials;
  final Color color;
  final double size;
  final bool showDot;
  final bool isGroup;

  const _AvatarWithDot({
    this.initials,
    required this.color,
    required this.size,
    this.showDot = false,
    this.isGroup = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: size / 2,
          backgroundColor: color,
          child: isGroup
              ? Icon(Icons.group_rounded, color: Colors.white, size: size * 0.44)
              : Text(
            initials ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: size * 0.36,
            ),
          ),
        ),
        if (showDot)
          Positioned(
            bottom: 0,
            right: 0,
            child: _OnlineDot(size: size * 0.26),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  ONLINE DOT  (Cupertino)
// ─────────────────────────────────────────────
class _OnlineDot extends StatelessWidget {
  final double size;
  const _OnlineDot({required this.size});

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF1C1C1E)
        : Colors.white;
    // Cupertino-style: solid green dot with white border
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.online,
        shape: BoxShape.circle,
        border: Border.all(color: bg, width: size * 0.18),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  UNREAD BADGE  (Material)
// ─────────────────────────────────────────────
class _UnreadBadge extends StatelessWidget {
  final int count;
  final bool muted;
  const _UnreadBadge({required this.count, this.muted = false});

  @override
  Widget build(BuildContext context) {
    final label = count > 99 ? '99+' : count.toString();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      constraints: const BoxConstraints(minWidth: 20),
      decoration: BoxDecoration(
        color: muted
            ? Theme.of(context).colorScheme.onSurface.withOpacity(0.18)
            : AppTheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w700,
          color: muted
              ? Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
              : Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  BOTTOM NAV BAR  (Material 3)
// ─────────────────────────────────────────────
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      onDestinationSelected: (_) {},
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outline_rounded),
          selectedIcon: Icon(Icons.chat_bubble_rounded),
          label: 'Chats',
        ),
        NavigationDestination(
          icon: Icon(Icons.call_outlined),
          selectedIcon: Icon(Icons.call_rounded),
          label: 'Calls',
        ),
        NavigationDestination(
          icon: Icon(Icons.circle_outlined),
          selectedIcon: Icon(Icons.circle_rounded),
          label: 'Status',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings_rounded),
          label: 'Settings',
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  COMPOSE FAB  (Material)
// ─────────────────────────────────────────────
class _ComposeFAB extends StatelessWidget {
  const _ComposeFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppTheme.primary,
      foregroundColor: Colors.white,
      elevation: 3,
      tooltip: 'New chat',
      child: const Icon(Icons.edit_rounded, size: 22),
    );
  }
}