'use strict';
var App, Image, Main, Navigator, ROUTESTACK, React, StatusBarIOS, StyleSheet, Text, Timeline, View, styles;

React = require('react-native');

Timeline = require('./components/timeline');

Main = require('./components/main');

Text = React.Text, View = React.View, Image = React.Image, StyleSheet = React.StyleSheet, StatusBarIOS = React.StatusBarIOS, Navigator = React.Navigator;

ROUTESTACK = [
  {
    component: Main,
    index: 0
  }, {
    component: Timeline,
    index: 1
  }, {
    component: Timeline,
    index: 2
  }, {
    component: Timeline,
    index: 3
  }, {
    component: Timeline,
    index: 4
  }, {
    component: Timeline,
    index: 5
  }, {
    component: Timeline,
    index: 6
  }, {
    component: Timeline,
    index: 7
  }, {
    component: Timeline,
    index: 8
  }, {
    component: Timeline,
    index: 9
  }, {
    component: Timeline,
    index: 10
  }, {
    component: Timeline,
    index: 11
  }, {
    component: Timeline,
    index: 12
  }, {
    component: Timeline,
    index: 13
  }, {
    component: Timeline,
    index: 14
  }, {
    component: Timeline,
    index: 15
  }, {
    component: Timeline,
    index: 16
  }, {
    component: Timeline,
    index: 17
  }, {
    component: Timeline,
    index: 18
  }
];

App = React.createClass({
  componentWillMount: function() {
    return StatusBarIOS.setStyle(1);
  },
  render: function() {
    return React.createElement(Navigator, {
      "ref": "nav",
      "style": styles.appContainer,
      "renderScene": this.renderScene,
      "initialRoute": ROUTESTACK[0],
      "initialRouteStack": ROUTESTACK,
      "configureScene": (function(route) {
        if (route.sceneConfig) {
          return route.sceneConfig;
        } else {
          return Navigator.SceneConfigs.HorizontalSwipeJump;
        }
      })
    });
  },
  renderScene: function(route, navigator) {
    var Component;
    Component = route.component;
    return React.createElement(Component, {
      "navigator": navigator,
      "route": route,
      "index": route.index
    });
  }
});

styles = StyleSheet.create({
  appContainer: {
    flex: 1,
    backgroundColor: 'black'
  }
});

module.exports = App;
