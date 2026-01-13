import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import AppContent from './AppContent';

const Stack = createNativeStackNavigator();

function ReactNavigationScreen() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={AppContent} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default ReactNavigationScreen;
