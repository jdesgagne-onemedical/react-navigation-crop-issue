import React from 'react';
import { TextInput, View, Button } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { SafeAreaView } from 'react-native-safe-area-context';

function AppContent() {
  // Check if we're inside a navigation context
  let navigation: any = null;
  let hasNavigation = false;
  
  try {
    navigation = useNavigation();
    hasNavigation = true;
  } catch (e) {
    // Not inside NavigationContainer, that's okay
  }

  const handleOpenModal = () => {
    if (navigation) {
      navigation.navigate('Modal' as never);
    }
  };

  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: 'red' }}>
      <View style={{ flex: 1, backgroundColor: 'blue', justifyContent: 'center', alignItems: 'center' }}>
        {hasNavigation && (
          <Button 
            title="Open Modal" 
            onPress={handleOpenModal}
          />
        )}
      </View>
      <TextInput 
        style={{ backgroundColor: 'yellow', height: 50 }} 
        placeholder="Test input"
      />
    </SafeAreaView>
  );
}

export default AppContent;
