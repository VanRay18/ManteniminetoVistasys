// twilio-test.js

const accountSid = 'AC2f6d6d3c5267b5c3aee9037b51445b99'; // Reemplaza con tu SID de cuenta Twilio
const authToken = '030564e43ba5911c7be99dc596fcedb8'; // Reemplaza con tu token de autenticación Twilio
const twilioPhoneNumber = '+13146771312'; 

const client = require('twilio')(accountSid, authToken);

function enviarMensajeTwilio(mensaje) {
  client.messages
    .create({
      body: mensaje,
      from: twilioPhoneNumber,
      to: '7712637337' // Reemplaza con el número de teléfono de destino (también debe incluir el código de país)
    })
    .then(message => console.log(`Mensaje enviado. SID: ${message.sid}`))
    .catch(error => console.error(`Error al enviar el mensaje: ${error.message}`));
}

// Ejemplo de uso
enviarMensajeTwilio('¡Hola desde Twilio! Este es un mensaje de prueba.');
