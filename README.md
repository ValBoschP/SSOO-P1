# Sistemas Operativos  2022-2023 #
## Projecto BASH: Información sobre los sistemas de archivos montados ##


**Script que tiene las siguientes funcionalidades:**

### **1. Funcionamiento básico**

a) Usando lo aprendido hasta el momento en clase, desarrolla el script "filesysteminfo" que, si no se especifica opción, muestra una tabla,  con todos los tipos de sistemas de archivos que están montados en el sistema: cada fila de la tabla se referirá a uno de estos tipos de sistemas de archivos sin repeticiones e incluirá información adicional. El primer campo de la tabla será el nombre del  tipo sw sistema de archivos. La tabla por defecto se ordenará alfabéticamente por el nombre del tipo de sistema de archivos.  Para obtener la información adicional, debes entender que pueden existir varios "dispositivos" montados con el mismo sistema de archivos (ejecuta mount y fíjate en la salida). Se trata de obtener el "dispositivo" donde se guarde mayor información para ese sistema de archivos, y entonces incluir en la tabla: el punto de montaje del dispositivo mencionado, el nombre del dispositivo y la cantidad de almacenamiento utilizado en el mismo.  Puede ser de utilidad en este caso el comando mount (o el archivo /proc/mount) y el comando df.

b) Dota al script de la capacidad de recibir opciones. Incluye la opción -h para ofrecer ayuda sobre su funcionamiento. Incorpora la opción -inv para cambiar el orden en el que se muestran los sistemas de archivo. 

Nota: Para probar tu scripts requerirás de un sistema con varios dispositivos con sistemas de archivos montados. Adjunto a esta explicación tienes un script para generar puntos de montaje sobre dispositivos loop (archivos) con diferentes sistemas de archivos en tu ordenador.  Los dispositivos se montan en la carpeta /mnt, en las subcarpetas test_0, test_1, test_2,... Al principio del script puedes ver los sistemas de archivos que se están montando.  Para ejecutar el script y montar los dispositivos:

sudo ./prepare_test.sh -c

Para desmontar los dispositivos:

sudo ./prepare_test.sh -r

Necesitarás permisos de root o sudoer para hacerlo. Si no dispones de un ordenador con permisos de root o sudoer, pero el ordenador donde vas a trabajar tiene montado un sistema para reconocer automáticamente unidades de almacenamiento usb y montarlas plug-and-play , puedes  utilizar un pendrive antiguo que puedas borrar completamente y crear en él varios volúmenes con diferentes sistemas de archivos.

c) Completaremos la tabla, incluyendo en cada fila el número total de  dispositivos montados para el mismo sistema de archivos, y la ocupación total de todos estos dispositivos. 

Recuerda facilitar la lectura de tu código:

Usa comentarios en los elementos más complejos del programa para que te sea más sencillo entenderlo cuando haya pasado un tiempo y no te acuerdes

Usa funciones para compartimentar el programa, así como variables y constantes (variables en mayúsculas) que hagan tu código más legible.

Incluye código para procesar la línea de comandos.

Se debe mostrar ayuda sobre el uso si el usuario emplea la opción -h o --help.

Se debe indicar el error y mostrar ayuda sobre el uso si el usuario emplea uno opción no soportada

Ojo con la sustitución de variables y las comillas. En caso de problemas piensa en cómo quedarían las sentencias si las variables no valieran nada ¿tendría sentido para BASH el comando a ejecutar?

Maneja adecuadamente los errores.

En caso de error muestra un mensaje y sal con código de salida distinto de 0. Recuerda la función error_exit de ejercicios anteriores y, si lo crees conveniente, reúsala o haz la tuya propia.

Trata como un error que el usuario emplee opciones no soportadas

Haz lo mismo con las otras posibles condiciones de error que se te ocurran ¿has probado a invocar tu programa opciones absurdas a ver si lo haces fallar?

