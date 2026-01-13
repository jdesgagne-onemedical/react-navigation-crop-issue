import React from 'react';
import { TextInput, View } from 'react-native';

function AppContent() {
  return (
    <View style={{ flex: 1, backgroundColor: 'red' }}>
      <View style={{ flex: 1, backgroundColor: 'blue' }} />
      <TextInput style={{ backgroundColor: 'yellow', height: 50 }} />
    </View>
  );
}

export default AppContent;
