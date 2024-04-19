<%@ Page Title="Home" Language="C#"    MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ProyectoEstancia.Principal2.proyectorose.Index2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>Información de Salud</title>
</head>
<body>
<style>
    h2 {
  font-size: 16px; /* Change font size to 24px */
    }
    h3 {
  font-size: 18px; /* Change font size to 24px */
    }
    h4 {
  font-size: 14px; /* Change font size to 24px */
    }
</style>
    <div id="contenedor-general">

        <h1>VITASYS</h1>
        <h2>Los signos vitales son como una ventanita que nos permite echar un vistazo al funcionamiento interno de nuestro cuerpo.</h2>
        <h3>Valores normales </h3>
        <h4>Temperatura Corporal: <strong>Mayor a 36.0°C</strong><br />
            Pulso: <strong>60 a 100</strong> latidos por minuto<br />
            Respiracion: <strong>12 a 18</strong> respiraciones por minuto<br />
            Presion Arterial: <strong>90/60 </strong>mmHg y <strong>120/80</strong> mmHg
        </h4>
        <p id="fecha-hora"></p>

        <div id="signos-vitales">
            <p>SIGNOS VITALES</p>
            <p>Temperatura corporal: <span id="temperatura">-</span></p>
            <p>Pulso: <span id="pulso">-</span></p>
            <p>Frecuencia respiratoria: <span id="frecuenciaRespiratoria">-</span></p>
            <p>Presión arterial: <span id="presionArterial">-</span></p>
        </div>

        <div id="problema-detectado" style="color: red;">...</div>

       <ul id="registro"></ul>
     

      
       
    </div>


            <script>
                


                function actualizarDatosSalud() {
                    //var problemaDetectadoElement = document.getElementById('problema-detectado');

                    // Simulación de datos de salud aleatorios
                    var temperatura = parseFloat((Math.random() * 10 + 30).toFixed(1));
                    //var temperatura = 40;
                    var pulso = Math.floor(Math.random() * 120 + 60);
                    //var pulso = 101;
                    var frecuenciaRespiratoria = Math.floor(Math.random() * 30 + 10);
                    var presionArterial = `${Math.floor(Math.random() * 120 + 20)}/${Math.floor(Math.random() * 80 + 1)}`;
                    //var presionArterial = `150/80`;
                    // Actualiza los elementos dentro de contenedor-general
                    document.getElementById('temperatura').textContent = temperatura;
                    document.getElementById('pulso').textContent = pulso;
                    document.getElementById('frecuenciaRespiratoria').textContent = frecuenciaRespiratoria;
                    document.getElementById('presionArterial').textContent = presionArterial;
                }

                function actualizarFechaHora() {
                    const fechaHoraElement = document.getElementById('fecha-hora');
                    const now = new Date();
                    const opciones = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', timeZoneName: 'short' };
                    const formatoFechaHora = now.toLocaleDateString('es-ES', opciones);
                    fechaHoraElement.textContent = formatoFechaHora;
                }

                // Llamar a la función de actualización cada segundo
                setInterval(actualizarFechaHora, 1000);

                // Llamar a la función de actualización cada 10 segundos
                setInterval(actualizarDatosSalud, 10000);
                // Llamar a la función de actualización una vez al cargar la página
                actualizarFechaHora();


                // Obtener referencias a los elementos
                const temperaturaElement = document.getElementById('temperatura');
                const pulsoElement = document.getElementById('pulso');
                const frecuenciaRespiratoriaElement = document.getElementById('frecuenciaRespiratoria');
                const presionArterialElement = document.getElementById('presionArterial');
                const problemaDetectadoElement = document.getElementById('problema-detectado');
                const registroElement = document.getElementById('registro');


                // Función para verificar cambios y activar la alarma
                function verificarCambios() {
                    // Obtener la hora actual
                    const now = new Date();
                    const horaActual = now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds();

                   
                    //Alerta Temperatura
                    if (temperaturaElement.innerHTML < 35 || temperaturaElement.innerHTML > 38.7) {
                        problemaDetectadoElement.innerHTML = '¡ALERTA! Temperatura Inestable';

                        // Registrar el cambio junto con la hora
                        const registroItem = document.createElement('li');
                        registroItem.textContent = `Hora: ${horaActual}, Temperatura: ${temperaturaElement.innerHTML}`;
                        registroElement.appendChild(registroItem);



                       

                        //Alerta Pulso

                    } else
                        if (pulsoElement.innerHTML < 60 || pulsoElement.innerHTML > 100) { //cambio en pulso
                            problemaDetectadoElement.innerHTML = '¡ALERTA! Pulso Inestable.';
                            // Registrar el cambio junto con la hora
                            const registroItem = document.createElement('li');
                            registroItem.textContent = `Hora: ${horaActual}, Pulso: ${pulsoElement.innerHTML}`;
                            registroElement.appendChild(registroItem);

                           


                            //Alerta Frecuencia Respiratoria
                        } else
                            if (frecuenciaRespiratoriaElement.innerHTML > 20 || frecuenciaRespiratoriaElement.innerHTML < 12) { //cambio en pulso
                                problemaDetectadoElement.innerHTML = '¡ALERTA! Frecuencia inestable.';

                                // Registrar el cambio junto con la hora
                                const registroItem = document.createElement('li');
                                registroItem.textContent = `Hora: ${horaActual}, FrecuenciaR: ${frecuenciaRespiratoriaElement.innerHTML}`;
                                registroElement.appendChild(registroItem);

s                          

                                //Alerta Presion Arterial
                            } else
                                if (presionArterialElement.innerHTML > `130/80` || presionArterialElement.innerHTML < `120/80`) { //cambio en pulso
                                    problemaDetectadoElement.innerHTML = '¡ALERTA! Presion Arterial Inestable.';

                                    // Registrar el cambio junto con la hora
                                    const registroItem = document.createElement('li');
                                    registroItem.textContent = `Hora: ${horaActual}, PresionArt: ${presionArterialElement.innerHTML}`;
                                    registroElement.appendChild(registroItem);
                                   
                                } else {
                                    // No hay cambios
                                    problemaDetectadoElement.innerHTML = 'Signos Estables';
                                }

                }
                // Llamar a la función cada cierto intervalo de tiempo (por ejemplo, cada 10 segundos)
                setInterval(verificarCambios, 10000);  // Cambié el intervalo a 10000 ms (10 segundos) para fines de demostración
                actualizarDatosSalud();



               
                
    </script>
</body>
</html>

</asp:Content>
