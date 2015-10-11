'use strict';
var Image, React, SlidingView, StyleSheet, Text, Timeline, TouchableOpacity, View, data, styles, window;

React = require('react-native');

SlidingView = require('./sliding_view');

window = require('Dimensions').get('window');

data = require('../data/data');

Text = React.Text, View = React.View, Image = React.Image, StyleSheet = React.StyleSheet, TouchableOpacity = React.TouchableOpacity;

Timeline = React.createClass({
  getInitialState: function() {
    return {
      top: -window.height
    };
  },
  componentWillMount: function() {
    this.tuesdayInfo = data.schedule[0].slots[this.props.index - 1];
    return this.wednesdayInfo = data.schedule[1].slots[this.props.index - 1];
  },
  render: function() {
    return React.createElement(SlidingView, {
      "target": this.state.top
    }, React.createElement(View, {
      "style": styles.container
    }, React.createElement(TouchableOpacity, {
      "onPress": this.pushDown
    }, React.createElement(Text, {
      "style": styles.timeText
    }, "Down"))), React.createElement(View, {
      "style": styles.container
    }, React.createElement(View, {
      "style": styles.paddingContainer
    }, React.createElement(View, {
      "style": styles.verticalLine
    })), React.createElement(View, {
      "style": styles.slotHolder
    }, React.createElement(View, {
      "style": styles.line
    }), React.createElement(View, {
      "style": styles.box
    })), React.createElement(View, {
      "style": styles.paddingContainer
    }, React.createElement(View, {
      "style": styles.verticalLine
    }))), React.createElement(View, {
      "style": styles.container
    }, React.createElement(TouchableOpacity, {
      "onPress": this.pushUp
    }, React.createElement(Text, {
      "style": styles.timeText
    }, "Up"))));
  },
  pushUp: function() {
    return this.setState({
      top: this.state.top + window.height
    });
  },
  pushDown: function() {
    return this.setState({
      top: this.state.top - window.height
    });
  }
});

styles = StyleSheet.create({
  container: {
    height: window.height
  },
  paddingContainer: {
    flex: 1,
    marginLeft: window.width / 2
  },
  verticalLine: {
    width: 6,
    backgroundColor: 'white',
    flex: 1
  },
  slotHolder: {
    flexDirection: 'row',
    alignItems: 'center',
    width: window.width,
    marginBottom: 14,
    height: window.height / 3
  },
  timeText: {
    color: "#1bd982"
  },
  line: {
    backgroundColor: 'white',
    height: 6,
    width: 20,
    flexDirection: 'row'
  },
  box: {
    flexDirection: 'row',
    borderWidth: 6,
    borderColor: 'white',
    width: window.width,
    height: window.height / 3
  }
});

module.exports = Timeline;