### **2. Funcionamiento Número mayor y menor y archivos abiertos con lsof en el dispositivo**
a) Muchos dispositivos son representados por el sistema operativo como un archivo que se denomina archivo de dispositivo o device file. Entre estos dispositivos tenemos los discos de almacenamiento, las terminales, los dispositivos de entrada como el ratón , etcétera.  Estos dispositivos son controlados por un driver, que variará lógicamente en función del tipo de dispositivo. Cada archivo de dispositivo se identifica por un número mayor y un número menor. El número mayor indica el driver del sistema utilizado para su control y el número menor es un identificador concreto para ese dispositivo dentro de la clase de dispositivos conectados al sistema controlados por el mismo driver. El número mayor y menor se puede obtener tanto con el comando stat como con el comando ls (en ambos casos se requiere el nombre del archivo de dispositivo). Añade a cada fila de la tabla  el número mayor y menor del archivo de dispositivo que contiene el sistema de archivos correspondiente a esa fila y del que se determinó que tiene la mayor ocupación.  Si un dispositivo no tiene un archivo de dispositivo asociado, deberás sustituir el número mayor y menor por un *.

b) Si se llama al script con la opción -devicefiles, representaremos la tabla considerando solo los dispositivos representados en el sistema operativo como archivos (device files) y que como hemos mencionado se identifican con un número mayor y un número menor.  Además, si se utiliza esta opción  se incluirá en cada fila de la tabla el número total de archivos abiertos en los dispositivos considerados, para el sistema de archivo  descrito en esa fila.  Puede serte útil en este caso, el comando lsof que muestra información sobre los archivos abiertos. 

NOTA IMPORTANTE: Mientras stat devuelve los números mayor y menor en hexadecimal, lsof y otros comandos como ls -l lo dan en decimal Si has obtenido el número mayor y menor con stat los tendrás en hexadecimal y deberás convertirlos a decimal. Una forma de hacerlo es mediante el filtro bc, que es una calculadora interactiva para la línea de comandos.  Por ejemplo, supongamos que mi número mayor está en la variable mayor y lo tengo en hexadecimal. Una forma de obtenerlo en decimal en la misma variable es:

mayor=$(echo "obase=10; ibase=16; $mayor;" | bc )

El comando echo previo a la tubería le pasa a bc un programa interpretable por bc formado por tres líneas. Las dos primeras líneas configuran la base numérica para la salida y la entrada respectivamente, la tercera línea simplemente introduce el número. Esta tercera línea es interpretada por bc como un número en base hexadecimal y produce como salida el mismo número en base decimal.

Sería interesante de cara al tratamiento de posibles errores que previamente se comprobara la existencia del programa bc y se tratara correctamente el posible error de que el programa no esté instalado.

### **3. Filtro por usuario**
Nos interesa ahora filtrar por los archivos abiertos por el usuario real del proceso  que mantiene abierto un archivo. Para ello añadiremos la opción -u que admitirá una lista de usuarios, como por ejemplo:

filesysteminfo  -u jmtorres jttoledo dabreu

En este caso,  solo se considerarán los archivos abiertos con procesos cuyo usuario real sea cualquiera de los establecidos en la lista.  Si se usa la opción -u se asume que solo se consideran dispositivos con archivos de dispositivos asociados (igual que con la opción -devicefiles), representándose entonces la columna del número de archivos abiertos para cada sistema de archivos.

### **4. Cambios en la ordenación y cabecera**
Con las siguientes opciones se podrá modificar el comportamiento de la ordenación:

-sopen: La ordenación se hará por el número de archivos abiertos, y solo se podrá usar con las opciones -devicefiles y/o -u, dado que solo se considerarán los dispositivos con archivos de dispositivo asociados. Si no se cumple esta regla debe producirse un error que deberá ser gestionado correctamente en el script.

-sdevice: la ordenación se realizará por el número total de dispositivos considerados para cada sistema de archivos.

-inv: La ordenación se realizará a la inversa. Este modificador podrá aplicarse en cualquier modo.

Lógicamente no pueden utilizarse simultáneamente las opciones -sopen y -sdevice

 La tabla deberá tener un encabezado, pero se incluirá la opción -noheader para imprimir la tabla sin él.

Todas las opciones se pueden utilizar en simultáneo y combinarán su actuación (salvo las restricciones mencionadas), así por ejemplo:

filesysteminfo -inv  -u jmtorres jttoledo -sdevice 

Me mostrará en la tabla el número de archivos abiertos por procesos de los usuarios seleccionados, será ordenada por el número de dispositivos considerados para cada sistema de archivos, de mayor a menor.