# Series de TV

La aplicación cuenta con una autenticación (local), donde permite a los usuarios ver las series mas
populares y recomendadas, también puede marcar las series como favoritas y ver las series que a
visto recientes.

# Dependencias

- http (consumo de api)
- flutter_riverpod (manejador de estados)
- shared_preferences (persistencia de datos)
- carousel_slider (se utilizara en la pantalla de la serie)
- json_annotation (mapeo de datos)
- json_serializable (mapeo de datos)
- network_image_mock (pruebas unitarias de imagenes)

# Versión

- Flutter 3.3.3 • channel stable
- Framework • revision 18a827f393 (3 days ago) • 2022-09-28 10:03:14 -0700
- Engine • revision 5c984c26eb
- Tools • Dart 2.18.2 • DevTools 2.15.0

# Compilación

Previo a compilar la aplicación, debido a que se utiliza `json_serializable` y `json_annotation`
será necesario ejecutar el siguiente comando: 
`flutter pub run build_runner build --delete-conflicting-outputs`

# Autenticación

-- usuario 1

- __nombre:__ maria
- __contraseña:__ password

-- usuario 2

- __nombre:__ pedro
- __contraseña:__ 123456

# Demostración
https://drive.google.com/file/d/1Bb3lhlUzeqMlfvb9JlUgfsMHMbYbK1mw/view?usp=sharing