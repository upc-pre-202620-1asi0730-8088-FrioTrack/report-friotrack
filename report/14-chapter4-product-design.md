# Capítulo IV: Product Design

El presente capítulo documenta las decisiones de diseño de FríoTrack, la plataforma web de BlackStartup para el monitoreo en tiempo casi real de la temperatura, la humedad y la posición de cargas refrigeradas durante el transporte terrestre. El diseño se desarrolla en dos planos complementarios. El primero corresponde al diseño de la experiencia y de la interfaz (secciones 4.1 a 4.5), que traduce a pantallas navegables el problema y los perfiles de usuario definidos en el Capítulo I. El segundo corresponde al diseño de la solución de software (secciones 4.6 a 4.8), donde se modela el dominio, se describe la arquitectura y se especifican las clases y la base de datos que sustentan esas pantallas.

Ambos planos se trabajaron de manera conjunta. Cada pantalla de la aplicación se diseñó a partir de una tarea concreta de los dos perfiles de usuario de la plataforma, el **Coordinador Logístico** (empresa de transporte refrigerado) y el **Cliente de Carga** (productor, exportador o comprador de alimentos perecibles), y cada comando o evento del modelo de dominio se relaciona con una acción visible en esas pantallas. De este modo, el enfoque de diseño centrado en las personas propuesto por la norma ISO 9241-210 (International Organization for Standardization [ISO], 2019) se mantiene desde la primera guía de estilo hasta el diagrama de la base de datos.

Los datos de ejemplo que aparecen en las imágenes (códigos de envío, placas, conductores, clientes y empresas) son ficticios y se emplean solamente para ilustrar el diseño. Los precios de los planes de la Landing Page son referenciales y están sujetos a validación con usuarios reales.

## 4.1. Style Guidelines

### 4.1.1. General Style Guidelines

La guía de estilo de FríoTrack establece los elementos visuales y de lenguaje que se aplican de manera uniforme en la Landing Page y en la Web Application. Su propósito es que la interfaz transmita seriedad y precisión, que es lo que los usuarios esperan de una herramienta que respalda la conservación de alimentos perecibles, y que la información crítica (por ejemplo, una lectura fuera de rango) pueda reconocerse sin esfuerzo. Los principios que la orientan son cuatro: consistencia entre pantallas, jerarquía visual clara, uso del color siempre acompañado de texto e ícono, y lenguaje orientado a la acción. Estos principios se apoyan en las heurísticas de usabilidad de Nielsen (1994), en particular la visibilidad del estado del sistema, la consistencia y los estándares, y la prevención de errores.

#### Logotipo

El logotipo de FríoTrack combina un isotipo y un nombre dividido cromáticamente en «Frío» y «Track». El isotipo es el mismo archivo `logo.svg` de la Landing Page y está formado por tres elementos con significado propio: un copo de nieve de seis brazos que comunica la cadena de frío, puntas de flecha en los extremos que aluden al recorrido de la unidad y un nodo central que representa el sensor que reporta las lecturas. Todo ello se inscribe en un cuadrado de esquinas redondeadas del color principal de la marca. Se definen tres versiones: la principal sobre fondo claro, una versión sobre fondo oscuro para el pie de página y una versión sobre el color de marca, además del isotipo aislado que se usa como ícono de la pestaña del navegador y de la aplicación.

**Figura 4.1**

*Logotipo de FríoTrack y sus variantes*

<p align="center">
  <img src="assets/images/chapter-4/logo-friotrack.png" alt="Logotipo de FríoTrack y sus variantes" width="900"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Tipografía

Se adopta la familia **Inter** (Andersson, s. f.) como tipografía única de la plataforma. Inter es una tipografía sans-serif de licencia SIL Open Font License 1.1, diseñada para la lectura en pantalla, que incluye los caracteres del español (tildes, «ñ», signos de apertura) y cifras tabulares. Esta última característica es relevante para FríoTrack porque las lecturas de temperatura se muestran en columnas y deben alinearse verticalmente para poder compararse de un vistazo. La escala tipográfica define nueve roles, desde el texto de encabezado de la Landing Page hasta las etiquetas de 12 px, y mantiene un interlineado mínimo de 1,5 en párrafos y de 1,3 en interfaces densas.

**Figura 4.2**

*Sistema tipográfico de FríoTrack*

<p align="center">
  <img src="assets/images/chapter-4/typography-friotrack.png" alt="Sistema tipográfico de FríoTrack" width="900"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Paleta de colores

La paleta parte de un azul frío como color principal, asociado con confianza y con la temática de refrigeración, y de un turquesa de acento para elementos decorativos. Sobre esta base se definen cuatro colores semánticos para el estado térmico de un envío: dentro del rango, advertencia, crítico y sin señal. Cada color de estado tiene tres variantes (relleno, texto seguro y tinte de fondo), de modo que el texto siempre se pinta con la variante que cumple el contraste requerido. Además, el color nunca es el único portador de información: cada estado se acompaña de un ícono y de una etiqueta de texto, lo que responde al criterio de éxito 1.4.1 (Uso del color) de las Pautas de Accesibilidad para el Contenido Web (World Wide Web Consortium [W3C], 2024).

**Tabla 4.1**

*Colores de marca, superficies y estados de FríoTrack*


| Nombre | Código | Función en la interfaz |
| :--- | :---: | :--- |
| **Primary Blue** | `#0B5ED7` | Acciones principales, enlaces y navegación activa. |
| **Blue Dark** | `#084BAE` | Estados *hover* y *pressed*; texto sobre el tinte azul. |
| **Cold Teal** | `#00B4A6` | Acento decorativo y datos secundarios (no se usa como color de texto sobre blanco). |
| **Ink** | `#0F172A` | Texto principal y encabezados. |
| **Slate** | `#64748B` | Texto secundario y etiquetas. |
| **Background** | `#F8FAFC` | Fondo general de la aplicación. |
| **Blue Tint** | `#EAF2FE` | Selección, fila activa y avisos informativos. |
| **Dentro del rango** | `#146C36` (texto) · `#E7F6EC` (tinte) | Lectura dentro del rango térmico configurado. |
| **Advertencia** | `#92400E` (texto) · `#FEF3C7` (tinte) · `#F5A524` (relleno) | Lectura cercana al límite o desvío breve. |
| **Crítico** | `#B42318` (texto) · `#FDECEE` (tinte) · `#E63946` (relleno) | Desvío que supera la tolerancia configurada. |
| **Sin señal** | `#475569` (texto) · `#EEF2F6` (tinte) · `#64748B` (relleno) | El sensor no reporta; se muestra la última lectura conocida. |

*Nota.* Elaboración propia.

Los valores de contraste se calcularon con la fórmula de luminancia relativa definida por el criterio 1.4.3 (Contraste mínimo) de las Pautas de Accesibilidad para el Contenido Web 2.2 (W3C, 2024), que exige una razón de al menos 4,5 : 1 para texto normal y de 3 : 1 para texto grande. La Tabla 4.2 resume los resultados de las combinaciones que se emplean en la interfaz.

**Tabla 4.2**

*Razón de contraste de las combinaciones de color utilizadas*


| Combinación (texto sobre fondo) | Razón | Resultado | Uso |
| :--- | :---: | :---: | :--- |
| Blanco sobre Primary Blue | 5,84 : 1 | Cumple AA | Texto de botones primarios |
| Primary Blue sobre blanco | 5,84 : 1 | Cumple AA | Enlaces y texto de acción |
| Blanco sobre Blue Dark | 7,99 : 1 | Cumple AA | Botones en estado *hover* |
| Ink sobre Background | 17,06 : 1 | Cumple AA | Texto principal |
| Slate sobre blanco | 4,76 : 1 | Cumple AA | Texto secundario |
| Slate sobre Background | 4,55 : 1 | Cumple AA | Texto secundario sobre el fondo de página |
| Blue Dark sobre Blue Tint | 7,09 : 1 | Cumple AA | Navegación activa |
| Texto de «Dentro del rango» sobre su tinte | 5,82 : 1 | Cumple AA | Chips de estado |
| Texto de «Advertencia» sobre su tinte | 6,37 : 1 | Cumple AA | Chips de estado |
| Texto de «Crítico» sobre su tinte | 5,76 : 1 | Cumple AA | Chips de estado y alertas |
| Texto de «Sin señal» sobre su tinte | 6,74 : 1 | Cumple AA | Chips de estado |
| Ink sobre Cold Teal | 6,87 : 1 | Cumple AA | Etiquetas sobre el acento |
| Blanco sobre Cold Teal | 2,60 : 1 | No cumple | Combinación prohibida para texto |

*Nota.* Razones calculadas por el equipo con la fórmula de luminancia relativa de WCAG. Elaboración propia.

**Figura 4.3**

*Paleta de colores y estados térmicos de FríoTrack*

<p align="center">
  <img src="assets/images/chapter-4/colors-friotrack.png" alt="Paleta de colores y estados térmicos de FríoTrack" width="900"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Espaciado y cuadrícula

El espaciado se basa en una cuadrícula de 8 px con un medio paso de 4 px, escala que se aplica a los componentes de la Web Application y, con valores fluidos que se ajustan al ancho de la pantalla, a la Landing Page. Los radios de borde (8 px en botones y campos, 12 px en tarjetas, 20 px en paneles grandes y circular en los chips) y tres niveles de elevación (tarjetas, controles flotantes y ventanas modales) completan el sistema. Para la maquetación se definen cuatro puntos de quiebre: móvil (360 a 767 px, cuatro columnas), tableta (768 a 1023 px, ocho columnas), laptop (1024 a 1439 px, doce columnas) y escritorio (desde 1440 px, doce columnas con un ancho máximo de 1180 px en la Landing Page). La Landing Page implementada aplica además cortes propios según su contenido: 1240 px, por debajo del cual la navegación pasa a un menú desplegable; 1000 px, donde las secciones se apilan en una columna y las tarjetas de funciones pasan a dos por fila; 720 px, donde las tarjetas ocupan todo el ancho; y 560 px, donde se compactan los bloques de equipo y de metas. Este enfoque adaptable a distintos tamaños de pantalla sigue los tres ingredientes del diseño web adaptable descritos por Marcotte (2010): cuadrículas fluidas, imágenes flexibles y consultas de medios.

**Figura 4.4**

*Sistema de espaciado, radios, elevación y puntos de quiebre*

<p align="center">
  <img src="assets/images/chapter-4/spacing-friotrack.png" alt="Sistema de espaciado, radios, elevación y puntos de quiebre" width="900"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Iconografía

La interfaz utiliza PrimeIcons, la biblioteca de íconos de PrimeVue (PrimeTek, s. f.), para la navegación y las acciones frecuentes, y la complementa con cinco íconos propios que PrimeIcons no ofrece y que son propios de la cadena de frío: temperatura, humedad, puerta abierta, copo de nieve y sin señal. Los íconos se usan en tres tamaños (16, 20 y 24 px) y se acompañan de una etiqueta de texto cuando la acción pueda resultar ambigua, como en «Descargar reporte».

**Figura 4.5**

*Sistema de iconografía de FríoTrack*

<p align="center">
  <img src="assets/images/chapter-4/iconography-friotrack.png" alt="Sistema de iconografía de FríoTrack" width="900"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Tono de comunicación y lenguaje aplicado

El tono de FríoTrack es serio pero cercano. La interfaz informa con precisión y orienta la siguiente acción, sin culpar al usuario cuando ocurre un error. Se establecen tres principios: comunicar de manera clara y profesional; ser preciso y no absoluto (se distingue entre lectura reportada, ruta planificada y llegada estimada, y no se afirma «en tiempo real» cuando el dato llegó con retraso); y orientar a la acción, mostrando primero el problema y luego qué hacer. Los textos de la interfaz se redactan en español latinoamericano (`es_419`) y en inglés (`en_US`).

**Tabla 4.3**

*Vocabulario preferido y vocabulario a evitar en la interfaz*


| Preferir | Evitar | Motivo |
| :--- | :--- | :--- |
| Lectura reportada 09:30 | Temperatura actual (cuando el dato está retrasado) | Si la lectura llegó con retraso, «actual» resulta engañoso. |
| Fuera de rango | Peligro / Emergencia | Describe el hecho sin dramatizar. |
| Sin señal del sensor | Error de conexión | Nombra la causa que el usuario puede revisar. |
| Llegada estimada | Hora de llegada exacta | La hora depende del tránsito y no es una certeza. |
| Registrar acción correctiva | Solucionar problema | Nombra la acción concreta que realiza el usuario. |
| Envío en tránsito | Camión activo | Se refiere al envío, que es la unidad del negocio. |

*Nota.* Elaboración propia.

**Figura 4.6**

*Tono de comunicación y mensajes del sistema*

<p align="center">
  <img src="assets/images/chapter-4/tone-friotrack.png" alt="Tono de comunicación y mensajes del sistema" width="900"><br>
  <i>Nota.</i> Elaboración propia.
</p>

### 4.1.2. Web Style Guidelines

Las guías de estilo web definen cómo se aplican los elementos anteriores en los componentes de interfaz de la Web Application y de la Landing Page. La Web Application se construye con Vue 3 y PrimeVue (PrimeTek, s. f.), una biblioteca de componentes que se personaliza con el tema de FríoTrack, mientras que la Landing Page, por ser un sitio estático, usa HTML, CSS y JavaScript sin bibliotecas y replica los mismos tokens mediante variables CSS, y toma como referencia Material Design 3 (Google, s. f.) para los estados de interacción, el foco y la elevación. Todos los componentes comparten los mismos tokens de color, tipografía y espaciado descritos en la sección 4.1.1, de manera que un cambio de tema se propaga a toda la plataforma.

**Tabla 4.4**

*Componentes de la interfaz web y reglas de uso*


| Componente | Variantes y estados | Regla de uso |
| :--- | :--- | :--- |
| **Botón** | Primario, contorno, neutro, texto y peligro; tamaños pequeño (32 px), estándar (40 px) y grande (48 px); estados normal, *hover*, foco, deshabilitado. | Cada vista tiene una sola acción primaria. Las acciones destructivas usan el botón de peligro y piden confirmación. |
| **Campo de formulario** | Normal, con foco (anillo azul de 3 px), con error y con texto de ayuda. | Toda etiqueta es visible y los errores se muestran junto al campo, con texto que explica cómo corregirlos. |
| **Chip de estado** | Dentro del rango, advertencia, crítico, sin señal, en tránsito, programado. | Siempre incluye ícono y texto además del color. |
| **Tarjeta de indicador (KPI)** | Ícono de color, valor numérico y etiqueta. | Se usa en el Dashboard para envíos en tránsito, alertas activas, unidades disponibles y entregas del día. |
| **Aviso (*banner*)** | Informativo, correcto, advertencia y crítico. | Comunican el estado de un envío o de una operación, por ejemplo «Sin señal desde 09:12». |
| **Tabla** | Encabezado fijo, filas seleccionables, paginación. | Los códigos y las lecturas usan cifras tabulares; toda fila navega al detalle del registro. |
| **Pestañas** | Activa, inactiva, con contador. | Organizan el detalle del envío (Resumen, Lecturas, Ruta y posiciones, Alertas, Historial de estados). |
| **Indicador de pasos** | Paso completado, actual y pendiente. | Guía el registro de un envío en cuatro pasos. |
| **Ventana modal** | Cabecera, cuerpo, pie con acciones. | Se reserva para acciones que requieren decisión, como registrar una acción correctiva. |
| **Interruptor y selector** | Activado, desactivado; opciones excluyentes. | Preferencias como las alertas por correo y el idioma (ES / EN). |

*Nota.* Elaboración propia, con base en los componentes de PrimeVue y las pautas de Material Design 3.

**Figura 4.7**

*Componentes de la interfaz web de FríoTrack*

