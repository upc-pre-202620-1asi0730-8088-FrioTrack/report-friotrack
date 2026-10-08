# Conclusiones y Recomendaciones

## Conclusiones

La revisión delimitó FríoTrack como transporte refrigerado de alimentos: programación, recursos, monitoreo, alertas y trazabilidad. Inventario y FEFO se excluyeron del alcance vigente para evitar contradicciones con los segmentos y la arquitectura. Los antecedentes nacionales ofrecen contexto, pero no prueban por sí solos demanda, adopción de IoT o pérdidas atribuibles a transporte.

Se integró el capítulo III con un catálogo único de Epics, historias, criterios Gherkin y backlog. Las personas PP01/PP02 del dominio de transporte son hipótesis: las tres entrevistas históricas se conservan sin convertir participantes del inventario en usuarios validados de transporte. El mínimo de investigación pertinente sigue pendiente.

La primera aplicación Vue/PrimeVue ofrece una base demostrativa local para programación, monitoreo de muestras, acción correctiva y consulta cliente. Se verificaron esos recorridos en navegador, 15 pruebas del dominio y un build sin advertencias; el alcance y las capturas están en Sprint 2. El diseño separa landing estática, cliente SPA, API y base de datos. El cliente no demuestra autenticación real, sensores ni REST API; la primera API desplegada corresponde a AV2.

La revisión corrige errores y genera materiales revisables. TB1 no está completo mientras falten publicación y URL del primer frontend, actualización de herramientas prescritas, videos y evidencias reales de colaboración. No se atribuyen resultados comerciales, satisfacción o reducción de pérdidas a la demo.

## Recomendaciones

Priorizar entrevistas pertinentes y actualizar personas/Impact Mapping según hallazgos reales antes de ampliar el roadmap. Registrar todas las estimaciones y decisiones en una sesión del equipo; completar Trello, Figma y UXPressia con IDs consistentes. Revisar el código entre integrantes y publicar contribuciones reales sin fabricar commits.

Desplegar el frontend después de la revisión y conectar los CTA de la landing con URLs HTTPS verificadas. En AV2 sustituir LocalDemoRepository con la API interna, validar permisos en servidor, integrar persistencia y documentar los contratos OpenAPI. Los datos térmicos y el reporte de prueba no se usan como evidencia de una operación comercial.

# Bibliografía


