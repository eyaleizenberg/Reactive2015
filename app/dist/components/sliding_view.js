'use strict';
var Animated, React, SlidingView, StyleSheet, View, styles, window;

React = require('react-native');

window = require('Dimensions').get('window');

StyleSheet = React.StyleSheet, View = React.View, Animated = React.Animated;

SlidingView = React.createClass({
  getInitialState: function() {
    return {
      slideAnim: new Animated.Value(-window.height)
    };
  },
  componentWillReceiveProps: function(newProps) {
    return Animated.timing(this.state.slideAnim, {
      toValue: newProps.target,
      duration: 500
    }).start();
  },
  render: function() {
    return React.createElement(Animated.View, {
      "style": [
        styles.container, {
          marginTop: this.state.slideAnim
        }
      ]
    }, this.props.children);
  }
});

styles = StyleSheet.create({
  container: {
    height: window.height * 3,
    backgroundColor: 'black',
    justifyContent: 'center',
    alignItems: 'center'
  }
});

module.exports = SlidingView;
