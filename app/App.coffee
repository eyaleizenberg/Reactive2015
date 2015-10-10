'use strict'
React = require('react-native')
Timeline = require('./components/timeline')
Main = require('./components/main')

{ Text, View, Image, StyleSheet, StatusBarIOS, Navigator } = React

ROUTESTACK = [
  { component: Main, index: 0 }
  { component: Timeline, index: 1 }
  { component: Timeline, index: 2 }
  { component: Timeline, index: 3 }
  { component: Timeline, index: 4 }
  { component: Timeline, index: 5 }
  { component: Timeline, index: 6 }
  { component: Timeline, index: 7 }
  { component: Timeline, index: 8 }
  { component: Timeline, index: 9 }
  { component: Timeline, index: 10 }
  { component: Timeline, index: 11 }
  { component: Timeline, index: 12 }
  { component: Timeline, index: 13 }
  { component: Timeline, index: 14 }
  { component: Timeline, index: 15 }
  { component: Timeline, index: 16 }
  { component: Timeline, index: 17 }
  { component: Timeline, index: 18 }
]

App = React.createClass(
  componentWillMount: -> StatusBarIOS.setStyle 1
  render: ->
    <Navigator
      ref="nav"
      style={styles.appContainer}
      renderScene={@renderScene}
      initialRoute={ROUTESTACK[0]}
      initialRouteStack={ROUTESTACK}
      configureScene={ (route) ->
        if route.sceneConfig
          route.sceneConfig
        else
          Navigator.SceneConfigs.HorizontalSwipeJump
      }
    />

  renderScene: (route, navigator) ->
    Component = route.component
    <Component navigator={navigator} route={route} index={route.index} />
)

styles = StyleSheet.create(
  appContainer:
    flex: 1
    backgroundColor: 'black'
)

module.exports = App