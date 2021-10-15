import React, {useState} from 'react';
import {
  View,
  Text,
  Button,
  TouchableOpacity,
  StyleSheet,
  requireNativeComponent,
} from 'react-native';

const CounterView = requireNativeComponent('CounterView');
const CameraView = requireNativeComponent('CameraView');

export default function App() {
  const [count, setCounter] = useState(0);

  const increment = () => {
    setCounter(count + 1);
  };

  const onUpdate = e => {
    setCounter(e.nativeEvent.count);
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity
        style={[styles.wrapper, styles.border]}
        onPress={increment}>
        <Text style={styles.button}>{count}</Text>
      </TouchableOpacity>

      <CameraView style={styles.wrapper} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'stretch',
  },
  wrapper: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  border: {
    borderColor: '#eee',
    borderBottomWidth: 1,
  },
  button: {
    fontSize: 50,
    color: 'orange',
  },
});