<p align="center">
  <img src="assets/images/chapter-4/components-friotrack.png" alt="Componentes de la interfaz web de FríoTrack" width="900"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Accesibilidad.** La interfaz se diseña para cumplir el nivel AA de las Pautas de Accesibilidad para el Contenido Web 2.2 (W3C, 2024). Las decisiones concretas son las siguientes: los contrastes de la Tabla 4.2 satisfacen el criterio 1.4.3; el borde y el anillo de foco de los campos superan la razón de 3 : 1 exigida por el criterio 1.4.11 (Contraste de elementos no textuales), con 5,84 : 1 en el estado de foco y 5,76 : 1 en el estado de error; el foco del teclado es siempre visible (criterio 2.4.7); los controles táctiles miden al menos 32 px por lado, más que el mínimo de 24 px del criterio 2.5.8 (Tamaño del objetivo); y los mensajes de error identifican el campo y sugieren la corrección (criterios 3.3.1 y 3.3.3). Los componentes interactivos personalizados, como las pestañas y las ventanas modales, incorporan roles y atributos de las especificaciones WAI-ARIA 1.2 (W3C, 2023) para que los lectores de pantalla anuncien correctamente su estado.

**Punto de mejora identificado.** El borde de reposo de los campos y de los botones neutros (`#CBD5E1`) tiene una razón de contraste de solo 1,48 : 1 frente al blanco, por lo que no alcanza el 3 : 1 del criterio 1.4.11. La Landing Page implementada ya resuelve este punto: sus campos y botones de conmutación usan Slate (`#64748B`, 4,76 : 1) como borde. Los mock-ups de la Web Application conservan el tono tenue por coherencia visual con el diseño original, pero cada campo mantiene una etiqueta visible; para la implementación de la Web Application se recomienda aplicar el mismo cambio antes de la validación con usuarios.

**Internacionalización.** Todos los textos se gestionan mediante archivos de traducción para el español latinoamericano (`es_419`), idioma base del producto según el Capítulo I, y el inglés (`en_US`). El idioma inicial sigue al del navegador del usuario y puede cambiarse desde el selector ES / EN del encabezado o, en la Web Application, desde la sección Configuración; la elección se conserva para la siguiente visita.

**Diseño adaptable.** La Landing Page prioriza el contenido esencial en pantallas pequeñas, según la recomendación de Wroblewski (2011): en su versión móvil las secciones se reorganizan en una sola columna y la navegación se reduce a un menú desplegable. La Web Application ofrece dos disposiciones: en escritorio, una barra lateral de navegación con un área de trabajo de varias columnas; en móvil, una barra inferior con cuatro destinos (Panel, Envíos, Alertas y Perfil) y un panel deslizable con la lista de envíos sobre el mapa.

**Retroalimentación e interacción.** Siguiendo el principio de retroalimentación descrito por Norman (2013), toda acción del usuario recibe una respuesta visible: los botones cambian de estado al pasar el cursor, las operaciones largas (como la generación del reporte térmico) muestran un aviso de progreso y los resultados se confirman con un mensaje. Las acciones irreversibles, como cancelar un envío, solicitan confirmación previa.

## 4.2. Information Architecture

La arquitectura de información de FríoTrack define cómo se organiza, se nombra, se busca y se recorre el contenido de la plataforma. Se elaboró con base en los cuatro sistemas que proponen Rosenfeld et al. (2015) (organización, rotulado, navegación y búsqueda) y en el modelo de capas de Garrett (2011), que distingue la estructura del sitio de la interacción y de la superficie visual. La plataforma tiene dos superficies con audiencias distintas: la Landing Page, pública, cuyo objetivo es explicar la propuesta de valor y llevar al visitante al registro; y la Web Application, privada, cuyo contenido depende del perfil del usuario autenticado.

### 4.2.1. Organization Systems

FríoTrack combina una **estructura jerárquica** con **flujos secuenciales**. La jerarquía agrupa el contenido en pocas categorías principales, siete para el Coordinador Logístico y cuatro para el Cliente de Carga, cada una con subniveles propios. Los flujos secuenciales se reservan para tareas que deben completarse en orden y con validación en cada paso, como el registro de un envío en cuatro pasos (carga y rango térmico, ruta y horario, unidad y conductor, revisión). Esta decisión responde a que la jerarquía facilita ubicar la información, mientras que la secuencia reduce errores en tareas de alto costo, como programar un traslado con una unidad equivocada.

El contenido se organiza mediante cuatro esquemas de organización, cada uno aplicado en las pantallas donde resulta más natural para el usuario:

**Tabla 4.5**

*Esquemas de organización aplicados en FríoTrack*


| Esquema | Criterio de agrupación | Dónde se aplica |
| :--- | :--- | :--- |
| **Por audiencia** | Perfil del usuario | Landing Page («Para quién») y menú lateral de la aplicación, que muestra siete opciones al Coordinador Logístico y cuatro al Cliente de Carga. |
| **Por tarea** | Lo que el usuario necesita hacer | Menú del Coordinador Logístico: Envíos (programar y seguir), Vehículos y Conductores (administrar la flota), Historial (auditar). |
| **Cronológico** | Fecha y hora del evento | Historial de envíos, historial de estados de un envío, lista de notificaciones agrupada por día y gráfico de lecturas de las últimas 12 horas. |
| **Por estado** | Situación del envío o de la alerta | Chips de estado (programado, en tránsito, entregado, cancelado) y de estado térmico (dentro del rango, advertencia, crítico, sin señal); filtros de las listas. |

*Nota.* Elaboración propia, con base en los esquemas de organización de Rosenfeld et al. (2015).

Los dos mapas del sitio que se muestran a continuación resumen la estructura resultante. El primero corresponde a la Landing Page, que se organiza en una página principal de doce secciones, una página de términos y condiciones y una ventana modal con dos puntos de entrada a la aplicación (Iniciar sesión y Registrarse). El segundo muestra la Web Application, con una zona pública de acceso y cuenta, y dos ramas privadas, una por perfil.

**Figura 4.8**

*Mapa del sitio de la Landing Page*

<p align="center">
  <img src="assets/images/chapter-4/ia-landing-sitemap.png" alt="Mapa del sitio de la Landing Page" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.9**

*Mapa del sitio de la Web Application por perfil de usuario*

<p align="center">
  <img src="assets/images/chapter-4/ia-webapp-sitemap.png" alt="Mapa del sitio de la Web Application por perfil de usuario" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

Con esta estructura se aplican los principios de claridad, navegación enfocada y facilidad de uso: el Cliente de Carga nunca ve opciones de administración de flota que no puede usar, y el Coordinador Logístico accede a cada función operativa con una sola selección del menú lateral, sin menús anidados.

> **Enlace al diagrama de arquitectura de información (Miro):** pendiente de completar por el equipo.

### 4.2.2. Labeling Systems

El sistema de rotulado de FríoTrack usa una sola palabra o una frase corta y estable para nombrar cada función, y emplea la misma etiqueta en el menú, en el título de la pantalla y en el encabezado de la ruta de navegación (*breadcrumb*). Las etiquetas de acción usan verbos en infinitivo o imperativo que nombran el resultado («Registrar acción correctiva», «Descargar reporte térmico»). La plataforma soporta español latinoamericano (`es_419`), idioma base del producto, e inglés (`en_US`), de modo que la terminología se mantiene uniforme en ambos idiomas.

**Tabla 4.6**

*Etiquetas de navegación y su descripción*


| Inglés (`en_US`) | Español latinoamericano (`es_419`) | Descripción |
| :--- | :--- | :--- |
| **Home** | Inicio | Presenta la propuesta de valor de FríoTrack y el panel simulado de una unidad refrigerada. |
| **About us** | Quiénes somos | Presenta al equipo BlackStartup, su misión y su visión. |
| **What we do** | Lo que hacemos | Explica las capacidades de la plataforma: panel en tiempo casi real, alertas, historial, mapa, flota, búsqueda y avisos. |
| **How it works** | Cómo funciona | Resume en cuatro pasos cómo empezar a usar la plataforma. |
| **Who it's for** | Para quién | Describe los dos segmentos de usuarios y lo que cada uno obtiene de la plataforma. |
| **Pricing** | Planes | Muestra los tres planes referenciales según el tamaño de la flota. |
| **Team** | Equipo | Presenta a los cinco integrantes del equipo y su rol. |
| **Contact** | Contacto | Ofrece un formulario para comunicarse con el equipo. |
| **Terms and conditions** | Términos y condiciones | Presenta las condiciones generales del servicio. |
| **Log in** | Iniciar sesión | Permite a un usuario registrado ingresar a su cuenta. |
| **Sign up** | Registrarse | Inicia la creación de una cuenta. |
| **Dashboard** | Dashboard | Muestra el mapa de unidades activas, los indicadores y los envíos que requieren atención. |
| **Shipments** | Envíos | Lista, busca y registra envíos; da acceso al detalle de cada uno. |
| **Vehicles** | Vehículos | Administra las unidades refrigeradas y su sensor asignado. |
| **Drivers** | Conductores | Administra los conductores y su disponibilidad. |
| **History** | Historial | Consulta envíos anteriores y descarga sus reportes térmicos. |
| **Notifications** | Notificaciones | Reúne los avisos de alertas, incidencias y entregas. |
| **Settings** | Configuración | Gestiona el perfil, la contraseña y el idioma. |
| **Incoming shipments** | Envíos por recibir | Lista los envíos asociados al Cliente de Carga que están programados o en tránsito. |

*Nota.* Elaboración propia.

Además de las etiquetas de navegación, la plataforma define un vocabulario controlado para los estados, que se usa de forma idéntica en chips, filtros, notificaciones y reportes.

**Tabla 4.7**

*Vocabulario controlado de estados*


| Dominio | Inglés (`en_US`) | Español latinoamericano (`es_419`) |
| :--- | :--- | :--- |
| **Estado del envío** | Draft · Scheduled · In transit · Delivered · Cancelled | Borrador · Programado · En tránsito · Entregado · Cancelado |
| **Estado térmico** | Within range · Warning · Critical · No signal | Dentro del rango · Advertencia · Crítico · Sin señal |
| **Estado de la alerta** | Active · Acknowledged · Resolved | Activa · Reconocida · Resuelta |
| **Estado de la unidad** | Available · In transit · In maintenance | Disponible · En tránsito · En mantenimiento |

*Nota.* Elaboración propia.

### 4.2.3. SEO Tags and Meta Tags

Los SEO Tags y Meta Tags de FríoTrack describen el contenido de cada página al navegador y a los motores de búsqueda. Se distinguen dos casos. La Landing Page y las páginas de acceso son públicas y se optimizan para el posicionamiento, con términos como cadena de frío, transporte refrigerado, monitoreo de temperatura y trazabilidad. Las vistas de la Web Application requieren autenticación, por lo que sus metadatos solo sirven para identificar la pestaña del navegador y **no deben indexarse**: se marcan con la directiva `noindex` de la etiqueta *robots* (Google Search Central, s. f.). Los metadatos no reemplazan los mecanismos de autenticación y autorización de la plataforma.

**Tabla 4.8**

*Etiquetas title, description, keywords, author y robots por página*


| Página | Title | Description | Keywords | Author | Robots |
| :--- | :--- | :--- | :--- | :--- | :---: |
| **Landing Page** | FríoTrack \| Monitoreo de la cadena de frío en transporte | Monitorea en tiempo casi real la temperatura, la humedad y la ubicación de tus unidades refrigeradas. Recibe alertas y consulta el historial del viaje. | cadena de frío, transporte refrigerado, monitoreo de temperatura, trazabilidad, alertas, Perú | BlackStartup | `index, follow` |
| **Iniciar sesión / Registro** | Accede a FríoTrack \| Iniciar sesión o registrarse | Inicia sesión o crea tu cuenta de Coordinador Logístico o de Cliente de Carga en FríoTrack. | FríoTrack, iniciar sesión, registro, coordinador logístico, cliente de carga | BlackStartup | `index, follow` |
| **Recuperar contraseña** | Recuperar contraseña \| FríoTrack | Solicita un enlace para restablecer la contraseña de tu cuenta de FríoTrack. | recuperar contraseña, FríoTrack | BlackStartup | `noindex, nofollow` |
| **Dashboard** | Dashboard \| FríoTrack | Consulta las unidades activas, los envíos en tránsito y las alertas que requieren atención. | dashboard, envíos, alertas, unidades activas | BlackStartup | `noindex, nofollow` |
| **Envíos** | Envíos \| FríoTrack | Busca, programa y da seguimiento a los envíos refrigerados de tu empresa. | envíos, transporte refrigerado, seguimiento | BlackStartup | `noindex, nofollow` |
| **Detalle del envío** | Envío FT-2418 \| FríoTrack | Revisa las lecturas de temperatura y humedad, la ruta y las alertas del envío. | detalle del envío, lecturas, ruta, alertas | BlackStartup | `noindex, nofollow` |
| **Historial** | Historial de envíos \| FríoTrack | Consulta envíos anteriores y descarga sus reportes térmicos. | historial, reporte térmico, envíos entregados | BlackStartup | `noindex, nofollow` |
| **Configuración** | Configuración \| FríoTrack | Administra tu perfil, tu contraseña y el idioma de la plataforma. | perfil, configuración, idioma | BlackStartup | `noindex, nofollow` |

*Nota.* El *title* de la vista de detalle incluye el código del envío que se está consultando. Elaboración propia.

Los títulos se limitan a un máximo aproximado de 60 caracteres y las descripciones a unos 160 caracteres, longitudes que evitan que los resultados de búsqueda se trunquen. Todas las páginas declaran la codificación de caracteres, el atributo `lang` de la etiqueta `html` según el idioma elegido (`es-419` o `en`) y la etiqueta *viewport*, indispensable para que la interfaz se adapte a pantallas móviles. La Landing Page incorpora además las etiquetas *Open Graph* (`og:title`, `og:description`, `og:image` y `og:type`) para que el enlace se muestre con una vista previa al compartirse en redes y mensajería; la imagen de vista previa usa la dirección absoluta que exige ese mecanismo. Al cambiar de idioma con el selector, la Landing Page actualiza también el título, la descripción y las etiquetas Open Graph. A modo de ejemplo, el encabezado de la Landing Page se define así:

```html
<html lang="es-419">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FríoTrack | Monitoreo de la cadena de frío en transporte</title>
  <meta name="description" content="Monitorea en tiempo casi real la temperatura, la humedad y la ubicación de tus unidades refrigeradas. Recibe alertas y consulta el historial del viaje.">
  <meta name="keywords" content="cadena de frío, transporte refrigerado, monitoreo de temperatura, trazabilidad, alertas, Perú">
  <meta name="author" content="BlackStartup">
  <meta name="robots" content="index, follow">
  <meta name="theme-color" content="#0F172A">
  <meta property="og:type" content="website">
  <meta property="og:site_name" content="FríoTrack">
  <meta property="og:title" content="FríoTrack | Monitoreo de la cadena de frío en transporte">
  <meta property="og:description" content="Sabe en todo momento si tu carga refrigerada sigue en rango.">
  <meta property="og:image" content="https://upc-pre-202620-1asi0730-8088-friotrack.github.io/friotrack-landing/assets/images/og-friotrack.png">
  <meta name="twitter:card" content="summary_large_image">
</head>
```

### 4.2.4. Searching Systems

Los mecanismos de búsqueda y filtrado de FríoTrack permiten localizar un envío, una unidad o un conductor sin recorrer manualmente listas extensas. Todas las búsquedas se ejecutan únicamente sobre los registros que el usuario tiene autorizados: el Coordinador Logístico consulta los envíos, unidades y conductores de su empresa, y el Cliente de Carga solo los envíos en los que figura como destinatario. La barra de búsqueda global del encabezado y las barras propias de cada lista comparten el mismo comportamiento.

#### Searching System para envíos

La lista de envíos incluye una barra de búsqueda de texto libre. Se busca de manera parcial y sin distinguir mayúsculas de minúsculas.

**Tabla 4.9**

*Criterios de búsqueda de la lista de envíos*


