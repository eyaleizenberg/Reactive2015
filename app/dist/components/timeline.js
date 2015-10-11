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
      "style": styles.innerContainer
    }, React.createElement(View, {
      "style": styles.twoFith
    }, React.createElement(Text, {
      "style": [
        styles.timeText, styles.tueInfo, {
          paddingLeft: 20
        }
      ]
    }, "Tue " + this.tuesdayInfo.time)), React.createElement(View, {
      "style": styles.oneFith
    }, React.createElement(View, {
      "style": styles.verticalLine
    })), React.createElement(View, {
      "style": [
        styles.twoFith, {
          justifyContent: 'flex-end'
        }
      ]
    }, React.createElement(Text, {
      "style": [
        styles.timeText, styles.tueInfo, {
          paddingRight: 20
        }
      ]
    }, this.tuesdayInfo.speaker)))), React.createElement(View, {
      "style": styles.slotHolder
    }, React.createElement(View, {
      "style": styles.innerContainer
    }, React.createElement(View, {
      "style": styles.line
    }), React.createElement(View, {
      "style": styles.box
    }, React.createElement(View, {
      "style": styles.innerBox
    }, React.createElement(Text, {
      "style": styles.timeText
    }, this.tuesdayInfo.title), React.createElement(Text, {
      "style": styles.timeText
    }, this.wednesdayInfo.title))))), React.createElement(View, {
      "style": styles.paddingContainer
    }, React.createElement(View, {
      "style": styles.innerContainer
    }, React.createElement(View, {
      "style": styles.twoFith
    }, React.createElement(Text, {
      "style": [
        styles.timeText, styles.wedInfo, {
          paddingLeft: 20
        }
      ]
    }, "Wed " + this.wednesdayInfo.time)), React.createElement(View, {
      "style": styles.oneFith
    }, React.createElement(View, {
      "style": styles.verticalLine
    })), React.createElement(View, {
      "style": [
        styles.twoFith, {
          justifyContent: 'flex-end'
        }
      ]
    }, React.createElement(Text, {
      "style": [
        styles.timeText, styles.wedInfo, {
          paddingRight: 20
        }
      ]
    }, this.wednesdayInfo.speaker))))), React.createElement(View, {
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
    flex: 1
  },
  paddingContainer: {
    flex: 1,
    width: window.width
  },
  verticalLine: {
    width: 6,
    backgroundColor: 'white',
    height: window.height / 3
  },
  slotHolder: {
    flex: 1,
    alignItems: 'center'
  },
  timeText: {
    color: "#1bd982",
    fontSize: 16,
    paddingVertical: 5
  },
  innerContainer: {
    flexDirection: 'row',
    flex: 1,
    width: window.width
  },
  twoFith: {
    flexDirection: 'row',
    width: window.width * 2 / 5
  },
  oneFith: {
    flexDirection: 'row',
    justifyContent: 'center',
    width: window.width * 1 / 5
  },
  leftPadder: {
    marginLeft: 30
  },
  line: {
    backgroundColor: 'white',
    height: 6,
    width: 20,
    marginTop: 101,
    flexDirection: 'row'
  },
  box: {
    flexDirection: 'row',
    borderWidth: 6,
    borderColor: 'white',
    width: window.width,
    height: window.height / 3
  },
  innerBox: {
    flex: 1,
    justifyContent: 'space-between',
    paddingLeft: 5
  },
  tueInfo: {
    alignSelf: 'flex-end'
  },
  wedInfo: {
    alignSelf: 'flex-start'
  }
});

module.exports = Timeline;
