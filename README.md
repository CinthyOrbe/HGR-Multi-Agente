# HGR-Multi-Agente
Utilización del Sistema de Reconocimiento de Gestos Empleado en el Proyecto de Investigación PIGR-19-07 para el Comando de un Sistema Multi-Agente

Requisitos del Sistema:

![image](https://user-images.githubusercontent.com/86685506/150550991-b6a95e9b-730d-414d-823d-5c4b3e1d5479.png)

Además, dentro de Matlab será necesario contar como mínimo con:
<ul>
<li> Simulink </li>
<li> 	Robotics System Toolbox </li>
<li> 	ROS Toolbox </li>
</ul>
<b>Copia del Package de ROS:</b>
<p>Al verificarse la instalación de todos los requisitos previamente mencionado, es necesario clonar o copiar el package del repositorio:</p>
<p>https://github.com/MarcoOrtega0/Swarm_Robotics</p>
<p>Dentro de este repositorio se tiene la carpeta multi_robot, la cual debera ser copiada en el catkin workspace:</p>
<p>/home/USER/catkin_ws/src/multi_robot</p>
<p>Por otra parte, las carpetas de Gazebo y Matlab son copiadas en una carpeta en el escritorio de tal manera:</p>
<p>/home/USER/Escritorio/Swarm\ Robots </p>
<p>*USER es el nombre de usuario de Linux,por lo que debe ser modificado para cada computadora, y en los ejecutables dentro de la carpeta Gazebo</p>
<p>Se recomienda la compilación del paquete despues de copiarlo, ejecutando las siguientes lineas:</p>
<p><b>$ roscd</b></p>
<p><b>$ catkin_make</b></p>

<b>Ejecución:</b>
<p>Para la ejecución del banco de pruebas se abre a la par el archivo main_swarm.mlx en MATLAB y el menu de Gazebo</p>

![image](https://user-images.githubusercontent.com/86685506/150551090-358afc4b-338d-44ed-a927-4a6442286574.png)

<p>Donde se seleccionará el banco de pruebas y los archivos de Matlab-Simulink en función del número de agentes</p>
<p>Una vez abiertos los documentos y el banco de pruebas se realizan los siguientes pasos:</p>
<ol>
  <li>Inicialización, comportamiento enjambre (Archivo *.mlx)</li>
  <li>Ejecución (Simulación en run paced mode) (Archivo *.slx)</li>
  <li>Una vez finalizada la prueba adquirir y analizar los datos de simulación (Archivo *.mlx)</li>
</ol>

<b>Modificación:</b>
<p>Cualquier parte del entorno o arquitectura de control, así como la visualización de datos son modificables:</p>
<ul>
<li> Banco de Pruebas -> multi_robot </li>
<li> Arquitectura de control -> Simulink</li>
<li> Planeación y Visualización de datos -> MATLAB .mlx </li>
</ul>
 