| Criterio | Descripción |
| :--- | :--- |
| **Código de envío** | Localiza un envío por su identificador, por ejemplo «FT-2418». |
| **Placa del vehículo** | Localiza los envíos que usan una unidad determinada. |
| **Destino** | Localiza los envíos cuyo destino coincide con el texto ingresado. |
| **Cliente de Carga** | Localiza los envíos asignados a un cliente (solo para el Coordinador Logístico). |

*Nota.* Elaboración propia.

Los resultados muestran el código, la carga y su rango térmico, la ruta, la unidad y el conductor, la última lectura, el estado térmico, el estado del envío y la llegada estimada. Cuando no existen coincidencias, la lista presenta un mensaje que indica que no se encontraron envíos para el criterio ingresado y ofrece la acción «Limpiar búsqueda».

#### Searching System mediante filtros

Los filtros complementan la búsqueda de texto y reducen la lista según atributos concretos. Pueden combinarse y, cuando se usa más de uno, la lista muestra solo los registros que cumplen todas las condiciones.

**Tabla 4.10**

*Filtros disponibles por lista*


| Filtro | Descripción | Lista donde se ofrece |
| :--- | :--- | :--- |
| **Estado** | Programado, En tránsito, Entregado o Cancelado. | Envíos, Historial |
| **Estado térmico** | Dentro del rango, Advertencia, Crítico o Sin señal. | Envíos, Envíos por recibir |
| **Producto o tipo de carga** | Limita la lista a una carga determinada, por ejemplo arándanos o palta Hass. | Envíos, Historial |
| **Destino** | Limita la lista a los envíos que llegan a una ubicación. | Envíos, Historial |
| **Rango de fechas** | Fecha inicial y final de salida o de entrega. | Historial |
| **Estado de la unidad** | Disponible, En tránsito o En mantenimiento. | Vehículos |

*Nota.* Elaboración propia.

La interfaz muestra los filtros activos como chips que pueden quitarse de a uno y ofrece la acción «Limpiar filtros» para volver a la lista completa. Al regresar desde el detalle de un envío a la lista, los filtros y la búsqueda se conservan, para evitar que el usuario tenga que repetirlos.

#### Searching System para el Coordinador Logístico y para el Cliente de Carga

El Coordinador Logístico dispone de búsqueda y filtros en Envíos, Vehículos (por placa o marca), Conductores (por nombre o licencia) e Historial, y además de la barra global del encabezado, que lleva directamente al detalle de un envío. Esto responde a la hipótesis de uso del Capítulo I sobre la localización de envíos, unidades o rutas en segundos.

El Cliente de Carga dispone de los mismos mecanismos básicos, pero solo en Envíos por recibir e Historial y limitados a los envíos que le fueron asignados. No puede buscar unidades ni conductores, ya que esa información pertenece a la empresa de transporte.

### 4.2.5. Navigation Systems

El sistema de navegación permite recorrer la plataforma de forma clara, predecible y coherente con el perfil del usuario. Se compone de tres tipos de navegación (global, local y contextual) que siguen la clasificación de Rosenfeld et al. (2015), y de elementos de apoyo, como la ruta de navegación, la barra de búsqueda, el selector de idioma y el ícono de notificaciones con contador de avisos sin leer.

#### Navigation System de la Landing Page

La Landing Page usa una barra horizontal en escritorio y un menú desplegable en móviles. El enlace «Iniciar sesión» y el botón «Registrarse» se mantienen visibles en todo momento, ya que son las dos acciones que persiguen los visitantes.

**Tabla 4.11**

*Opciones de navegación de la Landing Page*


| Nombre | Descripción |
| :--- | :--- |
| **Inicio / Home** | Lleva a la sección principal con la propuesta de valor y los llamados a la acción. |
| **Quiénes somos / About us** | Desplaza a la presentación del equipo con su misión y su visión. |
| **Lo que hacemos / What we do** | Desplaza a la sección con las siete funcionalidades de la plataforma. |
| **Planes / Pricing** | Desplaza a los tres planes referenciales. |
| **Equipo / Team** | Desplaza a la sección con los cinco integrantes del equipo. |
| **Contacto / Contact** | Desplaza al formulario de contacto. |
| **Ver cómo funciona** | Botón del héroe: desplaza a la sección de los cuatro pasos. |
| **Términos y condiciones** | Abre la página con las condiciones generales del servicio (pie de página). |
| **ES \| EN** | Cambia el idioma de la Landing Page. |
| **Iniciar sesión / Log in** | Abre la ventana modal de inicio de sesión. |
| **Registrarse / Sign up** | Abre la ventana modal de creación de cuenta. |

*Nota.* Elaboración propia.

Las secciones «Cómo funciona», «Para quién», «Corredores» y «Metas» no figuran en la barra superior para no sobrecargarla con más de seis enlaces. Se alcanzan con el desplazamiento y, en el caso de las dos primeras, con el botón «Ver cómo funciona» del héroe y con los enlaces del pie de página. La ventana modal de acceso es provisional: en la versión final, «Iniciar sesión» y «Registrarse» conducirán a las pantallas de acceso de la Web Application (sección 4.4), donde el usuario elige su perfil (Coordinador Logístico o Cliente de Carga). Esa elección solo orienta el registro; no otorga privilegios ni reemplaza la autenticación.

#### Navigation System para el Coordinador Logístico

El Coordinador Logístico navega mediante una barra lateral fija en escritorio (que se reemplaza por una barra inferior de cuatro destinos en móvil) y un encabezado con búsqueda global, selector de idioma, notificaciones y menú de la cuenta.

**Tabla 4.12**

*Navegación principal del Coordinador Logístico*


| Nombre | Descripción |
| :--- | :--- |
| **Dashboard** | Resume las unidades activas en el mapa, los indicadores y los envíos que requieren atención. |
| **Envíos / Shipments** | Lista los envíos, permite programar uno nuevo y da acceso a su detalle. |
| **Vehículos / Vehicles** | Registra y actualiza las unidades refrigeradas y su sensor. |
| **Conductores / Drivers** | Registra conductores y muestra su disponibilidad. |
| **Historial / History** | Consulta envíos concluidos y sus reportes térmicos. |
| **Notificaciones / Notifications** | Muestra los avisos de alertas, incidencias y entregas, con contador de avisos sin leer. |
| **Configuración / Settings** | Gestiona el perfil, la contraseña y el idioma. |

*Nota.* Elaboración propia.

Las acciones que dependen del estado del envío no forman parte de la navegación principal, sino que aparecen dentro del detalle solo cuando corresponden: *Iniciar traslado* (envío programado), *Registrar acción correctiva* (alerta activa), *Registrar incidencia*, *Marcar como entregado* (envío en tránsito), *Cancelar envío* (envío programado o en tránsito) y *Descargar reporte térmico* (envío entregado).

#### Navigation System para el Cliente de Carga

La interfaz del Cliente de Carga se centra en consultar y verificar. Su menú tiene solo cuatro opciones, todas de lectura, y no incluye funciones de creación ni de administración.

**Tabla 4.13**

*Navegación principal del Cliente de Carga*


| Nombre | Descripción |
| :--- | :--- |
| **Envíos por recibir / Incoming shipments** | Muestra en el mapa y en una lista los envíos asignados al cliente. |
| **Historial / History** | Consulta envíos anteriores y descarga sus reportes térmicos. |
| **Notificaciones / Notifications** | Presenta los avisos de incidencias y de cambios de estado de sus envíos. |
| **Configuración / Settings** | Gestiona el perfil, la contraseña y el idioma. |

*Nota.* Elaboración propia.

La vista de detalle del Cliente de Carga incluye un aviso permanente de «Vista de solo lectura», que indica que las acciones operativas las gestiona la empresa de transporte.

#### Navigation System del detalle de un envío

Dentro del detalle de cada envío se usa navegación local mediante pestañas que organizan la información en cinco secciones. La pestaña Alertas muestra un contador cuando existen alertas activas.

**Tabla 4.14**

*Pestañas del detalle de un envío*


| Nombre | Descripción |
| :--- | :--- |
| **Resumen / Summary** | Presenta los indicadores principales (temperatura, humedad, última lectura y llegada estimada), el gráfico de lecturas y el mapa. |
| **Lecturas / Readings** | Muestra la serie completa de lecturas de temperatura y humedad con su hora. |
| **Ruta y posiciones / Route and positions** | Muestra la ruta planificada y las posiciones reportadas con su fecha y fuente. |
| **Alertas / Alerts** | Lista las alertas del envío y permite registrar la acción correctiva. |
| **Historial de estados / Status history** | Presenta cronológicamente los cambios de estado del envío. |

*Nota.* Elaboración propia.

La información geográfica indica de forma explícita si corresponde a una ruta planificada o a una posición reportada, con su hora y fuente, de modo que una posición estimada no se presente como seguimiento continuo. La ruta de navegación (por ejemplo, Envíos › FT-2421) permite retroceder un nivel en cualquier momento.

## 4.3. Landing Page UI Design

La Landing Page es la primera interacción de un potencial usuario con FríoTrack. Su diseño busca que el visitante comprenda en pocos segundos qué problema resuelve la plataforma, para quién está pensada y cómo comenzar. Para lograrlo se recurre a un recorrido vertical de doce secciones que se puede recorrer con la vista, en línea con la observación de Krug (2014) de que los usuarios de la web escanean las páginas en lugar de leerlas completas. Cada sección tiene un único propósito y un titular que se entiende por sí solo, y la barra de navegación permite saltar directamente a las secciones principales.

La Landing Page se implementó con HTML, CSS y JavaScript sin bibliotecas externas y se publica en el repositorio `friotrack-landing` del equipo. Las capturas de este capítulo corresponden a esa implementación, de modo que el diseño que se documenta es el mismo que se entrega. La franja de cargas que se ubica bajo el héroe se documenta dentro de la sección 1, porque forma con él un solo bloque visual, y por eso el recorrido se mantiene en doce secciones.

**Tabla 4.15**

*Secciones de la Landing Page y su propósito*


| N.º | Sección | Propósito | Contenido principal |
| :---: | :--- | :--- | :--- |
| 1 | **Encabezado y héroe** | Explicar la propuesta de valor y dirigir a la acción. | Barra de navegación con logotipo, seis enlaces (Inicio, Quiénes somos, Lo que hacemos, Planes, Equipo, Contacto), «Iniciar sesión», «Registrarse» y selector ES | EN; titular «Tu carga perecible, vigilada en cada kilómetro», con la segunda línea en degradado turquesa y azul; botones «Probar FríoTrack» y «Ver cómo funciona»; tres beneficios con ícono; panel simulado de una unidad con lecturas de temperatura y humedad y un botón para simular una falla del equipo de frío. La barra de navegación es transparente sobre el fondo azul noche del héroe y pasa a fondo blanco al desplazarse. Al pie del bloque, una franja con las cargas que se cuidan en ruta (arándanos, espárragos, palta, uva, mango, banano orgánico, cítricos y productos hidrobiológicos). |
| 2 | **El problema** | Justificar la necesidad con datos verificables. | Tres indicadores: puesto 61 de 139 en el Índice de Desempeño Logístico (Banco Mundial, 2023), más de 12 millones de toneladas de alimentos perdidas en la cadena productiva peruana (Organización de las Naciones Unidas para la Alimentación y la Agricultura [FAO], 2022) y 41 corredores logísticos identificados (Ministerio de Transportes y Comunicaciones [MTC], 2023); comparación entre «Hoy, en ruta» (tarjeta de borde punteado) y «Con FríoTrack» (tarjeta azul noche). |
| 3 | **Quiénes somos** | Presentar al equipo y su propósito. | Descripción de BlackStartup como empresa de base tecnológica peruana, misión y visión definidas en el Capítulo I, cada una en una tarjeta con ícono. |
| 4 | **Lo que hacemos** | Detallar las capacidades. | Siete tarjetas en una cuadrícula tipo *bento* sobre fondo azul noche: panel en tiempo casi real, alertas automáticas, historial térmico, mapa de rutas, flota y conductores, búsqueda y filtros, y avisos dentro de la aplicación. Cada tarjeta incluye una mini-interfaz ilustrativa del producto. |
| 5 | **Cómo funciona** | Mostrar que el uso es simple. | Cuatro tarjetas numeradas: registrar la flota, definir los rangos seguros, seguir cada viaje, y actuar y demostrar. |
| 6 | **Corredores** | Delimitar la zona inicial de operación. | Cuatro corredores (Piura, Lambayeque, La Libertad e Ica) hacia Lima y el Callao, con la carga típica de cada uno y un esquema animado de la ruta seleccionada sobre un mapa de fondo oscuro. |
| 7 | **Para quién** | Segmentar a la audiencia. | Un selector segmentado con dos pestañas, una por segmento (empresas de transporte refrigerado; productores, exportadores y compradores), cada una con una tarjeta de lo que les preocupa y otra, azul noche, con lo que obtienen con FríoTrack. |
| 8 | **Planes** | Presentar la oferta comercial referencial. | Plan Básico (S/ 79 al mes, hasta 5 unidades), Plan Profesional (S/ 199 al mes, hasta 25 unidades, recomendado) y Plan Empresarial (a medida, más de 25 unidades); selector mensual o anual (dos meses gratis). |
| 9 | **Metas** | Comunicar los compromisos de medición. | Cuatro metas del Capítulo I, en una franja azul noche: 150 usuarios activos en ocho meses, retención mensual superior a 75 %, 30 % menos incidentes de ruptura de la cadena de frío y un Net Promoter Score mayor a 40. |
| 10 | **Equipo** | Dar a conocer a las personas detrás del producto. | Cinco integrantes, cada uno en una tarjeta con su rol, su descripción y su fotografía o, en su defecto, sus iniciales. |
| 11 | **Contacto** | Captar el interés del visitante. | Formulario sobre fondo azul noche con nombres y apellidos, empresa, correo, celular y perfil («Soy…»), y tres beneficios de la demostración. |
| 12 | **Pie de página** | Ofrecer navegación secundaria y datos legales. | Logotipo, descripción breve, enlaces de Producto, Empresa y Legal (Términos y condiciones, Protección de datos), derechos reservados y referencia al curso. |

*Nota.* Los precios son referenciales y están sujetos a validación con usuarios reales. Elaboración propia.

Los indicadores de la sección 2 provienen de las mismas fuentes utilizadas en el Capítulo I, de modo que el discurso de la Landing Page es coherente con el análisis del problema. La sección 7 refleja los dos segmentos objetivo definidos en ese capítulo, y la sección 9 repite los criterios de éxito de la visión de negocio. Además de la página principal existe una página de Términos y condiciones, con nueve cláusulas en español e inglés, a la que se llega desde el pie de página y desde el formulario de registro.

### 4.3.1. Landing Page Wireframe

Los wireframes de la Landing Page se elaboraron en escala de grises para concentrar la revisión en la estructura, la jerarquía y la ubicación de los elementos, sin la influencia del color ni de la identidad visual (Buxton, 2007). El logotipo y las fotografías aparecen como espacios reservados, los íconos como círculos y los gráficos como recuadros con su descripción. Se diseñaron una versión de escritorio, con un ancho de 1440 px, y una versión móvil de 390 px, en la que las columnas se apilan y la navegación se reduce a un menú desplegable.

#### Wireframes de escritorio

**Figura 4.10**

*Wireframe de escritorio · Sección 1: encabezado y héroe*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-1.png" alt="Wireframe de escritorio · Sección 1: encabezado y héroe" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.11**

*Wireframe de escritorio · Sección 2: el problema*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-2.png" alt="Wireframe de escritorio · Sección 2: el problema" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.12**

*Wireframe de escritorio · Sección 3: quiénes somos*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-3.png" alt="Wireframe de escritorio · Sección 3: quiénes somos" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.13**

*Wireframe de escritorio · Sección 4: lo que hacemos*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-4.png" alt="Wireframe de escritorio · Sección 4: lo que hacemos" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.14**

