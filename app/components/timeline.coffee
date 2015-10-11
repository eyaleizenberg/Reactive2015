'use strict'
React = require('react-native')
SlidingView = require('./sliding_view')
window = require('Dimensions').get('window')
data = require('../data/data')
{ Text, View, Image, StyleSheet, TouchableOpacity } = React

Timeline = React.createClass(
  getInitialState: -> top: - window.height
  componentWillMount: ->
    @tuesdayInfo = data.schedule[0].slots[@props.index - 1]
    @wednesdayInfo = data.schedule[1].slots[@props.index - 1]

  render: ->
    <SlidingView target={@state.top}>
      <View style={styles.container}>
        <TouchableOpacity onPress={@pushDown}>
          <Text style={styles.timeText}>Down</Text>
        </TouchableOpacity>
      </View>

      <View style={styles.container}>
        <View style={styles.paddingContainer}>
          <View style={styles.verticalLine}></View>
        </View>
        <View style={styles.slotHolder}>
          <View style={styles.line}></View>
          <View style={styles.box}></View>
        </View>
        <View style={styles.paddingContainer}>
          <View style={styles.verticalLine}></View>
        </View>
      </View>

      <View style={styles.container}>
        <TouchableOpacity onPress={@pushUp}>
          <Text style={styles.timeText}>Up</Text>
        </TouchableOpacity>
      </View>
    </SlidingView>

  pushUp: -> @setState top: @state.top + window.height
  pushDown: -> @setState top: @state.top - window.height
)

styles = StyleSheet.create(
  container:
    height: window.height
  paddingContainer:
    flex: 1
    marginLeft: window.width / 2
  verticalLine:
    width: 6
    backgroundColor: 'white'
    flex: 1
  slotHolder:
    flexDirection: 'row'
    alignItems: 'center'
    width: window.width
    marginBottom: 14
    height: window.height / 3
  timeText:
    color: "#1bd982"
  line:
    backgroundColor: 'white'
    height: 6
    width: 20
    flexDirection: 'row'
  box:
    flexDirection: 'row'
    borderWidth: 6
    borderColor: 'white'
    width: window.width
    height: window.height / 3
)

module.exports = Timeline

        # <Text style={styles.timeText}>{@tuesdayInfo.time}</Text>
        # <Text style={styles.timeText}>{@tuesdayInfo.title}</Text>
        # <Text style={styles.timeText}>--------------------</Text>
        # <Text style={styles.timeText}>{@wednesdayInfo.time}</Text>
        # <Text style={styles.timeText}>{@wednesdayInfo.title}</Text>
        # <TouchableOpacity onPress={@pushUp}>
        #   <Text style={styles.timeText}>Up</Text>
        # </TouchableOpacity>
        # <TouchableOpacity onPress={@pushDown}>
        #   <Text style={styles.timeText}> Down</Text>
        # </TouchableOpacity>