import React, { useState } from "react";
import { View, Text, TextInput, Button, StyleSheet } from "react-native";

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
    <View style={styles.container}>
      <Text style={styles.title}>Formulário de Cadastro</Text>

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

      <Button title="Enviar" onPress={handleSubmit} />
      <Button title="Resetar" onPress={handleReset} color="#FF6347" />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#f5f5f5",
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
    width: "80%",
  },
});

export default App;
