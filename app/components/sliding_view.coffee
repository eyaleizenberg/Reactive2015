'use strict'

React = require('react-native')
window = require('Dimensions').get('window')
{ StyleSheet, View, Animated } = React

SlidingView = React.createClass(
  getInitialState: -> slideAnim: new Animated.Value(- window.height)
  componentWillReceiveProps: (newProps) ->
    Animated.timing(
      @state.slideAnim,
      {
        toValue: newProps.target,
        duration: 500,
      },
    ).start()

  render: ->
    <Animated.View style={[styles.container, {marginTop: @state.slideAnim}]}>
      {@props.children}
    </Animated.View>
)

styles = StyleSheet.create(
  container:
    height: window.height * 3
    backgroundColor: 'black'
    justifyContent: 'center'
    alignItems: 'center'
)

module.exports = SlidingView