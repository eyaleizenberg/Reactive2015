'use strict'
React = require('react-native')
SlidingView = require('./sliding_view')
window = require('Dimensions').get('window')
Icon = require('react-native-vector-icons/Ionicons')
{ Text, View, Image, StyleSheet, TouchableOpacity } = React

Timeline = React.createClass(
  render: ->
    <View style={styles.container}>
      <View style={styles.logoContainer}>
        <Image style={styles.logo} source={require('image!Reactivegreen')} />
        <Text style={[styles.logoText, styles.white]}>Reactive</Text>
        <Text style={[styles.logoText, styles.green]}>2015</Text>
      </View>
      <View style={styles.lineRight}></View>
      <View style={styles.logoContainer}>
        <Icon style={styles.backChevron} name='chevron-left' size=22 />
        <Text style={[styles.logoText, styles.white]}>Swipe to begin</Text>
      </View>
    </View>
)

styles = StyleSheet.create(
  container:
    flex: 1
    backgroundColor: 'black'
    justifyContent: 'center'
    alignItems: 'center'
  logoContainer:
    flexDirection: 'row'
    alignItems: 'center'
  logo:
    width: 150
    height: 150
  logoText:
    fontSize: 24
  white:
    color: 'white'
  green:
    color: "#1bd982"
  lineRight:
    backgroundColor: 'white'
    height: 6
    width: 20
    position: 'absolute'
    top: window.height / 2 - 10
    right: 0
  backChevron:
    color: 'white'
    marginRight: 10
)

module.exports = Timeline