'use strict';
var Icon, Image, React, SlidingView, StyleSheet, Text, Timeline, TouchableOpacity, View, styles, window;

React = require('react-native');

SlidingView = require('./sliding_view');

window = require('Dimensions').get('window');

Icon = require('react-native-vector-icons/Ionicons');

Text = React.Text, View = React.View, Image = React.Image, StyleSheet = React.StyleSheet, TouchableOpacity = React.TouchableOpacity;

Timeline = React.createClass({
  render: function() {
    return React.createElement(View, {
      "style": styles.container
    }, React.createElement(View, {
      "style": styles.logoContainer
    }, React.createElement(Image, {
      "style": styles.logo,
      "source": require('image!Reactivegreen')
    }), React.createElement(Text, {
      "style": [styles.logoText, styles.white]
    }, "Reactive"), React.createElement(Text, {
      "style": [styles.logoText, styles.green]
    }, "2015")), React.createElement(View, {
      "style": styles.lineRight
    }), React.createElement(View, {
      "style": styles.logoContainer
    }, React.createElement(Icon, {
      "style": styles.backChevron,
      "name": 'chevron-left',
      "size": 22
    }), React.createElement(Text, {
      "style": [styles.logoText, styles.white]
    }, "Swipe to begin")));
  }
});

styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'black',
    justifyContent: 'center',
    alignItems: 'center'
  },
  logoContainer: {
    flexDirection: 'row',
    alignItems: 'center'
  },
  logo: {
    width: 150,
    height: 150
  },
  logoText: {
    fontSize: 24
  },
  white: {
    color: 'white'
  },
  green: {
    color: "#1bd982"
  },
  lineRight: {
    backgroundColor: 'white',
    height: 6,
    width: 20,
    position: 'absolute',
    top: window.height / 2 - 10,
    right: 0
  },
  backChevron: {
    color: 'white',
    marginRight: 10
  }
});

module.exports = Timeline;
