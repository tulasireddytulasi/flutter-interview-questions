# Flutter Animation Questions:

##### 1. What is Animation Controller?

**Animation Controller** manages the **"Animation"**. It produces a new value for every frame that i rendered, keeps the track of the animation state and exposes functionality to play (forward), reverse or stop an animation. 

--------

##### 2.  What is Animation/Tween?

Thi defines the begin and end values along with how to move from the beginning  to end through a curve. This object will notify the controller through the ValueListenable protocol whenever the value it holds has changed.

------------

##### 3.  What is Ticker?

A **ticker** is a class that listens to frameCallback and calls a **tick** function that passes the elapsed duration between the current frame and the last frame to the **ticker listener**. In our case the controller.

Ticker is the refresh rate of our animations. This is what we want to pause when our clock is hidden.

A bonus for using Ticker is that this allows the dev-tool to “slow” our animation. If we use “Slow animations”, then our clock is slowed by 50%. This is a good sign, as it means it will be a lot easier to test our clock!

--------

##### 4. Define a TweenAnimation ?

Short for in-betweening. In a tween animation, the beginning and ending points are defined, as well as a timeline, and a curve that defines the timing and speed of the transition. The framework calculates how to transition from the beginning point to the end point

--------

##### 5. What is a vsync?

Vsync basically keeps the track of screen, so that Flutter does not renders the animation when the screen is not being displayed.

--------

##### 6. When does the animation reach completed or dismissed status?

Animations that progress from 0.0 to 1.0 will be dismissed when their value is 0.0. An animation might then run forward (from 0.0 to 1.0) or perhaps in reverse (from 1.0 to 0.0). Eventually, if the animation reaches the end of its range (1.0), the animation reaches the completed status.

--------

##### 7. Difference between SingleTickerProviderStateMixin and TickerProviderStateMixin?

**SingleTickerProviderStateMixin** is a mixin that provides a single Ticker object, which is required for creating **AnimationController** instances. It is suitable for cases where you only need one animation controller.

**TickerProviderStateMixin** is a more general mixin that provides multiple Ticker objects, allowing you to create multiple **AnimationController** instances. This is useful when you have multiple animations running simultaneously in a single widget.

--------

##### 8. Twin Animation Builder

The TwinAnimationBuilder is a Flutter widget that allows you to create two separate animations that are synchronized and controlled by a single AnimationController. It is useful when you need to animate two different properties or widgets in tandem.

```dart
AnimationController _controller;

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: true);
}

@override
Widget build(BuildContext context) {
  return TwinAnimationBuilder(
    twinA: _controller,
    twinB: _controller,
    builderA: (context, animation) {
      return Transform.translate(
        offset: Offset(animation.value * 100, 0),
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      );
    },
    builderB: (context, animation) {
      return Transform.rotate(
        angle: animation.value * 2 * math.pi,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      );
    },
  );
}
```

In this example, a red square moves horizontally, and a blue square rotates in sync with the same **AnimationController**.

--------

##### 9. What are the In-built Animation Widgets in Flutter?

- **AnimatedContainer**: Animates the properties of a Container widget, such as its size, color, or padding.
- **AnimatedBuilder**: A more flexible widget that allows you to build custom animations by providing a builder function that is called on each animation frame.
- **AnimatedSwitcher**: It provides a way to animate between different widgets in a container. When the child widget changes, the AnimatedSwitcher performs a transition animation, removing the old widget and bringing in the new one.
- **SizeTransition**: It animates the size of its child widget. It is useful when you want to animate the size of a widget based on an Animation object.
- **ScaleTransition**: The ScaleTransition is a widget that animates the scale of its child widget. It can be used to create scaling effects, such as zooming in or out.
- **SlideTransition**: It animates the position of a child widget by sliding it in a particular direction. It is useful when you want to create sliding animations, such as sliding in a new screen or a dialogue box.
- **AnimatedOpacity**: Animates the opacity of a widget.
- **AnimatedCrossFade**: Provides a way to animate between two children widgets by fading between them.
- **AnimatedPositioned**: Animates the position of a widget within a Stack.
- AnimatedAlign: Animates the alignment of a widget within its parent.

--------





