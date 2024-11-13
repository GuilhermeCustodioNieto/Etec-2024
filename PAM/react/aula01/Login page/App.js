import React, { useState } from "react";
import { View, Text, TextInput, Button, StyleSheet, TouchableOpacity } from "react-native";

const App = () => {
  const [name, setName] = useState("");
  const [address, setAddress] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");

  const handleSubmit = () => {
    alert(
      `Nome: ${name}\nEndereço: ${address}\nEmail: ${email}\nTelefone: ${phone}`
    );
  };

  const handleReset = () => {
    setName("");
    setAddress("");
    setEmail("");
    setPhone("");
  };

  return (
    <View style={styles.body}>
      <View style={styles.container}>
        <Text style={styles.title}>Cadastro</Text>
        <Text>Crie sua conta e comece a fazer suas tarefas</Text>

        <View>
          <TextInput
            style={styles.input}
            placeholder="Nome"
            value={name}
            onChangeText={setName}
          />

          <TextInput
            style={styles.input}
            placeholder="Endereço"
            value={address}
            onChangeText={setAddress}
          />

          <TextInput
            style={styles.input}
            placeholder="Email"
            value={email}
            onChangeText={setEmail}
            keyboardType="email-address"
          />

          <TextInput
            style={styles.input}
            placeholder="Telefone"
            value={phone}
            onChangeText={setPhone}
            keyboardType="phone-pad"
          />
        </View>

        <View style={styles.flexbox}>
            <TouchableOpacity style={styles.button}>
              <Text style={styles.buttonText}>Cadastrar</Text>
            </TouchableOpacity>

            <TouchableOpacity style={styles.button}>
              <Text style={styles.buttonText}>Limpar</Text>
            </TouchableOpacity>
        </View>

        <Text style={styles.miniLink}>Fazer login</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  body: {
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
    width: '100vw',
    height: '100vh',
    backgroundColor: '#EBFBFF',

  },

  container: {
    display: 'flex',
    alignItems: "center",
    justifyContent: 'space-evenly',
    backgroundColor: "#FFF",
    width: '40vw',
    height: '80vh',
    padding: '20px',
    borderRadius: '10px',

  },

  title: {
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: 20,
  },

  input: {
    height: 40,
    borderColor: "#ccc",
    borderWidth: 1,
    marginBottom: 15,
    paddingHorizontal: 10,
    width: "20vw",
  },

  button: {
    margin: '20px',
    color: '#fff',
    backgroundColor: '#00C8FF',
    padding: '10px',
    borderRadius:'5px',
    borderBlockColor: '#000',
  },

  buttonText: {
    fontWeight: '600',
  },

  flexbox: {
    display: 'flex',  
    flexDirection: 'row'
  },

  miniLink: {
    fontWeight: '600',
    textDecorationLine: 'underline',
    fontSize: '15px',
  }

});

export default App;
