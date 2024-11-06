import React, {useState} from 'react';
import {View, Text, TextInput, Button, StyleSheet} from 'react-native';

const App = () => {
  const [username, setUsername] = useState ('');
  const [password, setPassword] = useState ('');

  const handleLogin = () => {
    alert(`Usuario: ${username}\nSenha: ${password}`);
  }
  return(
    <View style={styles.container}>
      <Text style={styles.title}>Tela de Login</Text>
      <TextInput
        style={styles.input}
        placeholder="Nome de Usuario"
        value={username}
        onChangeText={setUsername}
      />

      <TextInput 
        style={styles.input}
        placeholder = "Senha"
        secureTextEntry={true}
        value={password}
        onChangeText ={setPassword}
      />
      <Button title="Entrar" onPress={handleLogin} />

    </View>

    
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    
    justifyContent: 'center',
    backgroundColor: '#f5f5f5',
  },

  title: {
    padding: '30px',
    fontSize: 24,
    fontWeight: 'bold',
  },

  input: {
    height: 40,
    borderColor: '#ccc',
    borderWidth: 1,
    marginBottom: 15,
    paddingHorizontal: 10,
    width: '80%',
  }
})

export default App;