*Wireframe de escritorio · Sección 5: cómo funciona*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-5.png" alt="Wireframe de escritorio · Sección 5: cómo funciona" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.15**

*Wireframe de escritorio · Sección 6: corredores*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-6.png" alt="Wireframe de escritorio · Sección 6: corredores" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.16**

*Wireframe de escritorio · Sección 7: para quién*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-7.png" alt="Wireframe de escritorio · Sección 7: para quién" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.17**

*Wireframe de escritorio · Sección 8: planes*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-8.png" alt="Wireframe de escritorio · Sección 8: planes" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.18**

*Wireframe de escritorio · Sección 9: metas*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-9.png" alt="Wireframe de escritorio · Sección 9: metas" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.19**

*Wireframe de escritorio · Sección 10: equipo*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-10.png" alt="Wireframe de escritorio · Sección 10: equipo" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.20**

*Wireframe de escritorio · Sección 11: contacto*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-11.png" alt="Wireframe de escritorio · Sección 11: contacto" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.21**

*Wireframe de escritorio · Sección 12: pie de página*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-desktop-12.png" alt="Wireframe de escritorio · Sección 12: pie de página" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Wireframes móviles

Las doce secciones se presentan a continuación en tres filas, en el mismo orden de la versión de escritorio (secciones 1 a 4, 5 a 8 y 9 a 12).

**Figura 4.22**

*Wireframes móviles · Secciones 1 a 4*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-1.png" alt="Wireframes móviles · Secciones 1 a 4" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-2.png" alt="Wireframes móviles · Secciones 1 a 4" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-3.png" alt="Wireframes móviles · Secciones 1 a 4" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-4.png" alt="Wireframes móviles · Secciones 1 a 4" width="200"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.23**

*Wireframes móviles · Secciones 5 a 8*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-5.png" alt="Wireframes móviles · Secciones 5 a 8" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-6.png" alt="Wireframes móviles · Secciones 5 a 8" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-7.png" alt="Wireframes móviles · Secciones 5 a 8" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-8.png" alt="Wireframes móviles · Secciones 5 a 8" width="200"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.24**

*Wireframes móviles · Secciones 9 a 12*

<p align="center">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-9.png" alt="Wireframes móviles · Secciones 9 a 12" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-10.png" alt="Wireframes móviles · Secciones 9 a 12" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-11.png" alt="Wireframes móviles · Secciones 9 a 12" width="200">
  <img src="assets/images/chapter-4/landing-wireframe-mobile-12.png" alt="Wireframes móviles · Secciones 9 a 12" width="200"><br>
  <i>Nota.</i> Elaboración propia.
</p>

### 4.3.2. Landing Page Mock-up

Los mock-ups aplican sobre los wireframes la identidad visual definida en la sección 4.1: la paleta azul y turquesa, la tipografía Inter y el logotipo. Se mantienen la estructura y las posiciones validadas en los wireframes, de manera que las diferencias entre ambas versiones son únicamente de superficie visual. Para dar una sensación de frío y de precisión, la Landing Page alterna secciones oscuras (héroe, funciones, metas y contacto) con secciones claras sobre blanco y sobre un fondo «hielo», y usa tarjetas de radio de 20 px, mini-interfaces del producto y una elevación suave. Las capturas se tomaron de la Landing Page implementada, con datos ficticios: el panel de la sección 1 es una simulación que muestra cómo se ve una lectura dentro del rango y cómo llega una alerta cuando la temperatura supera el máximo de 4 °C.

La Landing Page amplía la paleta de la sección 4.1.1 con cinco tonos derivados que no se usan en la Web Application: Night (`#06132B`) y Night 2 (`#0A2247`), para los fondos oscuros; Ice (`#EEF4FC`), para las secciones claras alternas; y Aqua (`#5EEAD4`) y Sky (`#7DB4FF`), versiones claras del turquesa y del azul que solo se emplean como texto o trazo sobre fondo oscuro. Sus razones de contraste sobre Night son de 12,5 : 1 (Aqua) y 8,7 : 1 (Sky), y el texto secundario claro (`#CBD5E1`) alcanza 12,5 : 1, por lo que superan el mínimo de 4,5 : 1 del criterio 1.4.3. El texto secundario de las secciones claras usa `#475569`, con 7,6 : 1 sobre blanco y 6,9 : 1 sobre Ice, y los rótulos en azul sobre Ice alcanzan 5,3 : 1.

#### Mock-ups de escritorio

**Figura 4.25**

*Mock-up de escritorio · Sección 1: encabezado y héroe*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-1.png" alt="Mock-up de escritorio · Sección 1: encabezado y héroe" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.26**

*Mock-up de escritorio · Sección 2: el problema*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-2.png" alt="Mock-up de escritorio · Sección 2: el problema" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.27**

*Mock-up de escritorio · Sección 3: quiénes somos*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-3.png" alt="Mock-up de escritorio · Sección 3: quiénes somos" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.28**

*Mock-up de escritorio · Sección 4: lo que hacemos*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-4.png" alt="Mock-up de escritorio · Sección 4: lo que hacemos" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.29**

*Mock-up de escritorio · Sección 5: cómo funciona*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-5.png" alt="Mock-up de escritorio · Sección 5: cómo funciona" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.30**

*Mock-up de escritorio · Sección 6: corredores*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-6.png" alt="Mock-up de escritorio · Sección 6: corredores" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.31**

*Mock-up de escritorio · Sección 7: para quién*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-7.png" alt="Mock-up de escritorio · Sección 7: para quién" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.32**

*Mock-up de escritorio · Sección 8: planes*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-8.png" alt="Mock-up de escritorio · Sección 8: planes" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.33**

*Mock-up de escritorio · Sección 9: metas*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-9.png" alt="Mock-up de escritorio · Sección 9: metas" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.34**

*Mock-up de escritorio · Sección 10: equipo*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-10.png" alt="Mock-up de escritorio · Sección 10: equipo" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.35**

*Mock-up de escritorio · Sección 11: contacto*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-11.png" alt="Mock-up de escritorio · Sección 11: contacto" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.36**

*Mock-up de escritorio · Sección 12: pie de página*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-desktop-12.png" alt="Mock-up de escritorio · Sección 12: pie de página" width="850"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Mock-ups móviles

**Figura 4.37**

*Mock-ups móviles · Secciones 1 a 4*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-mobile-1.png" alt="Mock-ups móviles · Secciones 1 a 4" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-2.png" alt="Mock-ups móviles · Secciones 1 a 4" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-3.png" alt="Mock-ups móviles · Secciones 1 a 4" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-4.png" alt="Mock-ups móviles · Secciones 1 a 4" width="200"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.38**

*Mock-ups móviles · Secciones 5 a 8*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-mobile-5.png" alt="Mock-ups móviles · Secciones 5 a 8" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-6.png" alt="Mock-ups móviles · Secciones 5 a 8" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-7.png" alt="Mock-ups móviles · Secciones 5 a 8" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-8.png" alt="Mock-ups móviles · Secciones 5 a 8" width="200"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.39**

*Mock-ups móviles · Secciones 9 a 12*

<p align="center">
  <img src="assets/images/chapter-4/landing-mockup-mobile-9.png" alt="Mock-ups móviles · Secciones 9 a 12" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-10.png" alt="Mock-ups móviles · Secciones 9 a 12" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-11.png" alt="Mock-ups móviles · Secciones 9 a 12" width="200">
  <img src="assets/images/chapter-4/landing-mockup-mobile-12.png" alt="Mock-ups móviles · Secciones 9 a 12" width="200"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Comportamiento interactivo

La Landing Page incluye interacciones que los mock-ups estáticos no muestran. La Tabla 4.16 las resume.

**Tabla 4.16**

*Interacciones de la Landing Page*


| Elemento | Comportamiento |
| :--- | :--- |
| **Selector ES \| EN** | Cambia todos los textos, los formatos numéricos y los metadatos de la página. El idioma inicial sigue al del navegador y se recuerda en el equipo del visitante. |
| **Panel simulado (sección 1)** | El botón «Simular falla del equipo de frío» eleva la temperatura por encima de 4 °C, muestra la alerta con la hora y el aviso al coordinador logístico y al cliente de carga, y al restablecer la refrigeración registra el incidente en el historial. Los datos son ficticios. |
| **Corredores (sección 6)** | Al elegir un corredor se resalta su ruta hacia Lima, se anima el recorrido del camión y se muestra la carga típica. |
| **Pestañas «Para quién» (sección 7)** | Alternan entre los dos segmentos con el ratón o con las teclas de flecha, Inicio y Fin. |
| **Planes (sección 8)** | El selector Mensual \| Anual actualiza los precios (el plan anual equivale a diez mensualidades). |
| **Formulario de contacto (sección 11)** | Valida los campos obligatorios y confirma en pantalla. Mientras no exista un servicio que reciba los datos, la confirmación aclara que es una versión demostrativa y que la información no se envía. |
| **Iniciar sesión y Registrarse** | Abren una ventana modal. El inicio de sesión no exige un formato de contraseña; el registro exige al menos ocho caracteres con mayúscula, minúscula y número, y muestra un enlace a los términos y condiciones. En esta versión no se autentica: los botones se conectarán con las pantallas de acceso de la Web Application (sección 4.4). |
| **Menú móvil** | En pantallas de hasta 1240 px la navegación se reemplaza por un menú desplegable que se cierra al elegir una sección o al pulsar Escape. |
| **Barra de navegación** | Es transparente sobre el héroe y pasa a fondo blanco con sombra ligera cuando el visitante se desplaza. El enlace de la sección visible se resalta en el menú. |
| **Franja de cargas (sección 1)** | Las cargas cuidadas en ruta se desplazan lentamente de derecha a izquierda; con la preferencia de reducción de movimiento del sistema, la franja queda estática. |
| **Aparición de bloques** | Las tarjetas y los titulares aparecen con un desvanecimiento suave al entrar en pantalla. Sin JavaScript o con reducción de movimiento, todo el contenido es visible desde el inicio. |

*Nota.* Elaboración propia.

**Verificación.** La Landing Page se revisó con pruebas automatizadas de navegador que recorren estas interacciones en español e inglés y comprueban que no aparezca desplazamiento horizontal entre 320 y 1440 px de ancho ni errores de JavaScript. Los contrastes de color se calcularon con la fórmula del criterio 1.4.3 de las WCAG 2.2 (W3C, 2024) y los bordes de los campos de formulario usan Slate (`#64748B`, 4,76 : 1), con lo que cumplen el criterio 1.4.11. Al rediseñar la página se repitió el conjunto completo (72 comprobaciones) y todas se cumplieron. Estas pruebas no sustituyen la evaluación con usuarios prevista en la sección 4.5.

## 4.4. Web Applications UX/UI Design

El diseño de la Web Application de FríoTrack organiza las experiencias de los dos perfiles de usuario: el Coordinador Logístico, que programa los envíos, administra la flota y atiende las alertas, y el Cliente de Carga, que verifica el estado térmico de los envíos que espera recibir y descarga los reportes. El diseño se desarrolla en cuatro artefactos encadenados: los wireframes definen la estructura de cada pantalla, los wireflows conectan las pantallas según las acciones del usuario, los mock-ups aplican la identidad visual y los diagramas de flujo de usuario (*user flows*) añaden las decisiones y las rutas alternas.

La aplicación se compone de 22 pantallas: 3 de acceso y cuenta, 12 del Coordinador Logístico, 3 del Cliente de Carga y 4 versiones móviles de las pantallas más críticas para quien opera en ruta. La Tabla 4.17 las lista con la tarea del usuario que cada una apoya. Los pasos 2 y 3 del registro de un envío siguen el mismo patrón de formulario que el paso 1 y por ello no se muestran de manera individual.

**Tabla 4.17**

*Inventario de pantallas de la Web Application*


| N.º | Pantalla | Perfil | Tarea que apoya | Elementos destacados |
| :---: | :--- | :--- | :--- | :--- |
| 1 | **Iniciar sesión** | Ambos | Acceder a la cuenta. | Correo y contraseña, «Mantener sesión iniciada», enlaces a registro y a recuperación. |
| 2 | **Crear cuenta** | Ambos | Registrarse eligiendo el perfil. | Selector de perfil (Coordinador Logístico o Cliente de Carga), datos de contacto, validación por campo. |
| 3 | **Recuperar contraseña** | Ambos | Restablecer el acceso. | Envío de enlace con mensaje neutro que no revela si el correo existe. |
| 4 | **Dashboard** | Coordinador | Ver de un vistazo el estado de la operación. | Cuatro indicadores, mapa de unidades activas (70 % del ancho) y lista de envíos activos (30 %). |
| 5 | **Envíos** | Coordinador | Buscar, filtrar y acceder a un envío. | Búsqueda, filtros combinables, chips de filtros activos, tabla con estado térmico y paginación. |
| 6 | **Nuevo envío · paso 1** | Coordinador | Definir la carga y su rango térmico. | Indicador de cuatro pasos, datos de la carga, temperatura mínima y máxima, humedad y tolerancia. |
| 7 | **Nuevo envío · paso 4 (revisión)** | Coordinador | Confirmar y programar el envío. | Resumen de carga, ruta y recursos; aviso de que los recursos no se reservan hasta confirmar. |
| 8 | **Detalle del envío** | Coordinador | Seguir un envío en tránsito. | Aviso de alerta, indicadores, gráfico de lecturas con banda de rango seguro y mapa. |
| 9 | **Detalle del envío · Alertas** | Coordinador | Revisar las alertas de un envío. | Tabla de alertas con tipo, duración, lectura y estado; acción «Registrar acción». |
| 10 | **Registrar acción correctiva** | Coordinador | Documentar la respuesta a una alerta. | Ventana modal con acción, comentario y casilla «Notificar al Cliente de Carga». |
| 11 | **Vehículos** | Coordinador | Administrar las unidades y sus sensores. | Lista con placa, capacidad, sensor y estado; formulario de registro. |
| 12 | **Conductores** | Coordinador | Administrar los conductores. | Lista con licencia, contacto, unidad asignada y disponibilidad. |
| 13 | **Historial** | Coordinador | Auditar envíos concluidos. | Filtros por fecha y estado, resumen de desvíos y descarga del reporte en PDF. |
| 14 | **Notificaciones** | Ambos | Enterarse de alertas y cambios. | Pestañas (Todas, Sin leer, Alertas, Entregas), agrupación por día y acción «Marcar todas como leídas». |
| 15 | **Configuración** | Ambos | Gestionar perfil, contraseña e idioma. | Datos de perfil, cambio de contraseña, preferencias de idioma y de alertas. |
| 16 | **Envíos por recibir** | Cliente | Ubicar los envíos que espera. | Indicadores, lista de envíos asignados y mapa. |
| 17 | **Detalle del envío (Cliente)** | Cliente | Verificar el estado térmico y descargar el reporte. | Vista de solo lectura, lecturas, ruta y botón «Descargar reporte térmico». |
| 18 | **Historial (Cliente)** | Cliente | Consultar envíos anteriores. | Filtros y descarga de reportes. |
| 19 a 22 | **Versión móvil** | Coordinador | Operar en ruta desde el celular. | Inicio de sesión, panel con mapa y hoja deslizable, detalle del envío y registro de acción correctiva. |

*Nota.* Elaboración propia. La trazabilidad con las historias de usuario se completará cuando se cierren los Capítulos II y III; por ahora cada pantalla se vincula con la tarea del usuario que apoya, derivada de los problemas y las hipótesis del Capítulo I.

### 4.4.1. Web Applications Wireframes

Los wireframes de la aplicación se elaboraron en escala de grises, a un lienzo de 1440 × 900 px para escritorio y de 390 × 844 px para móvil. Su finalidad es acordar la distribución de los contenidos y de los controles antes de definir el aspecto visual. Las decisiones más relevantes son las siguientes: el Dashboard destina alrededor del 70 % del ancho al mapa y el 30 % a la lista de envíos, por ser la ubicación de las unidades el dato que más orienta al Coordinador; las listas usan tablas con filtros visibles y no menús ocultos; el registro de un envío se divide en cuatro pasos para no abrumar al usuario con un formulario extenso; y la acción primaria de cada pantalla ocupa siempre la misma posición, en la esquina superior derecha del área de trabajo.

