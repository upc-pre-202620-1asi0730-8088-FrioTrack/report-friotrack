# Guía de entrega TB1 — FríoTrack / BlackStartup

Esta guía organiza el trabajo documental y la exposición. **Es una propuesta de preparación, no una exposición realizada ni evidencia de publicación.** Usar solo funcionalidades, reuniones, contribuciones y resultados comprobados al completar los documentos.

## 1. Alcance y fuentes

La página 32 del statement exige informe acumulativo corregido, actualización de Registro de Versiones, Collaboration Insights y Student Outcome, nueva versión de landing desplegada, primera versión del frontend desplegada y las ocho subsecciones del Sprint 2. Las correcciones del profesor agregan la atención concreta de los problemas de AV1; no se borran las evidencias históricas.

La primera versión desplegada de Web Services, las entrevistas de validación con heurísticas y los primeros videos About-the-Product y About-the-Team corresponden expresamente a **AV2**, según las páginas 32 y 33. La investigación de necesidades, el video del prototipo y la ejecución del frontend son evidencias distintas.

La entrega TB1 se realiza **24 horas antes del inicio de la segunda sesión sincrónica semanal**. El equipo confirmó los sábados de **09:00 a 11:00, hora de Lima**. Por tanto, el límite semanal es el **viernes a las 09:00**. Falta confirmar la semana asignada a TB1; si fuera el sábado 10/10/2026, correspondería el viernes 09/10/2026 a las 09:00. Esta última fecha es condicional, no una fecha de entrega confirmada.

## 2. Productos y evidencia local

| Producto | Ubicación / estado que debe comprobarse | Evidencia de entrega |
| :--- | :--- | :--- |
| Informe | README.md y report/ del repositorio report-friotrack. | PDF generado del contenido acumulativo y verificado visualmente. |
| Frontend | apps/friotrack-web/ en el repositorio local. | Ejecución, capturas, verificación de flujos, repositorio público y URL desplegada tras autorización. |
| Landing | Repositorio hermano ../friotrack-landing/. | Versión corregida, CTA hacia la aplicación, verificación y URL de la nueva versión desplegada. |
| Presentación | Archivo PowerPoint de TB1 y exportación PDF. | Nombres, fotos, carrera y evidencias reales. |
| Participant Performance Report | Borrador para completar por el Team Leader. | Responsabilidades reales, valoración 20 / 16 / 13 / 07 / 00, Word y PDF final. |
| Videos | Grabaciones originales y montaje final. | MP4, URL privada de Stream, captura y tiempos verificados. |

Un build correcto no acredita despliegue. Las capturas de un prototipo no sustituyen capturas de la aplicación ejecutándose. La documentación de una arquitectura no prueba que el backend esté implementado.

## 3. Sustentación sincrónica: propuesta de 12 minutos

| Bloque | Tiempo | Proporción | Contenido propuesto |
| :--- | :--- | :--- | :--- |
| Presentación e introducción | 1 minuto | 8,3 % | Equipo, problema, dos roles y alcance de TB1. |
| Correcciones de AV1 | 2 minutos | 16,7 % | Historias y backlog coherentes; alcance transporte; arquitectura; límites y pendientes de investigación. |
| Demostración | 6 minutos | 50 % | Landing, accesos, flujos core del frontend, idiomas y adaptación móvil. |
| Colaboración | 3 minutos | 25 % | Commits reales, responsables, board, revisiones, Student Outcome y próximos pendientes. |

La distribución cumple los límites del statement: introducción hasta 10 %, correcciones hasta 30 %, demostración al menos 40 % y colaboración al menos 20 %. Ensayar con cronómetro. Las preguntas posteriores del docente requieren que cada integrante comprenda el trabajo que presenta.

### Guion propuesto

