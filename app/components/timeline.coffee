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
        <View style={styles.slotHolder}>
          <View style={styles.line}></View>
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
    alignItems: 'center'
    justifyContent: 'center'
    height: window.height
  slotHolder:
    flexDirection: 'row'
    width: window.width
    marginBottom: 14
  timeText:
    color: "#1bd982"
  line:
    backgroundColor: 'white'
    height: 6
    width: 20
    flexDirection: 'row'

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