#### Acceso y cuenta

**Figura 4.40**

*Wireframe · Iniciar sesión*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-login.png" alt="Wireframe · Iniciar sesión" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.41**

*Wireframe · Crear cuenta*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-register.png" alt="Wireframe · Crear cuenta" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.42**

*Wireframe · Recuperar contraseña*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-recover.png" alt="Wireframe · Recuperar contraseña" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Coordinador Logístico

**Figura 4.43**

*Wireframe · Dashboard del Coordinador Logístico*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-dashboard.png" alt="Wireframe · Dashboard del Coordinador Logístico" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.44**

*Wireframe · Lista de envíos*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-shipments.png" alt="Wireframe · Lista de envíos" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.45**

*Wireframe · Nuevo envío, paso 1: carga y rango térmico*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-new1.png" alt="Wireframe · Nuevo envío, paso 1: carga y rango térmico" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.46**

*Wireframe · Nuevo envío, paso 4: revisión*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-new4.png" alt="Wireframe · Nuevo envío, paso 4: revisión" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.47**

*Wireframe · Detalle de un envío en tránsito*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-detail.png" alt="Wireframe · Detalle de un envío en tránsito" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.48**

*Wireframe · Detalle de un envío, pestaña Alertas*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-alerts.png" alt="Wireframe · Detalle de un envío, pestaña Alertas" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.49**

*Wireframe · Ventana modal «Registrar acción correctiva»*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-alert.png" alt="Wireframe · Ventana modal «Registrar acción correctiva»" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.50**

*Wireframe · Vehículos*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-vehicles.png" alt="Wireframe · Vehículos" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.51**

*Wireframe · Conductores*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-drivers.png" alt="Wireframe · Conductores" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.52**

*Wireframe · Historial de envíos*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-history.png" alt="Wireframe · Historial de envíos" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.53**

*Wireframe · Notificaciones*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-notifications.png" alt="Wireframe · Notificaciones" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.54**

*Wireframe · Configuración*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-settings.png" alt="Wireframe · Configuración" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Cliente de Carga

**Figura 4.55**

*Wireframe · Envíos por recibir*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-c-incoming.png" alt="Wireframe · Envíos por recibir" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.56**

*Wireframe · Detalle de un envío (vista de solo lectura)*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-c-detail.png" alt="Wireframe · Detalle de un envío (vista de solo lectura)" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.57**

*Wireframe · Historial del Cliente de Carga*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-c-history.png" alt="Wireframe · Historial del Cliente de Carga" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Versión móvil

**Figura 4.58**

*Wireframes móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva*

<p align="center">
  <img src="assets/images/chapter-4/wireframe-m-login.png" alt="Wireframes móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva" width="200">
  <img src="assets/images/chapter-4/wireframe-m-dashboard.png" alt="Wireframes móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva" width="200">
  <img src="assets/images/chapter-4/wireframe-m-detail.png" alt="Wireframes móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva" width="200">
  <img src="assets/images/chapter-4/wireframe-m-alert.png" alt="Wireframes móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva" width="200"><br>
  <i>Nota.</i> Elaboración propia.
</p>

### 4.4.2. Web Applications Wireflow Diagrams

Los wireflows combinan miniaturas de los wireframes con flechas rotuladas que indican la acción del usuario que provoca el cambio de pantalla. Permiten verificar que cada tarea principal puede completarse sin callejones sin salida y que cada pantalla sabe hacia dónde continúa. Se elaboraron cinco wireflows, uno por objetivo relevante de los perfiles: preparar y programar un envío, atender una alerta, verificar un envío como cliente, crear una cuenta o recuperar la contraseña, y operar desde el celular.

#### Wireflow 1 · Preparar y programar un envío (Coordinador Logístico)

El Coordinador parte del Dashboard, entra a Envíos, inicia un nuevo envío y avanza por los pasos del formulario hasta la revisión. Al confirmar, el envío queda en estado Programado, aparece en la lista y el Cliente de Carga recibe una notificación.

**Figura 4.59**

*Wireflow · Preparar y programar un envío*

<p align="center">
  <img src="assets/images/chapter-4/wireflow-preparar-envio.png" alt="Wireflow · Preparar y programar un envío" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Wireflow 2 · Atender una alerta (Coordinador Logístico)

Una alerta crítica se descubre desde el contador del Dashboard o desde la campana de notificaciones. Desde la notificación el usuario llega directamente a la pestaña Alertas del envío afectado, abre la ventana modal, registra la acción realizada y guarda. La alerta pasa a estado Reconocida, se conserva en el historial y, si el usuario lo indicó, el Cliente de Carga recibe el aviso.

**Figura 4.60**

*Wireflow · Atender una alerta*

<p align="center">
  <img src="assets/images/chapter-4/wireflow-atender-alerta.png" alt="Wireflow · Atender una alerta" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Wireflow 3 · Verificar un envío y descargar el reporte (Cliente de Carga)

Tras iniciar sesión, el Cliente de Carga llega a Envíos por recibir, abre el detalle de un envío en modo de solo lectura y, desde Historial, descarga el reporte térmico en PDF de un envío entregado.

**Figura 4.61**

*Wireflow · Verificar un envío y descargar el reporte*

<p align="center">
  <img src="assets/images/chapter-4/wireflow-cliente-verifica.png" alt="Wireflow · Verificar un envío y descargar el reporte" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Wireflow 4 · Crear una cuenta y recuperar la contraseña

Desde la pantalla de inicio de sesión, un visitante puede registrarse eligiendo su perfil, tras lo cual es redirigido a la pantalla inicial correspondiente (Dashboard para el Coordinador Logístico, Envíos por recibir para el Cliente de Carga), o recuperar su contraseña mediante un enlace enviado a su correo.

**Figura 4.62**

*Wireflow · Crear una cuenta y recuperar la contraseña*

<p align="center">
  <img src="assets/images/chapter-4/wireflow-cuenta.png" alt="Wireflow · Crear una cuenta y recuperar la contraseña" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Wireflow 5 · Atender una alerta desde el celular

El Coordinador que se encuentra en ruta recorre un flujo abreviado: inicia sesión, ve el panel con el mapa y la hoja deslizable de envíos, abre el detalle del envío crítico y registra la acción correctiva.

**Figura 4.63**

*Wireflow · Atender una alerta desde el celular*

<p align="center">
  <img src="assets/images/chapter-4/wireflow-movil.png" alt="Wireflow · Atender una alerta desde el celular" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

### 4.4.3. Web Applications Mock-ups

Los mock-ups desarrollan las mismas pantallas con el detalle visual definido en la guía de estilo: color, tipografía, íconos, componentes, datos de ejemplo y estados. Se usaron datos ficticios verosímiles (unidades, placas, conductores y empresas inventados) para comprobar que los textos y las tablas sostienen contenido real sin desbordarse. Los criterios que guiaron la revisión visual fueron los siguientes:

**Tabla 4.18**

*Criterios de diseño aplicados en los mock-ups*


| Criterio | Aplicación en las pantallas |
| :--- | :--- |
| **El estado térmico se entiende sin leer** | Cada envío lleva un chip de color con ícono y texto (dentro del rango, advertencia, crítico, sin señal); los envíos críticos también se destacan con un marcador rojo en el mapa. |
| **Diferenciación entre perfiles** | El Coordinador dispone de acciones de gestión (nuevo envío, registrar acción, marcar como entregado); el Cliente de Carga ve un aviso de «Vista de solo lectura» y un único botón primario, «Descargar reporte térmico». |
| **Datos con su contexto temporal** | Las lecturas indican su hora («Lectura reportada 09:30») y las posiciones, su fuente; el gráfico marca con una banda el rango seguro configurado. |
| **Prevención de errores** | Las validaciones se muestran junto al campo; el aviso «Otro envío usa estos recursos» evita programar dos envíos con la misma unidad. |
| **Consistencia** | Las tablas, las tarjetas, los chips y los botones son los mismos componentes en todas las pantallas. |

*Nota.* Elaboración propia.

Los mock-ups se diseñan para implementarse con Vue 3 y PrimeVue (PrimeTek, s. f.) sobre una base de Material Design 3 (Google, s. f.); representan decisiones visuales y no la ejecución real de los componentes.

#### Acceso y cuenta

**Figura 4.64**

*Mock-up · Iniciar sesión*

<p align="center">
  <img src="assets/images/chapter-4/mockup-login.png" alt="Mock-up · Iniciar sesión" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.65**

*Mock-up · Crear cuenta*

<p align="center">
  <img src="assets/images/chapter-4/mockup-register.png" alt="Mock-up · Crear cuenta" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.66**

*Mock-up · Recuperar contraseña*

<p align="center">
  <img src="assets/images/chapter-4/mockup-recover.png" alt="Mock-up · Recuperar contraseña" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Coordinador Logístico

**Figura 4.67**

*Mock-up · Dashboard del Coordinador Logístico*

<p align="center">
  <img src="assets/images/chapter-4/mockup-dashboard.png" alt="Mock-up · Dashboard del Coordinador Logístico" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.68**

*Mock-up · Lista de envíos*

<p align="center">
  <img src="assets/images/chapter-4/mockup-shipments.png" alt="Mock-up · Lista de envíos" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.69**

*Mock-up · Nuevo envío, paso 1: carga y rango térmico*

<p align="center">
  <img src="assets/images/chapter-4/mockup-new1.png" alt="Mock-up · Nuevo envío, paso 1: carga y rango térmico" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.70**

*Mock-up · Nuevo envío, paso 4: revisión*

<p align="center">
  <img src="assets/images/chapter-4/mockup-new4.png" alt="Mock-up · Nuevo envío, paso 4: revisión" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.71**

*Mock-up · Detalle de un envío en tránsito*

<p align="center">
  <img src="assets/images/chapter-4/mockup-detail.png" alt="Mock-up · Detalle de un envío en tránsito" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.72**

*Mock-up · Detalle de un envío, pestaña Alertas*

<p align="center">
  <img src="assets/images/chapter-4/mockup-alerts.png" alt="Mock-up · Detalle de un envío, pestaña Alertas" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.73**

*Mock-up · Ventana modal «Registrar acción correctiva»*

<p align="center">
  <img src="assets/images/chapter-4/mockup-alert.png" alt="Mock-up · Ventana modal «Registrar acción correctiva»" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.74**

*Mock-up · Vehículos*

<p align="center">
  <img src="assets/images/chapter-4/mockup-vehicles.png" alt="Mock-up · Vehículos" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.75**

*Mock-up · Conductores*

<p align="center">
  <img src="assets/images/chapter-4/mockup-drivers.png" alt="Mock-up · Conductores" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.76**

*Mock-up · Historial de envíos*

<p align="center">
  <img src="assets/images/chapter-4/mockup-history.png" alt="Mock-up · Historial de envíos" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.77**

*Mock-up · Notificaciones*

<p align="center">
  <img src="assets/images/chapter-4/mockup-notifications.png" alt="Mock-up · Notificaciones" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.78**

*Mock-up · Configuración*

<p align="center">
  <img src="assets/images/chapter-4/mockup-settings.png" alt="Mock-up · Configuración" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Cliente de Carga

**Figura 4.79**

*Mock-up · Envíos por recibir*

<p align="center">
  <img src="assets/images/chapter-4/mockup-c-incoming.png" alt="Mock-up · Envíos por recibir" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.80**

*Mock-up · Detalle de un envío (vista de solo lectura)*

<p align="center">
  <img src="assets/images/chapter-4/mockup-c-detail.png" alt="Mock-up · Detalle de un envío (vista de solo lectura)" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Figura 4.81**

*Mock-up · Historial del Cliente de Carga*

<p align="center">
  <img src="assets/images/chapter-4/mockup-c-history.png" alt="Mock-up · Historial del Cliente de Carga" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Versión móvil

**Figura 4.82**

*Mock-ups móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva*

<p align="center">
  <img src="assets/images/chapter-4/mockup-m-login.png" alt="Mock-ups móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva" width="200">
  <img src="assets/images/chapter-4/mockup-m-dashboard.png" alt="Mock-ups móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva" width="200">
  <img src="assets/images/chapter-4/mockup-m-detail.png" alt="Mock-ups móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva" width="200">
  <img src="assets/images/chapter-4/mockup-m-alert.png" alt="Mock-ups móviles · Inicio de sesión, panel, detalle del envío y registro de acción correctiva" width="200"><br>
  <i>Nota.</i> Elaboración propia.
</p>

### 4.4.4. Web Applications User Flow Diagrams

Los diagramas de flujo de usuario complementan los wireflows al incorporar las decisiones que determinan cómo continúa una interacción y las rutas alternas cuando algo falla. Cada diagrama muestra el camino esperado (o camino feliz) y los caminos de error, y permite comprobar que toda rama tiene una salida: corregir, reintentar, cancelar o volver. La leyenda de los tres diagramas es común: los rectángulos azules son pantallas, los rombos ámbar son decisiones, los rectángulos turquesa con línea discontinua son procesos que ejecuta el sistema, los rectángulos rojos son errores o caminos alternos, y las elipses son el inicio y el final del flujo.

#### Flujo 1 · Programar un envío

El flujo valida los datos en cada paso antes de avanzar: que el mínimo de temperatura sea menor que el máximo y que el peso sea positivo (paso 1), que la salida sea futura y que la ruta esté definida (paso 2), y que existan una unidad y un conductor disponibles (paso 3). En la revisión, el usuario puede confirmar o cancelar; si cancela, se le ofrece guardar un borrador. Al confirmar, el sistema valida de nuevo la disponibilidad y reserva los recursos. Si otro envío los ocupó mientras tanto, se muestra el aviso «Otro envío usa estos recursos» y el usuario vuelve al paso 3. Esta regla se apoya en el principio de que la selección provisional de recursos no los reserva: la reserva solo ocurre al confirmar.

**Figura 4.83**

*Diagrama de flujo de usuario · Programar un envío*

<p align="center">
  <img src="assets/images/chapter-4/userflow-programar-envio.png" alt="Diagrama de flujo de usuario · Programar un envío" width="800"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Flujo 2 · Atender una alerta

El flujo comienza con la llegada de una lectura del sensor. El sistema la compara con el rango configurado. Si está dentro del rango, el estado térmico se mantiene. Si está fuera de rango pero no excede la tolerancia en minutos, el envío pasa a Advertencia y se espera la siguiente lectura; si la excede, se crea una alerta crítica y se envía una notificación. Mientras el Coordinador no registre una acción, la alerta sigue activa y se le recuerda periódicamente. Al registrar la acción, el sistema exige seleccionar una de las acciones disponibles; luego, si la lectura vuelve al rango, la alerta se resuelve y el historial se actualiza; si no vuelve, se registra una incidencia y se notifica al Cliente de Carga.

**Figura 4.84**

*Diagrama de flujo de usuario · Atender una alerta*

<p align="center">
  <img src="assets/images/chapter-4/userflow-atender-alerta.png" alt="Diagrama de flujo de usuario · Atender una alerta" width="750"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### Flujo 3 · Verificar un envío y descargar el reporte (Cliente de Carga)

Este flujo verifica primero que la cuenta corresponda al perfil de Cliente de Carga; en caso contrario, redirige al Dashboard del Coordinador. Si el cliente no tiene envíos asignados, ve un estado vacío con un mensaje explicativo. Al abrir el detalle de un envío, se comprueba si el sensor tiene señal: si no la tiene, se muestra el aviso «Sin señal desde HH:MM» junto con la última lectura conocida, pero el resto de la información sigue disponible. El botón «Descargar reporte» permanece deshabilitado hasta que el envío se entrega; una vez entregado, el sistema genera el PDF y, si la generación falla, muestra un mensaje de error con la opción de reintentar.

