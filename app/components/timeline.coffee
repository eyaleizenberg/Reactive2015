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
          <View style={styles.innerContainer}>
            <View style={styles.twoFith}>
              <Text style={[styles.timeText, styles.tueInfo, {paddingLeft: 20}]}>{"Tue #{@tuesdayInfo.time}"}</Text>
            </View>
            <View style={styles.oneFith}>
              <View style={styles.verticalLine}></View>
            </View>
            <View style={[styles.twoFith, {justifyContent: 'flex-end'}]}>
              <Text style={[styles.timeText, styles.tueInfo, {paddingRight: 20}]}>{@tuesdayInfo.speaker}</Text>
            </View>
          </View>
        </View>
        <View style={styles.slotHolder}>
          <View style={styles.innerContainer}>
            <View style={styles.line}></View>
            <View style={styles.box}>
              <View style={styles.innerBox}>
                <Text style={styles.timeText}>{@tuesdayInfo.title}</Text>
                <Text style={styles.timeText}>{@wednesdayInfo.title}</Text>
              </View>
            </View>
          </View>
        </View>
        <View style={styles.paddingContainer}>
          <View style={styles.innerContainer}>
            <View style={styles.twoFith}>
              <Text style={[styles.timeText, styles.wedInfo, {paddingLeft: 20}]}>{"Wed #{@wednesdayInfo.time}"}</Text>
            </View>
            <View style={styles.oneFith}>
              <View style={styles.verticalLine}></View>
            </View>
            <View style={[styles.twoFith, {justifyContent: 'flex-end'}]}>
              <Text style={[styles.timeText, styles.wedInfo, {paddingRight: 20}]}>{@wednesdayInfo.speaker}</Text>
            </View>
          </View>
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
    flex: 1
  paddingContainer:
    flex: 1
    width: window.width
  verticalLine:
    width: 6
    backgroundColor: 'white'
    height: window.height / 3
  slotHolder:
    flex: 1
    alignItems: 'center'
  timeText:
    color: "#1bd982"
    fontSize: 16
    paddingVertical: 5
  innerContainer:
    flexDirection: 'row'
    flex: 1
    width: window.width
  twoFith:
    flexDirection: 'row'
    width: window.width * 2 / 5
  oneFith:
    flexDirection: 'row'
    justifyContent: 'center'
    width: window.width * 1 / 5
  leftPadder:
    marginLeft: 30
  line:
    backgroundColor: 'white'
    height: 6
    width: 20
    marginTop: 101
    flexDirection: 'row'
  box:
    flexDirection: 'row'
    borderWidth: 6
    borderColor: 'white'
    width: window.width
    height: window.height / 3
  innerBox:
    flex: 1
    justifyContent: 'space-between'
    paddingLeft: 5
  tueInfo:
    alignSelf: 'flex-end'
  wedInfo:
    alignSelf: 'flex-start'
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