1. **Introducción:** “FríoTrack sigue las condiciones de envíos refrigerados de alimentos. El Coordinador Logístico organiza y atiende el traslado; el Cliente de Carga consulta la información de su envío.” Distinguir alcance propuesto y versión entregada.
2. **Correcciones:** mostrar los artefactos corregidos y su coherencia. Explicar que los tres registros de investigación previos se conservan y que faltan entrevistas pertinentes y mapas actuales. No presentar esa limitación como cerrada.
3. **Demostración:** abrir la landing, mostrar el CTA y recorrer la aplicación ejecutándose. Indicar explícitamente cuándo los datos son de demostración y qué operaciones quedan en almacenamiento local o servicios reales.
4. **Colaboración:** mostrar autoría y periodo definidos, tareas verificables y contribuciones sustantivas. No atribuir al equipo commits todavía no realizados.

## 4. Exposición pregrabada: máximo 30 minutos

Todos los integrantes deben aparecer ante cámara explicando la construcción de los artefactos. El video combina presentación, demostración y explicación; no se entrega una simple lectura de diapositivas.

| Bloque propuesto | Tiempo máximo orientativo | Evidencia |
| :--- | :--- | :--- |
| Presentación de los integrantes y problema | 2 minutos | Nombre, carrera, participación y foto/toma de cada integrante. |
| Correcciones AV1 e investigación | 6 minutos | Artefactos corregidos, fuentes y pendientes reales. |
| Requisitos y diseño | 5 minutos | Historias, trazabilidad, componentes frontend/backend y prototipo. |
| Producto en ejecución | 10 minutos | Landing y frontend; desktop/mobile; escenarios normales y errores relevantes. |
| Sprint 2 y colaboración | 5 minutos | Planning real, backlog, commits, ejecución y estado de despliegue. |
| Conclusiones y pendientes | 2 minutos | Alcance alcanzado y evidencias faltantes. |

Total orientativo: 30 minutos. Cada integrante debe explicar trabajo que conozca y pueda sustentar. Registrar asignación de intervenciones con nombres reales; no inventar una reunión de planificación del video.

## 5. Video de navegación del prototipo

El Anexo C solicita un archivo que consolide navegación de landing y aplicaciones, priorizando flujos del core business y aproximadamente tres a cinco minutos por aplicación. Es distinto del video de exposición.

Guion propuesto:

1. Presentar rol, tarea y dispositivo del recorrido.
2. Recorrer la landing y el acceso propuesto para ese segmento.
3. Mostrar programación de un envío y todos sus pasos, sin saltar del paso 1 al 4.
4. Mostrar consulta de condiciones, ubicación, fecha de última lectura e historial.
5. Mostrar alerta y registro de acción correctiva, aclarando qué permite el prototipo.
6. Mostrar la consulta desde Cliente de Carga y los límites de acceso.
7. Repetir los recorridos móviles pertinentes; un mock-up estático no acredita navegación.

Nombre propuesto cuando corresponda al Sprint 2: **upc-pre-202620-1asi0730-8088-blackstartup-prototypenavigation-sprint-2.mp4**. Añadir captura y URL de Stream al capítulo IV después de grabar y publicar con autorización.

## 6. Video de ejecución del producto

El paquete contiene un primer video silencioso de ejecución local de **4:46**, `outputs/upc-pre-202620-1asi0730-8088-blackstartup-productnavigation-sprint-2.mp4`. Se construyó con 152 capturas muestreadas durante un recorrido real del navegador, conservando el tiempo entre capturas; muestra FT-0006, programación, alertas, cliente, idiomas y móvil. Los datos son de ejemplo. Falta revisar el guion con el equipo y añadir narración/URL de Stream cuando corresponda. No sustituye el video del prototipo ni la exposición ante cámara. Guion para completar:

| Escenario | Mostrar | Explicar |
| :--- | :--- | :--- |
| Acceso desde landing | Destino efectivo del CTA. | URL y versión; no usar un modal como prueba del frontend. |
| Programar un envío | Datos, asignación y resultado que la versión soporte. | Reglas y qué queda persistido. |
| Consultar un envío | Condiciones, ubicación y antigüedad de lecturas. | Datos reales, simulados o de prueba y tratamiento de falta de señal. |
| Atender una alerta | Incidencia y acción registrada, si está implementado. | El registro no prueba por sí solo recuperación térmica. |
| Cliente de Carga | Consulta autorizada de sus envíos e historial, si está implementado. | Alcance real de permisos; acceso de demostración si procede. |
| Calidad | Inglés/español, vista móvil y errores relevantes. | Verificaciones efectivamente realizadas. |

