/**
 * @format
 */

import { AppRegistry } from 'react-native';
import App from './App';
import ReactNavigationScreen from './ReactNavigationScreen';
import { name as appName } from './app.json';

AppRegistry.registerComponent(appName, () => App);
AppRegistry.registerComponent('ReactNavigationScreen', () => ReactNavigationScreen);
