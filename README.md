# HGR-Multi-Agente
Utilización del Sistema de Reconocimiento de Gestos Empleado en el Proyecto de Investigación PIGR-19-07 para el Comando de un Sistema Multi-Agente

Requisitos del Sistema:

![image](https://user-images.githubusercontent.com/86685506/150550991-b6a95e9b-730d-414d-823d-5c4b3e1d5479.png)
![comandosHGR](https://user-images.githubusercontent.com/110753610/183478808-0bc47858-bb14-45a4-ad41-f016b325b9be.png)

Además, dentro de Matlab será necesario contar como mínimo con:
<ul>
<li> Simulink </li>
<li> 	Robotics System Toolbox </li>
<li> 	ROS Toolbox </li>
</ul>
<b>Copia del Package de ROS:</b>
<p>Al verificarse la instalación de todos los requisitos previamente mencionado, es necesario clonar o copiar el package del repositorio:</p>
<p>ñillink github/p>
<p>Dentro de este repositorio se tiene la carpeta multi_robot, la cual debera ser copiada en el catkin workspace:</p>
<p>/home/USER/catkin_ws/src/multi_robot</p>
<p>Por otra parte, las carpetas de Gazebo y Matlab son copiadas en una carpeta en el escritorio de tal manera:</p>
<p>/home/USER/Escritorio/Swarm\ Robots </p>
<p>*USER es el nombre de usuario de Linux,por lo que debe ser modificado para cada computadora, y en los ejecutables dentro de la carpeta Gazebo</p>
<p>Se recomienda la compilación del paquete despues de copiarlo, ejecutando las siguientes lineas:</p>
<p><b>$ roscd</b></p>
<p><b>$ catkin_make</b></p>

<b>Ejecución:</b>
<p>Para la ejecución se abre a la par el archivo Main.mlx en MATLAB y el menu en la Máquina Virtual</p>
Sistema Multi-Agente comandado por Reconocimiento de Gestos
<p>https://youtube.com/playlist?list=PLDPood9E6gIZDzyVxCg9xBSyCjIqkmu2J</p>

<p>Donde se seleccionará el banco de pruebas y los archivos de Matlab-Simulink en función del número de agentes</p>
<p>Una vez abiertos los documentos y el banco de pruebas se realizan los siguientes pasos:</p>
<ol>
  <li>Inicialización, comportamiento enjambre (Archivo *.mlx)</li>
  <li>Ejecución (Simulación en run paced mode) (Archivo *.slx)</li>
  <li>Una vez finalizada la prueba adquirir y analizar los datos de simulación (Archivo *.mlx)</li>
</ol>