**Figura 4.85**

*Diagrama de flujo de usuario · Verificar un envío y descargar el reporte*

<p align="center">
  <img src="assets/images/chapter-4/userflow-cliente-reporte.png" alt="Diagrama de flujo de usuario · Verificar un envío y descargar el reporte" width="650"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Tabla 4.19**

*Reglas de negocio reflejadas en los flujos de usuario*


| Regla | Efecto en la interfaz |
| :--- | :--- |
| Los recursos no se reservan hasta confirmar el envío. | La selección de unidad y conductor es provisional; el aviso de la revisión lo advierte. |
| Un envío nuevo nace como borrador y pasa a Programado al confirmarse. | El envío aparece en la lista con el chip «Programado» y se notifica al Cliente de Carga. |
| Una desviación menor que la tolerancia genera advertencia; una que la excede, alerta crítica. | Cambia el chip del envío y, en el caso crítico, se crea una notificación. |
| El Cliente de Carga solo consulta. | Las pantallas del cliente no muestran acciones de gestión y llevan el aviso «Vista de solo lectura». |
| El reporte térmico solo está disponible cuando el envío se entrega. | El botón «Descargar reporte» se habilita al concluir el envío. |

*Nota.* Elaboración propia.

## 4.5. Web Applications Prototyping

El prototipo de FríoTrack reúne los mock-ups de la Web Application en una experiencia navegable con la que es posible recorrer los flujos principales antes de escribir código de producción. Su propósito es doble: validar con el equipo y con usuarios que las tareas se pueden completar con la estructura propuesta, y ofrecer una referencia concreta para la implementación. Siguiendo el ciclo iterativo de diseño y evaluación que plantea la norma ISO 9241-210 (International Organization for Standardization [ISO], 2019), el prototipo es el insumo para la evaluación que se realizará en la siguiente etapa.

El prototipo se entrega como un único archivo HTML autocontenido (sin dependencias externas), que incluye las tipografías, los íconos y las 20 pantallas de escritorio conectadas entre sí: las 18 del inventario de la sección 4.4 y las versiones de Notificaciones y Configuración del Cliente de Carga. Se abre en cualquier navegador moderno. Una barra superior permite volver a la pantalla anterior, regresar al inicio de sesión y saltar directamente al Dashboard del Coordinador Logístico o a la pantalla Envíos por recibir del Cliente de Carga. Los elementos interactivos se resaltan al pasar el cursor.

La Tabla 4.20 resume las interacciones que el prototipo permite. Los menús laterales de ambos perfiles navegan a todas las secciones; las demás interacciones se listan por pantalla.

**Tabla 4.20**

*Interacciones disponibles en el prototipo*


| Pantalla | Elemento interactivo | Resultado |
| :--- | :--- | :--- |
| Iniciar sesión | Botón «Iniciar sesión» | Abre el Dashboard del Coordinador Logístico. |
| Iniciar sesión | Enlace «Regístrate» | Abre Crear cuenta. |
| Iniciar sesión | Enlace «¿Olvidaste tu contraseña?» | Abre Recuperar contraseña. |
| Crear cuenta | Botón «Crear cuenta» y enlace «Inicia sesión» | Regresan a Iniciar sesión. En el sistema real, crear la cuenta redirige al Dashboard (Coordinador Logístico) o a Envíos por recibir (Cliente de Carga). |
| Recuperar contraseña | Enlace «Volver a iniciar sesión» | Regresa a Iniciar sesión. |
| Dashboard | Botón «Nuevo envío» | Abre el paso 1 del registro de un envío. |
| Dashboard | Tarjeta de un envío de la lista | Abre el detalle del envío. |
| Envíos | Botón «Nuevo envío» y cada fila de la tabla | Abren el paso 1 del registro y el detalle del envío, respectivamente. |
| Nuevo envío · paso 1 | Botones «Siguiente» y «Cancelar» | Pasan a la revisión (paso 4) o regresan a Envíos. |
| Nuevo envío · paso 4 | Botones «Atrás», «Confirmar y programar» y «Cancelar» | Regresan al paso 1 o vuelven a la lista de envíos. |
| Detalle del envío | Pestaña «Alertas» y botón «Registrar incidencia» | Abren la pestaña Alertas o la ventana modal de acción correctiva. |
| Detalle · Alertas | Botón «Registrar acción» y pestaña «Resumen» | Abren la ventana modal o regresan al resumen. |
| Registrar acción correctiva | Botones «Guardar acción» y «Cancelar» | Regresan a la pestaña Alertas. |
| Notificaciones | Cada notificación | Abre el detalle del envío; la alerta crítica abre directamente la pestaña Alertas. |
| Envíos por recibir (Cliente) | Tarjeta de un envío | Abre el detalle en modo de solo lectura. |
| Detalle (Cliente) | Menú lateral | Navega a Envíos por recibir, Historial, Notificaciones y Configuración del Cliente. |

*Nota.* Elaboración propia.

El recorrido que se muestra en la Figura 4.86 sigue el camino principal del Coordinador Logístico (iniciar sesión, abrir un envío crítico, registrar la acción correctiva, programar un nuevo envío) y termina en la vista del Cliente de Carga.

**Figura 4.86**

*Recorrido del prototipo interactivo de FríoTrack (animación)*

<p align="center">
  <img src="assets/images/chapter-4/prototype-recorrido.gif" alt="Recorrido del prototipo interactivo de FríoTrack (animación)" width="900"><br>
  <i>Nota.</i> La animación recorre doce pantallas en el orden: inicio de sesión, Dashboard, detalle del envío FT-2421, pestaña Alertas, registro de la acción correctiva, retorno a Alertas, lista de envíos, nuevo envío (pasos 1 y 4), lista de envíos, Envíos por recibir del Cliente de Carga y detalle del envío. Elaboración propia.
</p>

**Alcance del prototipo.** El prototipo simula la experiencia de uso. No implementa autenticación real, persistencia de datos, envío de correos, recepción de lecturas de sensores ni conexión con servicios de mapas: los datos son ficticios y los mapas y gráficos son ilustraciones. Las secciones Vehículos, Conductores, Historial y Configuración se pueden visitar, pero sus formularios no ejecutan acciones. Las versiones móviles se presentan como mock-ups estáticos en la sección 4.4.3.

**Plan de evaluación.** Con el prototipo se evaluarán tres tareas, una por cada flujo de usuario de la sección 4.4.4. La Tabla 4.21 define la métrica de éxito de cada una. Los resultados se documentarán en la etapa de validación del proyecto, una vez ejecutadas las sesiones con usuarios.

**Tabla 4.21**

*Tareas y métricas para la evaluación del prototipo*


| Tarea | Perfil | Métrica de éxito |
| :--- | :--- | :--- |
| Programar un envío con una carga a 2–5 °C. | Coordinador Logístico | Completa los cuatro pasos sin ayuda y sin errores de validación repetidos. |
| Registrar la acción correctiva de una alerta crítica. | Coordinador Logístico | Llega desde la notificación al formulario y guarda la acción en menos de un minuto. |
| Identificar si un envío está dentro del rango y ubicar el reporte térmico. | Cliente de Carga | Lee correctamente el estado térmico y localiza el botón de descarga en el detalle o en Historial. |

*Nota.* Elaboración propia.

**Enlaces del prototipo.**

