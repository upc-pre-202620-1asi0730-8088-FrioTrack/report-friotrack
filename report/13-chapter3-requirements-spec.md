# Capítulo III: Requirements Specification

## 3.1. Epics

| Epic ID | Título | Descripción |
| :--- | :--- | :--- |
| **EP01** | Panel de Monitoreo en Tiempo Real (Dashboard) | Épica que agrupa las funcionalidades clave para la supervisión telemática en tiempo real de temperatura, humedad y ubicación de la flota agroexportadora. |
| **EP02** | Sistema de Alertas Automatizadas | Épica encargada de la detección temprana, emisión y notificación de alertas ante excursiones térmicas o anomalías críticas en ruta. |
| **EP03** | Historial, Auditoría e Informes de Envíos | Épica enfocada en el almacenamiento, consulta, exportación y análisis de registros térmicos históricos para auditorías de calidad y cumplimiento normativo. |
| **EP04** | Gestión de Flota, Conductores y Dispositivos IoT | Épica dedicada al registro, administración, asignación de unidades frigoríficas, personal de transporte y asociación de dispositivos sensores IoT. |
| **EP05** | Autenticación y Gestión de Usuarios | Épica orientada al control de accesos, inicio de sesión seguro, recuperación de credenciales y administración de perfiles. |
| **EP06** | Gestión de la Landing Page y Captación | Épica que agrupa los requerimientos asociados al sitio web estático institucional de presentación, propuesta de valor y captación de clientes de FríoTrack. |
| **EP07** | RESTful API Backend & Servicios Transversales | Épica técnica dedicada al desarrollo de la API de servicios bajo arquitectura REST (C# / ASP.NET Core), seguridad, gestión de reportes ejecutivos en PDF, multi-idioma (i18n) y analítica avanzada. |





## 3.2. Impact Mapping
<img src="assets/images/chapter-03/impact_mapping01.png" alt="Impact Mapping de FríoTrack" width="100%">
<img src="assets/images/chapter-03/impact_mapping02.png" alt="Impact Mapping de FríoTrack" width="100%">
<img src="assets/images/chapter-03/impact_mapping03.png" alt="Impact Mapping de FríoTrack" width="100%">

## 3.3. Product Backlog

| # Orden | User Story Id | Título | Descripción | Story Points (1 / 2 / 3 / 5 / 8) |
| :---: | :---: | :--- | :--- | :---: |
| 1 | **US01** | Propuesta de Valor en Landing | Como visitante, quiero visualizar la propuesta de valor para entender el servicio de monitoreo en frío. | 3 |
| 2 | **US02** | Consulta de Corredores | Como agroexportador, quiero consultar los corredores logísticos cubiertos para verificar la cobertura de mis rutas. | 3 |
| 3 | **US03** | Formulario de Contacto | Como usuario potencial, quiero enviar un formulario de contacto para solicitar cotizaciones. | 2 |
| 4 | **US04** | Testimonios y Casos de Éxito | Como visitante, quiero ver casos de éxito para generar confianza en la plataforma. | 2 |
| 5 | **US05** | Preguntas Frecuentes (FAQ) | Como usuario, quiero resolver dudas rápidas sobre el monitoreo IoT de alimentos. | 1 |
| 6 | **US10** | Mapa Interactivo de Envíos | Como coordinador logístico, quiero ver la ubicación de las unidades en tiempo real sobre un mapa. | 8 |
| 7 | **US11** | Búsqueda y Filtros de Envíos | Como coordinador, quiero filtrar envíos activos por código o unidad para localizarlos rápido. | 3 |
| 8 | **US12** | Indicadores Visuales de Estado | Como operador, quiero ver estados visuales rápidos de cada trayecto en curso. | 2 |
| 9 | **US13** | Telemetría en Vivo | Como operador, quiero visualizar la temperatura actual del contenedor en tiempo real. | 5 |
| 10 | **US14** | Historial de Coordenadas | Como operador, quiero consultar el recorrido pasado de un viaje finalizado. | 3 |
| 11 | **US15** | Alertas de Excursiones Térmicas | Como coordinador, quiero recibir notificaciones ante salidas de rango térmico. | 5 |
| 12 | **US16** | Notificaciones Push | Como coordinador, quiero alertas instantáneas en dispositivo móvil. | 3 |
| 13 | **US17** | Configuración de Umbrales | Como gestor de calidad, quiero definir rangos térmicos por tipo de alimento transportado. | 5 |
| 14 | **US18** | Historial de Alertas | Como gestor de calidad, quiero consultar registros de alertas pasadas para auditorías. | 3 |
| 15 | **US19** | Registro de Unidades | Como administrador, quiero registrar vehículos y contenedores de frío en el sistema. | 3 |
| 16 | **US20** | Edición de Unidades | Como administrador, quiero actualizar las características de la flota registrada. | 2 |
| 17 | **US21** | Registro de Conductores | Como administrador, quiero registrar al personal de conducción autorizado. | 3 |
| 18 | **US22** | Asignación de Chofer a Ruta | Como coordinador, quiero vincular un conductor a una unidad y envío específico. | 3 |
| 19 | **US23** | Consulta de Historial Térmico | Como gestor de calidad, quiero revisar registros de envíos pasados para control de calidad. | 5 |
| 20 | **US24** | Exportación de Trazabilidad | Como agroexportador, quiero exportar reportes térmicos para resolver reclamaciones comerciales. | 5 |
| 21 | **US25** | Gráficos Estadísticos | Como agroexportador, quiero ver gráficos de estabilidad térmica mensual. | 3 |
| 22 | **US26** | Bitácora de Auditoría | Como gestor de calidad, quiero auditar el registro de modificaciones críticas. | 3 |
| 23 | **US27** | Reportes Ejecutivos en PDF | Como agroexportador, quiero generar reportes ejecutivos mensuales con resumen de operaciones. | 5 |
| 24 | **US28** | Panel de Analítica Global | Como administrador, quiero visualizar métricas globales del desempeño del sistema. | 5 |
| 25 | **US29** | Configuración IoT | Como técnico, quiero asociar sensores de temperatura físicos a las unidades de transporte. | 5 |
| 26 | **US30** | Soporte Multi-idioma (i18n) | Como usuario internacional, quiero cambiar el idioma de la plataforma. | 3 |
| 27 | **US06** | Registro de Cuenta | Como usuario nuevo, quiero registrarme ingresando mis datos básicos de acceso. | 3 |
| 28 | **US07** | Inicio de Sesión (Login) | Como usuario registrado, quiero autenticarme de forma segura en la plataforma. | 3 |
| 29 | **US08** | Recuperación de Contraseña | Como usuario, quiero recuperar mi acceso si olvidé mi clave de ingreso. | 2 |
| 30 | **US09** | Gestión de Perfil | Como usuario, quiero editar mis datos personales y de contacto en el sistema. | 2 |

## Referencia y Enlace Público
- **Herramienta de gestión:** Trello
- **URL Pública del Product Backlog:** https://trello.com/b/6qrvOukt/blackstartup-fr%C3%ADotrack

## Captura de pantalla 
<div align="center">
  <img src="assets/images/chapter-03/trello_cap.png" alt="Captura de pantalla de Trello" width="60%">
</div>
