import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_fit/core/providers.dart';

class WorkoutScreen extends ConsumerStatefulWidget {
  const WorkoutScreen({super.key});

  @override
  ConsumerState<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends ConsumerState<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutTimerProvider);
    final notifier = ref.read(workoutTimerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://picsum.photos/id/237/200/300'
              ),
            ),
            const SizedBox(width: 12),
            Column(
              children: [
                Text('Welcome Back'),
                Text('Mr Fugazi'),
              ],
            )
            
          ],
          
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.emoji_events)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Column(
        children: [
          Text("Time: ${state.seconds} sec"),
          Text("Calories: ${state.calories.toStringAsFixed(1)}"),
          Row(
            children: [
              ElevatedButton(
                onPressed: state.isRunning ? null : notifier.start,
                child: Text("Start"),
              ),
              ElevatedButton(
                onPressed: state.isRunning ? notifier.pause : null,
                child: Text("Pause"),
              ),
              ElevatedButton(onPressed: notifier.reset, child: Text("Reset")),
            ],
          ),
        ],
      ),
    );
  }
}
