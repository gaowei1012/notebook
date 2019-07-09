import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import './data.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    // List<TimelineModel> items = [
    //   TimelineModel(Placeholder(),
    //       position: TimelineItemPosition.random,
    //       iconBackground: Colors.black12,
    //       icon: Icon(Icons.blur_circular)),
    //   TimelineModel(Placeholder(),
    //       position: TimelineItemPosition.random,
    //       iconBackground: Colors.redAccent,
    //       icon: Icon(Icons.blur_circular)),
    // ];

    /*
    List<Widget> items = [
      timelineModel(TimelinePosition.Left),
      timelineModel(TimelinePosition.Left),
      timelineModel(TimelinePosition.Left)
    ];
    */

    return Container(
      margin: EdgeInsets.only(left: 10),
      child: timelineModel(TimelinePosition.Left)
    );
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
        itemBuilder: centerTimelineBuilder,
        itemCount: doodles.length,
        physics: position == TimelinePosition.Left
            ? ClampingScrollPhysics()
            : BouncingScrollPhysics(),
        position: position,
      );

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final doodle = doodles[i];
    final textTheme = Theme.of(context).textTheme;

    return TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(doodle.doodle),
                const SizedBox(
                  height: 8.0,
                ),
                Text(doodle.time, style: textTheme.caption),
                const SizedBox(
                  height: 8.0,
                ),
                Text(doodle.name,
                    style: textTheme.caption, textAlign: TextAlign.center),
                const SizedBox(
                  height: 8.0,
                )
              ],
            ),
          ),
        ),
        position:
            i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == doodles.length,
        iconBackground: doodle.iconBackground,
        icon: doodle.icon);
  }
}
