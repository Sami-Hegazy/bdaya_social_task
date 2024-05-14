import 'package:flutter/cupertino.dart';
import 'package:flutter_stories/flutter_stories.dart';

class Stories extends StatelessWidget {
  const Stories({
    super.key,
    required this.momentDuration,
    required this.images,
  });

  final Duration momentDuration;
  final List<Container> images;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF833AB4),
                        Color(0xFFFD1D1D),
                        Color(0xFFFD1D1D),
                        Color(0xFFFCAF45),
                        Color(0xFFE1306C),
                        Color(0xFF833AB4),
                      ],
                    ),
                  ),
                  width: 64.0,
                  height: 64.0,
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoPageScaffold(
                            child: Story(
                              onFlashForward: Navigator.of(context).pop,
                              onFlashBack: Navigator.of(context).pop,
                              momentCount: 5,
                              momentDurationGetter: (idx) => momentDuration,
                              momentBuilder: (context, idx) => images[idx],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CupertinoColors.activeBlue,
                        image: DecorationImage(
                          image: AssetImage(
                            (index == 0)
                                ? "assets/images/your_acc.png"
                                : "assets/images/friend_acc.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text((index == 0) ? "You" : " Friend $index"),
              ],
            );
          },
        ),
      ),
    );
  }
}