* Agafonkin, V. (s. f.). *Leaflet: An open-source JavaScript library for interactive maps*. [https://leafletjs.com](https://leafletjs.com)
* Andersson, R. (s. f.). *Inter* [Tipografía]. [https://rsms.me/inter/](https://rsms.me/inter/)
* Banco Mundial. (2023). *Logistics Performance Index 2023: Mind the gap*. [LPI report 2023](https://lpi.worldbank.org/sites/default/files/2023-04/LPI_2023_report_with_layout.pdf)
* Brandolini, A. (2021). *Introducing EventStorming*. Leanpub. [https://leanpub.com/introducing_eventstorming](https://leanpub.com/introducing_eventstorming)
* Brown, S. (s. f.). *The C4 model for visualising software architecture*. Leanpub. [https://leanpub.com/visualising-software-architecture](https://leanpub.com/visualising-software-architecture)
* Buxton, B. (2007). *Sketching user experiences: Getting the design right and the right design*. Morgan Kaufmann.
* Chen, P. P.-S. (1976). The entity-relationship model—Toward a unified view of data. *ACM Transactions on Database Systems, 1*(1), 9–36. [https://doi.org/10.1145/320434.320440](https://doi.org/10.1145/320434.320440)
* Elmasri, R., y Navathe, S. B. (2016). *Fundamentals of database systems* (7.ª ed.). Pearson.
* Evans, E. (2003). *Domain-driven design: Tackling complexity in the heart of software*. Addison-Wesley.
* Fowler, M. (2002). *Patterns of enterprise application architecture*. Addison-Wesley.
* Fowler, M. (2004). *UML distilled: A brief guide to the standard object modeling language* (3.ª ed.). Addison-Wesley.
* Garrett, J. J. (2011). *The elements of user experience: User-centered design for the web and beyond* (2.ª ed.). New Riders.
* Google. (s. f.). *Material Design 3*. [https://m3.material.io/](https://m3.material.io/)
* Google Search Central. (s. f.). *Robots meta tags specifications*. [https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag](https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag)
* Instituto Nacional de Estadística e Informática. (2024, 15 de febrero). *Producción nacional disminuyó 0,55 % en el año 2023*. [Comunicado INEI](https://www.gob.pe/institucion/inei/noticias/906643-produccion-nacional-disminuyo-0-55-en-el-ano-2023).
* International Organization for Standardization. (2019). *Ergonomics of human-system interaction — Part 210: Human-centred design for interactive systems* (ISO 9241-210:2019). [https://www.iso.org/standard/77520.html](https://www.iso.org/standard/77520.html)
* Jones, M., Bradley, J., y Sakimura, N. (2015). *JSON Web Token (JWT)* (RFC 7519). Internet Engineering Task Force. [https://www.rfc-editor.org/info/rfc7519](https://www.rfc-editor.org/info/rfc7519)
* Krug, S. (2014). *Don't make me think, revisited: A common sense approach to web usability* (3.ª ed.). New Riders.
* Marcotte, E. (2010, 25 de mayo). Responsive web design. *A List Apart*. [https://alistapart.com/article/responsive-web-design/](https://alistapart.com/article/responsive-web-design/)
* Mercier, S., Villeneuve, S., Mondor, M., y Uysal, I. (2017). Time–temperature management along the food cold chain: A review of recent developments. *Comprehensive Reviews in Food Science and Food Safety, 16*(4), 647–667. [https://doi.org/10.1111/1541-4337.12269](https://doi.org/10.1111/1541-4337.12269)
* Ministerio de Transportes y Comunicaciones. (2023). *Plan Nacional de Servicios e Infraestructura Logística de Transporte al 2032* (Resolución Ministerial N.° 362-2023-MTC/01). [Plan aprobado por MTC](https://www.gob.pe/institucion/mtc/normas-legales/4081616-362-2023-mtc-01)
* Nielsen, J. (1994). *10 usability heuristics for user interface design*. Nielsen Norman Group. [https://www.nngroup.com/articles/ten-usability-heuristics/](https://www.nngroup.com/articles/ten-usability-heuristics/)
* Norman, D. A. (2013). *The design of everyday things* (ed. rev. y ampliada). Basic Books.
* OpenStreetMap Foundation. (s. f.). *OpenStreetMap*. [https://www.openstreetmap.org](https://www.openstreetmap.org)
* Organización de las Naciones Unidas para la Alimentación y la Agricultura. (2026). *FAO y MIDAGRI fortalecen acciones para reducir la pérdida y desperdicio de alimentos en el Perú*. [Noticia FAO Perú](https://www.fao.org/peru/noticias/detail/fao-y-midagri-fortalecen-acciones-para-reducir-la-p%C3%A9rdida-y-desperdicio-de-alimentos-en-el-per%C3%BA/es).
* The PostgreSQL Global Development Group. (s. f.). *PostgreSQL documentation*. [https://www.postgresql.org/docs/](https://www.postgresql.org/docs/)
* PrimeTek. (s. f.). *PrimeVue*. [https://primevue.org](https://primevue.org)
* Rosenfeld, L., Morville, P., y Arango, J. (2015). *Information architecture: For the web and beyond* (4.ª ed.). O'Reilly Media.
* Vernon, V. (2013). *Implementing domain-driven design*. Addison-Wesley.
* World Wide Web Consortium. (2023). *Accessible Rich Internet Applications (WAI-ARIA) 1.2*. [https://www.w3.org/TR/wai-aria-1.2/](https://www.w3.org/TR/wai-aria-1.2/)
* World Wide Web Consortium. (2024). *Web Content Accessibility Guidelines (WCAG) 2.2*. [https://www.w3.org/TR/WCAG22/](https://www.w3.org/TR/WCAG22/)
* Wroblewski, L. (2011). *Mobile first*. A Book Apart.


* Tive. (s. f.). *Real-time trackers*. [Producto oficial](https://www.tive.com/products/real-time-trackers). Consultado el 06/10/2026.
* Tive. (s. f.). *Cold chain monitoring*. [Solución oficial](https://www.tive.com/solutions/cold-chain-monitoring). Consultado el 06/10/2026.
* Sensitech. (s. f.). *SensiWatch Platform*. [Plataforma oficial](https://www.sensitech.com/en/products/sensiwatch-platform/). Consultado el 06/10/2026.
* Sensitech. (s. f.). *Food Supply Chain Visibility Solutions*. [Sector alimentos](https://www.sensitech.com/en/industries/food/). Consultado el 06/10/2026.
* Controlant. (s. f.). *The Controlant Platform*. [Plataforma oficial](https://www.controlant.com/platform). Consultado el 06/10/2026.
* Controlant. (s. f.). *System overview*. [Documentación oficial](https://support.controlant.com/en/20956-39992-system-overview.html). Consultado el 06/10/2026.
* Portigal, S. (2013). *Interviewing users: How to uncover compelling insights*. Rosenfeld Media.
* Goodman, E., Kuniavsky, M., y Moed, A. (2012). *Observing the user experience: A practitioner's guide to user research* (2.ª ed.). Morgan Kaufmann.
* Microsoft. (s. f.). *C# coding conventions*. [Documentación oficial](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions).
* Vue.js. (s. f.). *Style Guide*. [Documentación oficial](https://vuejs.org/style-guide/).
* Semantic Versioning. (s. f.). *Semantic Versioning 2.0.0*. [Especificación](https://semver.org/).
* Conventional Commits. (s. f.). *Conventional Commits 1.0.0*. [Especificación](https://www.conventionalcommits.org/en/v1.0.0/).

# Anexos

## Anexo A. Participant Performance Report

El Anexo B del statement requiere Word y PDF, preparados por Team Leader, con calificaciones 20/16/13/07/00. Se entrega un borrador editable TB1 con nombres del equipo y campos sin calificar. No acredita evaluación ni firma del líder. Los archivos AV1 aparecen declarados en el informe histórico, pero no se encontraron adjuntos en este repositorio.

## Anexo B. Repositorios y ejecución

| Producto | Fuente | Estado |
|---|---|---|
| Informe | [Repositorio existente](https://github.com/upc-pre-202620-1asi0730-8088-FrioTrack/report-friotrack) | Correcciones locales sin push |
| Landing | [Repositorio existente](https://github.com/upc-pre-202620-1asi0730-8088-FrioTrack/friotrack-landing) | Fuente local modificada |
| Frontend | `apps/friotrack-web` | Fuente local; repositorio público propio pendiente |
| API | Sin repositorio proporcionado | Pendiente AV2 |

## Anexo C. Despliegues

La [landing publicada AV1](https://upc-pre-202620-1asi0730-8088-friotrack.github.io/friotrack-landing/) se conserva. Los puertos locales 4175 (landing), 5173 (Vite dev) y 4173 (preview) son revisión local, no URLs públicas. La publicación de las correcciones y primera aplicación está pendiente.

## Anexo D. Tableros y artefactos compartidos

[Trello histórico](https://trello.com/b/6qrvOukt/blackstartup-friotrack) requiere actualizar catálogo/Sprint2 y capturas. Las imágenes históricas de UXPressia/Figma no acreditan una actualización; se proporcionan matrices y fuentes locales. El equipo debe completar los artefactos en las herramientas solicitadas y comprobar el acceso del docente.

## Anexo E. Videos de exposiciones

| Entrega | Nombre / ubicación | Evidencia |
|---|---|---|
| AV1 | URL Stream registrada en `archive/16-backmatter-av1.md` | Histórica, acceso privado no verificado en esta revisión |
| TB1 | `upc-pre-202620-1asi0730-8088-blackstartup-expo-tb1.mp4` | Pendiente de grabación real, todos ante cámara; falta archivo y URL Stream privada |

Faltan el consolidado de entrevistas y el video del prototipo con sus capturas, tiempos y enlaces. El paquete sí contiene un video silencioso de ejecución local del frontend de 4:46, descrito en 5.2.2.5; usa capturas muestreadas de un recorrido real y todavía no tiene narración ni URL de Stream. No sustituye la exposición con los cinco ante cámara. La guía de grabación está en `TB1_DELIVERY_GUIDE.md`.

## Anexo F. Matriz de entrega y pendientes

La checklist operativa se mantiene en [TB1_CHECKLIST.md](TB1_CHECKLIST.md). Distingue el statement, las observaciones del profesor, la solicitud del usuario y recomendaciones. El equipo confirmó la segunda sesión semanal los sábados de 09:00 a 11:00 (Lima); la regla de 24 horas antes fija el viernes a las 09:00. Falta confirmar la semana asignada a TB1.

## Anexo G. Verificación de la versión local

Los resultados automáticos y de navegador están en `work/verification-results.json`; las fuentes y capturas de ejecución se describen en Sprint2. La revisión no prueba integración API, seguridad servidor, exactitud de sensores, entrevistas o colaboración humana. Los archivos del paquete y sus hashes quedan en `outputs/DELIVERY_MANIFEST.json`.
