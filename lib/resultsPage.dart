import 'package:flutter/material.dart';
import "main.dart";
import "drawGraph.dart";

class ResultsRoute<T> extends MaterialPageRoute<T> {
  ResultsRoute({
    WidgetBuilder builder,
  }): super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child)
  {
    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      position: new FractionalOffsetTween(
        begin: FractionalOffset.topRight,
        end: FractionalOffset.topLeft
      )
      .animate(
        new CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        )
      ),
      child: child,
    );
  }

  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class DisplayResultsView extends StatelessWidget {

  TextStyle textStyle = new TextStyle(fontSize: 17.5, fontFamily: "Raleway", color: new Color.fromARGB(255, 230, 230, 230));

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text("Results", style: new TextStyle(fontFamily: "Raleway"))),
      body: new ListView(
        children: [
          new Card(
            color: new Color(0xFFAB47BC),
            child: new Container(
              padding: new EdgeInsets.all(60.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                    child: new Text("Derivations", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                  ),
                  new Text("f'(x) = ${derivations[0]}", style: textStyle),
                  new Text("f''(x) = ${derivations[1]}", style: textStyle),
                  new Text("f'''(x) = ${derivations[2]}", style: textStyle),
                ]
              ),
            ),
          ),
          new Card(
            color: const Color(0xFF3D5AFE),
            child: new Container(
              padding: new EdgeInsets.all(60.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                    child: new Text("Roots", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                  ),
                  new Text("$roots", style: textStyle),
                ]
              ),
            ),
          ),
          new Card(
            color: const Color(0xFFFF7043),
            child: new Container(
              padding: new EdgeInsets.all(60.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                    padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                    child: new Text("Extremes", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                  ),
                  new Text("Minimums: ${extremes[0][0].toString()}" , style: textStyle),
                  new Text("Maximums: ${extremes[1][0].toString()}" , style: textStyle),
                  new Text("Inflection Points: ${extremes[2][0].toString()}" , style: textStyle),
                ]
              ),
            ),
          ),
          new Card(
            color: const Color(0xFF29B6F6),
            child: new Container(
              padding: new EdgeInsets.all(60.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new CustomPaint(
                    size: new Size(100.0, 180.0),
                    painter: new BarChartPainter(0.0),
                  ),
                ]
              ),
            ),
          ),
        ]
      ),
    );
  }
}