No afirmar que una sesión de demostración implementa autenticación de servidor. Archivo local: **upc-pre-202620-1asi0730-8088-blackstartup-productnavigation-sprint-2.mp4**. La captura y el resumen ya están en 5.2.2.5; añadir la narración revisada y URL de Stream cuando el equipo complete esa etapa.

## 7. Consolidación de entrevistas de needfinding

Usar el [Research Interview Kit](research-interview-kit.md) y las guías de 2.2.1. Grabar entrevistas pertinentes, conservar los originales, editar aproximadamente tres a cinco minutos por entrevista e incluir nombre, segmento y fecha reales.

Preparar un único MP4. Verificar en el archivo final cada inicio y duración; los tiempos 00:40/10:42, 00:00/08:15 y 00:00/04:08 del registro anterior no son tiempos del montaje nuevo. Resolver el distrito de Jari separando residencia y operación. No cambiar el sentido de una respuesta ni añadir testimonios sintéticos.

El Anexo C pide URL privada de Microsoft Stream y captura. No publicar en cuentas externas sin autorización. Los permisos deben permitir al docente abrir el video.

## 8. Preparación del Participant Performance Report

El **Team Leader, Atauje Barreto, Alexander Sebastián**, confirmado por el equipo, completa y aprueba las responsabilidades y calificaciones. La persona que redacta el borrador no puede asignar una nota real basándose solo en conteos de commits.

- Verificar los códigos académicos. El nombre completo de Vera Solsol, Nayely Macarena está confirmado y su foto se conserva del reporte; su código completo aún debe confirmarse.
- Separar responsabilidades por entrega TB1.
- Registrar cumplimiento a tiempo, a destiempo, parcial o incumplimiento con evidencia.
- Asignar una de las calificaciones del Anexo B: **20, 16, 13, 07 o 00**.
- Exportar Word y PDF después de completar y revisar los datos.

## 9. Nomenclatura de archivos finales

Se utiliza **blackstartup** como nombre de startup, coherente con BlackStartup, y **FríoTrack** como producto.

| Entregable | Nombre |
| :--- | :--- |
| Informe | upc-pre-202620-1asi0730-8088-blackstartup-report-tb1.pdf |
| Presentación | upc-pre-202620-1asi0730-8088-blackstartup-keynote-tb1.pptx |
| Presentación PDF | upc-pre-202620-1asi0730-8088-blackstartup-keynote-tb1.pdf |
| Participación Word | upc-pre-202620-1asi0730-8088-blackstartup-performance-tb1.docx |
| Participación PDF | upc-pre-202620-1asi0730-8088-blackstartup-performance-tb1.pdf |
| Exposición | upc-pre-202620-1asi0730-8088-blackstartup-expo-tb1.mp4 |
| Complementarios | upc-pre-202620-1asi0730-8088-blackstartup-project-tb1.zip — nombre del paquete local, no nomenclatura específica del statement. |

Incluir el enlace de exposición TB1 en el anexo **Videos de Exposiciones**. Empaquetar proyectos y archivos pertinentes; excluir credenciales, dependencias instaladas y material temporal. Verificar las exportaciones visualmente antes de entregar. Un borrador con datos pendientes debe identificarse como tal.

## 10. Cierre y autorización de publicación

El equipo requiere que la aplicación se publique en **AWS o Azure**. Continuar el desarrollo local mientras se crea la cuenta; la compilación actual se puede publicar después. Actualizar el enlace de la landing y verificar la URL cloud antes de cerrar la evidencia de despliegue. Los datos locales de ejemplo no se migran automáticamente entre orígenes.

Antes de solicitar autorización para push o despliegue, mostrar cambios revisables, resultado de build y verificación de los recorridos, archivos listos para publicación y destino propuesto. La autorización se pide solo para la acción externa pendiente; no para continuar correcciones locales ya solicitadas.

Después de publicar, comprobar la landing y el frontend desde sus URLs finales, revisar redirecciones y rutas y añadir evidencia real de versión, fecha, plataforma y ejecución. Hasta entonces **Software Deployment Evidence** permanece pendiente o parcial, aun cuando el producto funcione localmente.
