import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import AppContent from './AppContent';

const Stack = createNativeStackNavigator();

function ReactNavigationScreen() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen 
          name="RN Nav screen" 
          component={AppContent}
        />
        <Stack.Screen 
          name="Modal" 
          component={AppContent}
          options={{
            presentation: 'modal',
          }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default ReactNavigationScreen;