| Recurso | Enlace |
| :--- | :--- |
| Prototipo interactivo en HTML (archivo del repositorio) | [`assets/prototype/friotrack-prototype.html`](assets/prototype/friotrack-prototype.html). Para verlo, descargue el archivo y ábralo en un navegador. |
| Archivo de diseño en Figma del equipo | [figma.com/design/A9GdNlVpNyS7lYS7agf83X/myfigma](https://www.figma.com/design/A9GdNlVpNyS7lYS7agf83X/myfigma?t=BHeH2sG0m5VK3vkG-0) |
| Archivo de Figma del Bloque 4 (Product Design) | [figma.com/design/eJ6Ceq0H0FP0xWseNnKFFv](https://www.figma.com/design/eJ6Ceq0H0FP0xWseNnKFFv). Contiene las páginas Portada, 4.1 Style Guidelines, 4.2 IA y User Flows, 4.3 Landing Page y 4.5 Web App (wireframes y mock-ups). Los archivos SVG de origen están en [`assets/figma/`](assets/figma/README.md). |
| Video demostrativo del prototipo | Pendiente de completar por el equipo. |

## 4.6. Domain-Driven Software Architecture

Esta sección describe el diseño de la solución de software de FríoTrack desde el enfoque de Domain-Driven Design (DDD), propuesto por Evans (2003) y desarrollado en su vertiente estratégica y táctica por Vernon (2013). El enfoque parte de un lenguaje compartido entre el equipo y el negocio (el lenguaje ubicuo), divide el dominio en contextos delimitados (*Bounded Contexts*) con responsabilidades claras y, dentro de cada uno, modela los agregados que protegen las reglas del negocio. El modelo se descubrió con EventStorming en su nivel de diseño (Brandolini, 2021), y la arquitectura resultante se documenta con el modelo C4 (Brown, s. f.), que la describe en tres niveles de detalle: contexto, contenedores y componentes.

El punto de partida del modelado fueron los problemas del Capítulo I (la falta de lecturas continuas, de alertas oportunas y de evidencia térmica comprobable), que se sustentan en que la gestión del tiempo y de la temperatura a lo largo de la cadena de frío determina la calidad y la inocuidad del alimento (Mercier et al., 2017), y las pantallas y flujos de la sección 4.4. De esas fuentes se obtuvo el lenguaje ubicuo, cuyos términos principales se resumen en la Tabla 4.22. Estos términos se usan con el mismo significado en las pantallas, en los eventos del modelo, en las clases y en las tablas de la base de datos.

**Tabla 4.22**

*Lenguaje ubicuo de FríoTrack*


| Término | Significado en FríoTrack |
| :--- | :--- |
| **Envío (*Shipment*)** | Traslado terrestre de una carga perecible entre un origen y un destino, con un rango térmico configurado. Es la unidad central del negocio. |
| **Rango térmico** | Intervalo de temperatura mínima y máxima, y humedad máxima, dentro del cual la carga debe viajar. |
| **Tolerancia** | Minutos que una lectura puede permanecer fuera del rango antes de que la desviación se considere crítica. |
| **Lectura (*Reading*)** | Medición de temperatura y humedad enviada por el sensor de la unidad, con su fecha y hora. |
| **Posición reportada** | Ubicación GPS enviada por el sensor; se distingue de la ruta planificada. |
| **Monitoreo** | Seguimiento de un envío mientras está en tránsito, desde el inicio del traslado hasta su entrega o cancelación. |
| **Alerta** | Aviso generado cuando una lectura sale del rango (advertencia o crítica) o cuando el sensor pierde señal. |
| **Acción correctiva** | Respuesta que el Coordinador Logístico registra ante una alerta. |
| **Incidencia** | Evento del traslado que el Coordinador Logístico registra y que puede afectar la carga. |
| **Reporte térmico** | Documento PDF con las lecturas, alertas y acciones de un envío, que sirve como evidencia. |
| **Reserva de recursos** | Bloqueo de una unidad y de un conductor para un envío durante su horario. |

*Nota.* Elaboración propia.

### 4.6.1. Design-Level EventStorming

#### Notación

El EventStorming de nivel de diseño ordena, de izquierda a derecha y en una línea de tiempo, los eventos de dominio que ocurren en el sistema y, alrededor de ellos, los comandos que los provocan, los agregados que los emiten y las políticas que reaccionan. Se agregaron dos elementos de apoyo: las reglas de negocio que protegen a cada agregado y las vistas (*read models*) que consumen las pantallas. La Tabla 4.23 muestra la notación usada en los diagramas de esta sección.

**Tabla 4.23**

*Notación de los diagramas de EventStorming*


| Elemento | Color | Significado |
| :--- | :---: | :--- |
| **Actor** | Amarillo claro | Persona o rol que ejecuta un comando. |
| **Comando** | Azul | Intención de un actor o de una política de cambiar el estado del sistema. |
| **Agregado** | Amarillo | Entidad raíz que valida las reglas y emite los eventos. |
| **Evento de dominio** | Naranja | Hecho relevante que ya ocurrió, en pasado. |
| **Política** | Lila | Regla «cuando ocurre X, entonces hacer Y» que conecta un evento con un comando. |
| **Regla de negocio** | Blanco con borde lila discontinuo | Restricción que el agregado debe garantizar. |
| **Sistema externo** | Rosado | Sistema fuera del control de FríoTrack. |
| **Vista (*read model*)** | Verde | Información que una pantalla presenta al usuario. |
| **Evento o comando externo** | Tono claro con borde discontinuo | Elemento que pertenece a otro contexto delimitado. |

*Nota.* Elaboración propia, con base en la notación de EventStorming (Brandolini, 2021).

#### Bounded Contexts

El dominio se dividió en cinco contextos delimitados. La separación sigue las cuatro preguntas que orientaron el análisis: qué parte del negocio genera valor diferencial (subdominio *core*), qué partes lo apoyan pero no lo diferencian (*supporting*), cuáles son genéricas y podrían resolverse con soluciones estándar (*generic*), y dónde cambia el significado de un término. Por ejemplo, «envío» significa una programación con rango térmico en Shipment Management, una reserva de horario en Fleet & Resource Management y una serie de lecturas en Monitoring & Telemetry.

**Tabla 4.24**

*Bounded Contexts de FríoTrack*


| Bounded Context | Tipo de subdominio | Responsabilidad | Agregados principales | Pantallas relacionadas |
| :--- | :---: | :--- | :--- | :--- |
| **IAM** (Identity & Access Management) | Genérico | Registrar cuentas, autenticar, bloquear tras intentos fallidos, recuperar contraseñas y gestionar el perfil y el idioma. | `UserAccount`, `AuthSession`, `UserProfile` | Iniciar sesión, Crear cuenta, Recuperar contraseña, Configuración |
| **Fleet & Resource Management** | De apoyo | Administrar vehículos, sensores y conductores, y reservar o liberar recursos para los envíos. | `Vehicle`, `Driver`, `FleetAllocation` | Vehículos, Conductores, paso 3 del registro de un envío |
| **Shipment Management** | *Core* | Definir, programar, iniciar, entregar y cancelar envíos con su rango térmico y su ruta. | `Shipment` | Dashboard, Envíos, Nuevo envío, Detalle del envío |
| **Monitoring & Telemetry** | *Core* | Recibir lecturas y posiciones del sensor, evaluarlas contra el rango, detectar la pérdida de señal y exponer las series. | `ShipmentMonitoring` | Detalle del envío (Resumen, Lecturas, Ruta y posiciones), mapas y gráficos |
| **Alert & Reporting** | De apoyo | Generar alertas, notificar, registrar acciones correctivas e incidencias y producir el reporte térmico. | `Alert`, `Notification`, `Incident`, `ThermalReport` | Notificaciones, pestaña Alertas, acción correctiva, Historial, reportes |

*Nota.* Elaboración propia.

Shipment Management y Monitoring & Telemetry son los contextos *core* porque en ellos reside el valor diferencial de FríoTrack: programar con un rango térmico explícito y vigilar continuamente su cumplimiento. IAM es genérico y podría resolverse con una solución estándar de identidad, aunque se implementa en la propia API para simplificar el alcance inicial.

#### Relaciones entre contextos y matriz de interdependencias

Los contextos se relacionan mediante eventos de dominio: un contexto publica un evento y otro reacciona con un comando propio, sin acceder a los datos internos del primero. En el mapa de contextos, Shipment Management es el proveedor (*upstream*) de Fleet & Resource Management y de Monitoring & Telemetry en una relación de cliente y proveedor (*Customer/Supplier*), y Monitoring & Telemetry lo es de Alert & Reporting. IAM opera como servicio abierto (*Open Host Service*) que entrega la identidad y el perfil del usuario a los demás contextos mediante un token. Los sensores, por ser un sistema externo, se aíslan con una capa anticorrupción que traduce sus mensajes al comando `RecordReading` (Evans, 2003).

La Tabla 4.25 lista las interacciones y se corresponde con los números que aparecen en el diagrama general. Las interacciones 3 y 6 ocurren dentro de un mismo contexto y se incluyen para mantener continua la cadena desde la lectura hasta la notificación.

**Tabla 4.25**

*Matriz de interdependencias entre contextos*


| N.º | Origen (evento) | Destino (comando) | Descripción |
| :---: | :--- | :--- | :--- |
| 1 | `ShipmentScheduled` (Shipment Management) | `ReserveResources` (Fleet & Resource Management) | Al programar un envío se reservan la unidad y el conductor. Si no están disponibles, se emite `ResourcesUnavailable` y el envío vuelve a borrador. |
| 2 | `TransitStarted` (Shipment Management) | `StartMonitoring` (Monitoring & Telemetry) | Al iniciar el traslado se abre el monitoreo con el rango térmico y la tolerancia del envío. |
| 3 | `ReadingRecorded` (Monitoring & Telemetry) | `EvaluateReading` (Monitoring & Telemetry) | Cada lectura se evalúa contra el rango y la tolerancia; el resultado es `ReadingOutOfRange` o `ReadingWithinRange`. |
| 4 | `ReadingOutOfRange` (Monitoring & Telemetry) | `RaiseAlert` (Alert & Reporting) | Una lectura fuera de rango solicita la creación de una alerta, advertencia o crítica según la tolerancia. |
| 5 | `SignalLost` (Monitoring & Telemetry) | `RaiseAlert` (Alert & Reporting) | La pérdida de señal del sensor solicita una alerta de tipo «Sin señal». |
| 6 | `AlertRaised` (Alert & Reporting) | `SendNotification` (Alert & Reporting) | Toda alerta genera una notificación para el Coordinador Logístico y para el Cliente de Carga. |
| 7 | `ReadingWithinRange` (Monitoring & Telemetry) | `ResolveAlert` (Alert & Reporting) | Si existe una alerta activa y la lectura se normaliza, la alerta se cierra. |
| 8 | `ShipmentDelivered` (Shipment Management) | `ReleaseResources` (Fleet & Resource Management) | Al entregar el envío se liberan la unidad y el conductor. |
| 9 | `ShipmentDelivered` (Shipment Management) | `StopMonitoring` (Monitoring & Telemetry) | Al entregar el envío se detiene el monitoreo. Si un envío en tránsito se cancela, se emite el mismo comando. |
| 10 | `ShipmentDelivered` (Shipment Management) | `GenerateThermalReport` (Alert & Reporting) | La entrega habilita la generación del reporte térmico, que el usuario solicita desde «Descargar reporte». |
| 11 | `ShipmentCancelled` (Shipment Management) | `ReleaseResources` (Fleet & Resource Management) | Al cancelar el envío se liberan los recursos que tenía reservados. |

*Nota.* Elaboración propia.

#### Diagrama general

El diagrama general presenta los eventos de dominio de los cinco contextos organizados en calles (*swimlanes*), una por contexto, y las once integraciones de la Tabla 4.25 como flechas numeradas.

**Figura 4.87**

*Diagrama general de EventStorming de nivel de diseño*

<p align="center">
  <img src="assets/images/chapter-4/eventstorming-general.png" alt="Diagrama general de EventStorming de nivel de diseño" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

> **Enlace al tablero de EventStorming (Miro):** pendiente de completar por el equipo.

#### BC1 · IAM (Identity & Access Management)

El contexto IAM cubre el ciclo de vida de la cuenta. El registro exige un correo único y una contraseña de al menos ocho caracteres con letras y números, y al concluir se envía un correo de confirmación mediante el servicio de correo. Cada inicio de sesión exitoso redirige al usuario según su perfil: al Dashboard, si es Coordinador Logístico, o a Envíos por recibir, si es Cliente de Carga. Tras cinco intentos fallidos consecutivos se bloquea la cuenta. La recuperación de contraseña envía un enlace sin revelar si el correo existe, con el fin de no facilitar la enumeración de cuentas.

**Figura 4.88**

*EventStorming del contexto IAM*

<p align="center">
  <img src="assets/images/chapter-4/eventstorming-bc1-iam.png" alt="EventStorming del contexto IAM" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### BC2 · Fleet & Resource Management

Este contexto gestiona los recursos físicos de la empresa de transporte. Sus reglas más importantes son la unicidad de la placa y de la licencia, y la ausencia de traslape de horarios: una unidad o un conductor no pueden reservarse para dos envíos a la vez. Una unidad enviada a mantenimiento deja de aparecer como disponible. La reserva y la liberación no las decide el usuario directamente, sino que las provocan por política los eventos del contexto Shipment Management.

**Figura 4.89**

*EventStorming del contexto Fleet & Resource Management*

<p align="center">
  <img src="assets/images/chapter-4/eventstorming-bc2-fleet.png" alt="EventStorming del contexto Fleet & Resource Management" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### BC3 · Shipment Management

Este es el contexto central del negocio. El Coordinador Logístico define un borrador con su rango térmico (el mínimo debe ser menor que el máximo, la salida debe ser futura y la tolerancia mayor que cero) y luego lo programa. Al programar, la política del contexto solicita la reserva de recursos: si se reservan, se avisa al Cliente de Carga; si no están disponibles, el envío vuelve a borrador y se avisa al Coordinador. Esta secuencia corresponde al flujo 1 de la sección 4.4.4. Después, el Coordinador inicia el traslado, lo que abre el monitoreo, y finalmente marca la entrega o cancela el envío, lo que libera los recursos y detiene el monitoreo.

**Figura 4.90**

*EventStorming del contexto Shipment Management*

<p align="center">
  <img src="assets/images/chapter-4/eventstorming-bc3-shipment.png" alt="EventStorming del contexto Shipment Management" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### BC4 · Monitoring & Telemetry

El contexto recibe las lecturas y las posiciones de los sensores y las evalúa. Al iniciar el monitoreo copia el rango térmico y la tolerancia del envío, de modo que una modificación posterior del envío no altere retroactivamente la evaluación. Cada lectura se registra y se evalúa: si está fuera de rango se solicita una alerta al contexto Alert & Reporting; si está dentro y existe una alerta activa, se solicita su resolución. Una política adicional detecta la pérdida de señal cuando no llegan lecturas durante el tiempo máximo permitido y solicita una alerta «Sin señal», que en la interfaz se muestra con el banner «Sin señal desde HH:MM» y la última lectura conocida.

**Figura 4.91**

*EventStorming del contexto Monitoring & Telemetry*

<p align="center">
  <img src="assets/images/chapter-4/eventstorming-bc4-monitoring.png" alt="EventStorming del contexto Monitoring & Telemetry" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

#### BC5 · Alert & Reporting

Este contexto reacciona a los eventos de monitoreo. Al recibir la solicitud de una alerta, la política del contexto la clasifica como advertencia o como crítica según la tolerancia, la registra y genera una notificación para el Coordinador Logístico y el Cliente de Carga (con envío de correo en el caso de alertas críticas). El Coordinador registra la acción correctiva desde la ventana modal descrita en la sección 4.4; si marcó la casilla «Notificar al Cliente de Carga», se envía además una notificación al cliente. La alerta se cierra cuando la lectura vuelve al rango. El contexto también registra incidencias, genera el reporte térmico en PDF y controla la lectura de las notificaciones.

**Figura 4.92**

*EventStorming del contexto Alert & Reporting*

<p align="center">
  <img src="assets/images/chapter-4/eventstorming-bc5-alerts.png" alt="EventStorming del contexto Alert & Reporting" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

### 4.6.2. Software Architecture Context Diagram

El diagrama de contexto (nivel 1 del modelo C4) muestra FríoTrack como una sola caja y a su alrededor las personas que lo usan y los sistemas externos con los que se comunica (Brown, s. f.). Su utilidad es acordar el alcance del sistema con lectores no técnicos.

**Figura 4.93**

*Diagrama de contexto del sistema FríoTrack (modelo C4, nivel 1)*

<p align="center">
  <img src="assets/images/chapter-04/c4-contexto.png" alt="Diagrama de contexto del sistema FríoTrack (modelo C4, nivel 1)" width="1000"><br>
  <i>Nota.</i> Elaboración propia, con base en el modelo C4.
</p>

**Tabla 4.26**

*Elementos del diagrama de contexto*


| Elemento | Tipo | Descripción y relación con FríoTrack |
| :--- | :--- | :--- |
| **Coordinador Logístico** | Persona | Empresa de transporte. Programa envíos, administra unidades y conductores y atiende alertas. Usa el sistema mediante HTTPS. |
| **Cliente de Carga** | Persona | Productor, exportador o comprador. Consulta el estado térmico de sus envíos y descarga reportes. Usa el sistema mediante HTTPS. |
| **FríoTrack** | Sistema | Plataforma web para el monitoreo casi en tiempo real de temperatura, humedad y posición de cargas refrigeradas. |
| **Sensores de temperatura, humedad y GPS** | Sistema externo | Dispositivos instalados en cada unidad. Envían lecturas y posiciones a FríoTrack mediante HTTPS con formato JSON. |
| **Servicio de correo electrónico** | Sistema externo | Entrega los correos de confirmación de cuenta, de recuperación de contraseña y de alertas críticas. |
| **OpenStreetMap** | Sistema externo | Provee las teselas de los mapas donde se muestran rutas y posiciones (OpenStreetMap Foundation, s. f.). |

*Nota.* Elaboración propia.

### 4.6.3. Software Architecture Container Diagrams

El diagrama de contenedores (nivel 2 del modelo C4) descompone FríoTrack en sus unidades ejecutables y muestra las decisiones tecnológicas. Un contenedor, en este modelo, es una aplicación o un almacén de datos que debe estar en ejecución para que el sistema funcione, y no un contenedor de Docker.

**Figura 4.94**

*Diagrama de contenedores de FríoTrack (modelo C4, nivel 2)*

<p align="center">
  <img src="assets/images/chapter-04/c4-contenedores.png" alt="Diagrama de contenedores de FríoTrack (modelo C4, nivel 2)" width="1000"><br>
  <i>Nota.</i> Elaboración propia, con base en el modelo C4.
</p>

**Tabla 4.27**

*Contenedores de FríoTrack y decisiones tecnológicas*


| Contenedor | Tecnología | Responsabilidad | Justificación |
| :--- | :--- | :--- | :--- |
| **Landing Page** | HTML, CSS y JavaScript, sitio estático | Presentar la propuesta de valor y dirigir al registro o al inicio de sesión. | Contenido público que no requiere lógica de servidor y que se sirve de forma estática y rápida. |
| **Aplicación web (SPA)** | Vue 3, Vite, PrimeVue, Leaflet | Interfaz del Coordinador Logístico y del Cliente de Carga: dashboard, envíos, alertas, historial y reportes. | Vue 3 y Vite permiten una interfaz reactiva; PrimeVue (PrimeTek, s. f.) aporta los componentes descritos en la sección 4.1.2; Leaflet (Agafonkin, s. f.) dibuja los mapas con las teselas de OpenStreetMap. |
| **API web** | ASP.NET Core Web API, C# | Aplicar las reglas de negocio, autenticar con JWT, recibir las lecturas de los sensores, evaluar alertas y generar los reportes PDF. | Centraliza las reglas del dominio en un único lugar; los tokens JWT (Jones et al., 2015) permiten autenticar sin mantener sesión en el servidor; la API se documenta con OpenAPI. |
| **Base de datos** | PostgreSQL | Almacenar usuarios, flota, envíos, lecturas, alertas, notificaciones y reportes. | Base relacional con integridad referencial, tipos para fecha y hora con zona horaria y soporte de campos JSON (The PostgreSQL Global Development Group, s. f.). |
| **OpenStreetMap** | Sistema externo | Proveer las teselas del mapa. | Alternativa abierta que no exige licencia comercial de mapas. |
| **Sensores** | Sistema externo | Reportar lecturas y posiciones. | Cada unidad lleva un sensor asignado en el contexto Fleet & Resource Management. |
| **Servicio de correo** | Sistema externo | Entregar correos transaccionales. | Evita operar un servidor de correo propio. |

*Nota.* Elaboración propia.

La Aplicación web se comunica con la API mediante una interfaz REST con JSON sobre HTTPS y un token JWT en cada solicitud. Los sensores envían sus lecturas a un punto de acceso específico de la API. La API es el único contenedor que accede a la base de datos y a los sistemas externos de correo, de modo que las credenciales y las reglas de negocio no se exponen al navegador.

### 4.6.4. Software Architecture Component Diagrams

El diagrama de componentes (nivel 3 del modelo C4) descompone el contenedor API web. La arquitectura sigue la división en contextos delimitados de la sección 4.6.1: cada contexto tiene su controlador REST, que recibe las solicitudes, y su módulo de dominio, que contiene los agregados, las reglas de negocio y los eventos. Dos componentes de infraestructura compartidos completan el diagrama: la capa de persistencia, que implementa los repositorios de cada agregado mediante Entity Framework Core siguiendo el patrón *Repository* (Fowler, 2002), y el adaptador de correo, que aísla al dominio del servicio externo.

**Figura 4.95**

*Diagrama de componentes de la API web (modelo C4, nivel 3)*

<p align="center">
  <img src="assets/images/chapter-04/c4-componentes.png" alt="Diagrama de componentes de la API web (modelo C4, nivel 3)" width="1000"><br>
  <i>Nota.</i> Elaboración propia, con base en el modelo C4 y en Domain-Driven Design.
</p>

**Tabla 4.28**

*Componentes de la API web*


| Componente | Tipo | Responsabilidad |
| :--- | :--- | :--- |
| **IAM Controller** | Controlador REST | Registro, inicio de sesión, recuperación de contraseña y perfil. |
| **Fleet Controller** | Controlador REST | Vehículos, conductores y sensores. |
| **Shipment Controller** | Controlador REST | Envíos y su ciclo de vida. |
| **Telemetry Controller** | Controlador REST | Recepción de lecturas y posiciones de los sensores y consulta de series para los gráficos. |
| **Alerts & Reports Controller** | Controlador REST | Alertas, notificaciones, incidencias y reportes. |
| **IAM Module** | Módulo de dominio | Cuentas, sesiones con JWT y perfiles. |
| **Fleet & Resource Module** | Módulo de dominio | Unidades, conductores, sensores y reservas. |
| **Shipment Module** | Módulo de dominio | Programación, tránsito, entrega y cancelación. Solicita la reserva y la liberación de recursos, y el inicio y la detención del monitoreo. |
| **Monitoring & Telemetry Module** | Módulo de dominio | Lecturas, evaluación de rango y de señal, y posiciones. Solicita y resuelve alertas. |
| **Alert & Reporting Module** | Módulo de dominio | Alertas, acciones correctivas, notificaciones y reportes PDF. |
| **Persistencia** | Infraestructura | `DbContext` y repositorios de cada agregado con Entity Framework Core. |
| **Adaptador de correo** | Infraestructura | Envía los correos transaccionales al servicio externo. |

*Nota.* Elaboración propia.

Las relaciones entre módulos reproducen el mapa de contextos: Shipment Module invoca a Fleet & Resource Module (reservar y liberar) y a Monitoring & Telemetry Module (iniciar y detener el monitoreo), y este a su vez invoca a Alert & Reporting Module (solicitar y resolver alertas). Estas invocaciones se realizan mediante los eventos de dominio de la Tabla 4.25, lo que evita dependencias directas entre los agregados de distintos contextos.

## 4.7. Software Object-Oriented Design

### 4.7.1. Class Diagrams

El diseño orientado a objetos de FríoTrack traduce a clases el modelo de dominio de la sección 4.6. Se emplean los bloques tácticos de DDD descritos por Evans (2003) y Vernon (2013): agregados con una raíz que protege las reglas de negocio, entidades con identidad propia, objetos de valor sin identidad y enumeraciones para los estados. Los diagramas usan la notación de clases de UML (Fowler, 2004): cada clase muestra sus atributos y métodos con su visibilidad; la línea con rombo relleno indica composición, es decir, que el ciclo de vida de la parte depende del agregado; la flecha continua indica una asociación; la flecha discontinua indica el uso de una enumeración; y los estereotipos `«enumeration»` y `«value object»` señalan esos tipos. Las clases con fondo amarillo son referencias a clases definidas en otro diagrama.

Se toman cuatro decisiones de diseño:

- Las asociaciones entre agregados de distintos contextos, como la que une `Alert` con `Shipment`, se implementan mediante el identificador del agregado y no mediante una referencia directa a objeto, de manera que cada agregado se puede cargar y guardar por separado, y se corresponden con las claves foráneas de la sección 4.8.
- `ThermalRange` es un objeto de valor inmutable. Lo posee `Shipment` y `ShipmentMonitoring` recibe una copia al iniciar el monitoreo, con lo que la evaluación de las lecturas no cambia si el envío se edita después.
- La sesión de autenticación (`AuthSession`) es un token JWT sin estado y por ello no aparece como clase persistente, y el perfil (`UserProfile`) se modela con los atributos de perfil de `UserAccount`.
- Los cambios de estado se realizan solo mediante métodos de la raíz del agregado (`schedule()`, `startTransit()`, `markDelivered()`, `cancel()`), que validan que la transición sea permitida y emiten el evento de dominio correspondiente.

#### Diagrama de clases 1 · IAM, Fleet & Resource Management y Shipment Management

El primer diagrama contiene los contextos IAM, Fleet & Resource Management y Shipment Management. `UserAccount` es la raíz de IAM y encapsula la autenticación, el bloqueo tras intentos fallidos y la actualización del perfil; `PasswordResetToken` guarda solo el resumen (*hash*) del token de recuperación, con su vencimiento. En Fleet & Resource Management, `Vehicle` y `Driver` son raíces que responden si están disponibles en un intervalo; `Sensor` se asigna a un vehículo; y `FleetAllocation` representa la reserva de una unidad y un conductor para un envío. En Shipment Management, `Shipment` es la raíz central, contiene el objeto de valor `ThermalRange` y el historial `ShipmentStatusChange`, y se asocia con el Coordinador Logístico y con el Cliente de Carga, que son instancias de `UserAccount`.

**Figura 4.96**

*Diagrama de clases 1: IAM, Fleet & Resource Management y Shipment Management*

<p align="center">
  <img src="assets/images/chapter-04/class-diagram-1.png" alt="Diagrama de clases 1: IAM, Fleet & Resource Management y Shipment Management" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Tabla 4.29**

*Clases principales de los contextos IAM, Fleet & Resource Management y Shipment Management*


| Clase | Contexto | Tipo | Responsabilidad |
| :--- | :--- | :--- | :--- |
| `UserAccount` | IAM | Agregado raíz | Autentica al usuario, cambia la contraseña, actualiza el perfil, registra intentos fallidos y determina si la cuenta está bloqueada. |
| `PasswordResetToken` | IAM | Entidad | Representa un enlace de recuperación de contraseña, con vencimiento y uso único. |
| `UserRole` | IAM | Enumeración | `LOGISTICS_COORDINATOR` y `CARGO_CLIENT`. |
| `Vehicle` | Fleet & Resource | Agregado raíz | Determina su disponibilidad en un intervalo, pasa a mantenimiento o vuelve a servicio y se le asigna un sensor. |
| `Sensor` | Fleet & Resource | Entidad | Dispositivo de temperatura, humedad y GPS asociado a una unidad. |
| `Driver` | Fleet & Resource | Agregado raíz | Determina su disponibilidad y puede desactivarse. |
| `FleetAllocation` | Fleet & Resource | Agregado raíz | Reserva y libera la unidad y el conductor de un envío en un intervalo. |
| `Shipment` | Shipment | Agregado raíz | Programa, inicia, entrega y cancela el envío; actualiza la llegada estimada y puede volver a borrador. |
| `ThermalRange` | Shipment | Objeto de valor | Temperatura mínima y máxima, humedad máxima y tolerancia; indica si una temperatura está dentro del rango y cuánto se desvía. |
| `ShipmentStatusChange` | Shipment | Entidad | Registra cada cambio de estado con su fecha, lo que alimenta el historial de estados. |
| `ShipmentStatus` | Shipment | Enumeración | `DRAFT`, `SCHEDULED`, `IN_TRANSIT`, `DELIVERED` y `CANCELLED`. |

*Nota.* Elaboración propia.

#### Diagrama de clases 2 · Monitoring & Telemetry y Alert & Reporting

El segundo diagrama contiene los dos contextos que reaccionan a las lecturas de los sensores. `ShipmentMonitoring` es la raíz del monitoreo: registra lecturas y posiciones, marca la pérdida de señal y se detiene al concluir el envío. Cada `SensorReading` sabe evaluarse frente a un `ThermalRange` y guarda el resultado. En Alert & Reporting, `Alert` es la raíz que se escala a crítica, recibe la acción correctiva y se resuelve; `Notification` registra los avisos y su lectura; `Incident` y `ThermalReport` son agregados propios asociados a un envío. Los tipos de alerta (`AlertType`) incluyen temperatura fuera de rango, temperatura cerca del límite, humedad fuera de rango, puerta abierta y pérdida de señal.

**Figura 4.97**

*Diagrama de clases 2: Monitoring & Telemetry y Alert & Reporting*

<p align="center">
  <img src="assets/images/chapter-04/class-diagram-2.png" alt="Diagrama de clases 2: Monitoring & Telemetry y Alert & Reporting" width="1000"><br>
  <i>Nota.</i> Elaboración propia.
</p>

**Tabla 4.30**

*Clases principales de los contextos Monitoring & Telemetry y Alert & Reporting*


| Clase | Contexto | Tipo | Responsabilidad |
| :--- | :--- | :--- | :--- |
| `ShipmentMonitoring` | Monitoring & Telemetry | Agregado raíz | Registra lecturas y posiciones, mantiene el estado de la señal y se detiene al concluir el envío. |
| `SensorReading` | Monitoring & Telemetry | Entidad | Lectura de temperatura y humedad con su fecha; se evalúa frente al rango térmico. |
| `PositionReport` | Monitoring & Telemetry | Entidad | Posición GPS reportada con su fecha. |
| `SignalStatus` | Monitoring & Telemetry | Enumeración | `ONLINE` y `NO_SIGNAL`. |
| `Alert` | Alert & Reporting | Agregado raíz | Se escala de advertencia a crítica, recibe acciones correctivas y se resuelve. |
| `CorrectiveAction` | Alert & Reporting | Entidad | Acción registrada por el Coordinador Logístico, con comentario e indicación de si se notifica al cliente. |
| `Notification` | Alert & Reporting | Agregado raíz | Aviso dirigido a un usuario; se marca como leído. |
| `Incident` | Alert & Reporting | Agregado raíz | Evento del traslado registrado por el Coordinador Logístico. |
| `ThermalReport` | Alert & Reporting | Agregado raíz | Genera y entrega el documento PDF del envío con su resumen. |
| `AlertType`, `AlertStatus`, `AlertSeverity` | Alert & Reporting | Enumeraciones | Tipo de alerta; estado (`ACTIVE`, `ACKNOWLEDGED`, `RESOLVED`); severidad (`WARNING`, `CRITICAL`). |

*Nota.* Elaboración propia.

El estado de una alerta evoluciona de manera coherente con el flujo de usuario de la sección 4.4.4: nace como `ACTIVE`, pasa a `ACKNOWLEDGED` cuando el Coordinador Logístico registra la acción correctiva y a `RESOLVED` cuando una lectura vuelve al rango.

## 4.8. Database Design

### 4.8.1. Database Diagrams

La base de datos de FríoTrack es relacional y se implementa en PostgreSQL. El diseño parte del modelo entidad-relación propuesto por Chen (1976) y de las reglas de normalización expuestas por Elmasri y Navathe (2016): cada agregado del modelo de clases se representa con una tabla raíz y con tablas dependientes, y las tablas se llevaron a tercera forma normal, salvo dos decisiones deliberadas de desnormalización que se explican más adelante. El esquema tiene 16 tablas que se agrupan por contexto delimitado. En el diagrama, cada grupo tiene un color de encabezado: azul para IAM, verde para Fleet & Resource Management, amarillo para Shipment Management, turquesa para Monitoring & Telemetry y rosado para Alert & Reporting. Las líneas terminadas en «pata de gallo» indican el lado «muchos» de una relación, y la marca `PK`, `FK` o `UK` indica clave primaria, foránea o única, respectivamente.

**Figura 4.98**

*Diagrama entidad-relación de la base de datos de FríoTrack*

<p align="center">
  <img src="assets/images/chapter-4/erd-friotrack.png" alt="Diagrama entidad-relación de la base de datos de FríoTrack" width="1000"><br>
  <i>Nota.</i> Elaboración propia. En la versión digital se puede ampliar la imagen para leer las columnas de cada tabla.
</p>

**Tabla 4.31**

*Tablas de la base de datos por contexto delimitado*


| Contexto | Tabla | Descripción |
| :--- | :--- | :--- |
| IAM | `users` | Cuentas de usuario con rol, idioma, intentos fallidos y bloqueo. |
| IAM | `password_reset_tokens` | Tokens de recuperación de contraseña, guardados como resumen, con vencimiento y fecha de uso. |
| Fleet & Resource | `vehicles` | Unidades refrigeradas de una empresa de transporte, con placa única y estado. |
| Fleet & Resource | `sensors` | Sensores; cada uno se asocia como máximo a un vehículo. |
| Fleet & Resource | `drivers` | Conductores, con licencia única y estado. |
| Fleet & Resource | `fleet_allocations` | Reserva de un vehículo y un conductor para un envío, con su intervalo y estado. |
| Shipment | `shipments` | Envíos con su carga, rango térmico, ruta, horarios y estado. |
| Shipment | `shipment_status_history` | Historial de cambios de estado de cada envío y quién los realizó. |
| Monitoring & Telemetry | `shipment_monitorings` | Monitoreo de un envío: copia del rango térmico, estado de la señal y fechas de inicio y fin. |
| Monitoring & Telemetry | `sensor_readings` | Lecturas de temperatura y humedad, con el resultado de la evaluación. |
| Monitoring & Telemetry | `position_reports` | Posiciones GPS reportadas. |
| Alert & Reporting | `alerts` | Alertas con tipo, severidad, estado y la lectura que las originó. |
| Alert & Reporting | `corrective_actions` | Acciones correctivas registradas ante una alerta. |
| Alert & Reporting | `notifications` | Notificaciones dirigidas a un usuario, con su estado de lectura. |
| Alert & Reporting | `incidents` | Incidencias registradas para un envío. |
| Alert & Reporting | `thermal_reports` | Reportes térmicos generados, con la ruta del archivo y un resumen en formato JSON. |

*Nota.* Elaboración propia.

**Decisiones de diseño.** Se adoptaron las siguientes decisiones:

- Se utilizan identificadores UUID en las tablas de negocio, para poder generarlos en la aplicación sin consultar la base de datos, y un entero de 64 bits (`bigint`) en `sensor_readings` y `position_reports`, que son las tablas de mayor crecimiento.
- Todas las fechas usan `timestamptz` (fecha y hora con zona horaria), para que las lecturas y las alertas sean comparables sin importar la zona horaria de la unidad.
- La temperatura y la humedad se almacenan en tipos `numeric` con precisión fija, para evitar los errores de redondeo de los tipos de punto flotante al compararlas con el rango.
- Las relaciones uno a uno (un sensor por vehículo, una reserva por envío y un monitoreo por envío) se garantizan con restricciones de unicidad sobre la clave foránea.
- Los estados se almacenan como texto con una restricción `CHECK` que limita los valores permitidos, alineados con las enumeraciones del modelo de clases.
- Se prevén índices sobre los patrones de consulta más frecuentes: `sensor_readings (monitoring_id, recorded_at)` para los gráficos de lecturas, `shipments (status)` para las listas filtradas, `alerts (shipment_id, status)` para la pestaña Alertas y `notifications (user_id, read_at)` para el contador de avisos sin leer.
- **Desnormalización deliberada:** el rango térmico se guarda en `shipments`, como atributos del envío, y se copia a `shipment_monitorings` al iniciar el monitoreo, porque debe conservarse tal como estaba cuando se evaluaron las lecturas; y el resumen del reporte se guarda como `jsonb` en `thermal_reports`, porque es una fotografía del envío al momento de generar el documento y no se consulta por campos.

La Tabla 4.32 lista las relaciones del esquema. Las claves foráneas hacia `users` se mantienen entre contextos porque solo identifican a la persona (quién programó, quién registró); no exponen los datos internos de IAM a los demás contextos.

**Tabla 4.32**

*Relaciones entre tablas*


| Tabla hija | Columna | Tabla padre | Cardinalidad | Significado |
| :--- | :--- | :--- | :---: | :--- |
| `password_reset_tokens` | `user_id` | `users` | N : 1 | Usuario que solicitó la recuperación. |
| `vehicles` | `owner_id` | `users` | N : 1 | Empresa de transporte propietaria de la unidad. |
| `sensors` | `vehicle_id` | `vehicles` | 1 : 1 | Unidad en la que está instalado el sensor. |
| `drivers` | `owner_id` | `users` | N : 1 | Empresa de transporte que emplea al conductor. |
| `shipments` | `coordinator_id` | `users` | N : 1 | Coordinador Logístico que programó el envío. |
| `shipments` | `client_id` | `users` | N : 1 | Cliente de Carga destinatario del envío. |
| `shipment_status_history` | `shipment_id`, `changed_by` | `shipments`, `users` | N : 1 | Envío cuyo estado cambió y usuario que lo cambió. |
| `fleet_allocations` | `shipment_id` | `shipments` | 1 : 1 | Envío al que corresponde la reserva. |
| `fleet_allocations` | `vehicle_id`, `driver_id` | `vehicles`, `drivers` | N : 1 | Unidad y conductor reservados. |
| `shipment_monitorings` | `shipment_id` | `shipments` | 1 : 1 | Envío que se monitorea. |
| `sensor_readings` | `monitoring_id` | `shipment_monitorings` | N : 1 | Monitoreo al que pertenece la lectura. |
| `position_reports` | `monitoring_id` | `shipment_monitorings` | N : 1 | Monitoreo al que pertenece la posición. |
| `alerts` | `shipment_id`, `trigger_reading_id` | `shipments`, `sensor_readings` | N : 1 | Envío afectado y lectura que originó la alerta. |
| `corrective_actions` | `alert_id`, `registered_by` | `alerts`, `users` | N : 1 | Alerta atendida y usuario que registró la acción. |
| `notifications` | `user_id`, `alert_id`, `shipment_id` | `users`, `alerts`, `shipments` | N : 1 | Destinatario y origen del aviso. |
| `incidents` | `shipment_id`, `registered_by` | `shipments`, `users` | N : 1 | Envío afectado y usuario que registró la incidencia. |
| `thermal_reports` | `shipment_id`, `generated_by` | `shipments`, `users` | N : 1 | Envío reportado y usuario que generó el documento. |

*Nota.* Elaboración propia.

Con este esquema se pueden responder las consultas que las pantallas de la sección 4.4 requieren, por ejemplo: la lista de envíos activos de una empresa con su última lectura (Dashboard y Envíos), las lecturas de un envío en las últimas 12 horas (gráfico del detalle), las alertas activas de un envío (pestaña Alertas), los avisos sin leer de un usuario (campana de notificaciones) y el historial de envíos entregados de un cliente con su reporte (Historial).
