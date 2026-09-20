# Conclusiones y Recomendaciones

## Conclusiones

* **Atención a una brecha estructural del sector logístico peruano:** El posicionamiento del Perú en el puesto 61 de 139 países del Índice de Desempeño Logístico del Banco Mundial (2023), sumado a la pérdida de más de 12 millones de toneladas de alimentos reportada por la FAO (2022), evidencia que la ausencia de monitoreo remoto en el transporte refrigerado es una falla estructural y no un problema aislado de unas pocas empresas. FríoTrack responde a esta brecha centralizando en un panel interactivo la telemetría térmica, la geolocalización y la emisión automática de alertas, dirigido específicamente a los corredores logísticos de mayor movimiento agroexportador (La Libertad, Ica, Piura y Lambayeque hacia Lima Metropolitana).

* **Complementariedad entre los dos segmentos objetivo:** El diseño de FríoTrack reconoce que las empresas de transporte refrigerado y los productores/exportadores/compradores no son audiencias aisladas, sino dos extremos de una misma cadena de valor con necesidades distintas pero interdependientes: mientras el transportista necesita demostrar objetivamente el cumplimiento térmico, el comprador necesita anticipar el estado de la carga antes de recibirla. Esta doble validación, confirmada durante el proceso de *needfinding* y las entrevistas con ambos segmentos, sustenta la decisión de construir perfiles de usuario diferenciados (*Coordinador Logístico* y *Cliente de Carga*) dentro de una misma plataforma.

* **Coherencia entre el modelo de dominio, el diseño de interfaz y la implementación inicial:** La arquitectura *Domain-Driven Design* (DDD) con sus cinco *Bounded Contexts* (IAM, Fleet & Resource Management, Shipment Management, Monitoring & Telemetry y Alert & Reporting) se tradujo consistentemente en las pantallas, los flujos de usuario y el modelo de base de datos documentados en el Capítulo IV. Esa misma consistencia se refleja en la primera entrega funcional del Sprint 1: la Landing Page desplegada en producción con la propuesta de valor, los planes de suscripción y el formulario de contacto B2B, validando que el diseño conceptual es efectivamente implementable con el *stack* tecnológico elegido (Vue 3, ASP.NET Core y PostgreSQL).

---

## Recomendaciones

* **Priorizar la simplicidad de adopción para el segmento transportista:** Dado que las entrevistas evidenciaron una familiaridad limitada con plataformas telemáticas avanzadas entre los coordinadores de flota, se recomienda mantener el enfoque de incorporación sencilla —con soporte en español, tutoriales breves y compatibilidad con sensores IoT ya disponibles en el mercado para no generar una barrera de entrada adicional en un sector con baja penetración tecnológica previa.

* **Formalizar alianzas con gremios y cooperativas del sector agroexportador:** Para acelerar la adopción en los corredores logísticos priorizados, se sugiere establecer acuerdos con asociaciones de transportistas refrigerados y con agroexportadoras de La Libertad, Ica, Piura y Lambayeque, aprovechando que estos actores concentran gran parte del volumen de carga perecible identificado por el MTC (2023) y que una recomendación entre pares (*early adopters*) puede impulsar un crecimiento orgánico más rápido que la adquisición individual de clientes.

* **Consolidar el roadmap hacia los módulos de auditoría y reportería:** En las siguientes iteraciones, conviene priorizar el desarrollo completo de los *endpoints* de generación de reportes térmicos en PDF y de exportación de trazabilidad (US24, US27), ya que estas funcionalidades son las que sustentan el valor diferencial de FríoTrack frente a competidores genéricos como Óptima ERP o Sinapsys WMS: la capacidad de convertir la telemetría recolectada en evidencia auditable para certificaciones de calidad y resolución de reclamaciones comerciales.

# Bibliografía

* Agafonkin, V. (s. f.). *Leaflet: An open-source JavaScript library for interactive maps*. [https://leafletjs.com](https://leafletjs.com)
* Andersson, R. (s. f.). *Inter* [Tipografía]. [https://rsms.me/inter/](https://rsms.me/inter/)
* Banco Mundial. (2023). *Logistics Performance Index 2023: Mind the gap*. [https://lpi.worldbank.org](https://lpi.worldbank.org)
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
* Instituto Nacional de Estadística e Informática. (2023). *Perú: Informe económico trimestral* (diciembre 2023). [https://www.inei.gob.pe/media/MenuRecursivo/publicaciones_digitales/Est/Lib1933/libro.pdf](https://www.inei.gob.pe/media/MenuRecursivo/publicaciones_digitales/Est/Lib1933/libro.pdf)
* International Organization for Standardization. (2019). *Ergonomics of human-system interaction — Part 210: Human-centred design for interactive systems* (ISO 9241-210:2019). [https://www.iso.org/standard/77520.html](https://www.iso.org/standard/77520.html)
* Jones, M., Bradley, J., y Sakimura, N. (2015). *JSON Web Token (JWT)* (RFC 7519). Internet Engineering Task Force. [https://www.rfc-editor.org/info/rfc7519](https://www.rfc-editor.org/info/rfc7519)
* Krug, S. (2014). *Don't make me think, revisited: A common sense approach to web usability* (3.ª ed.). New Riders.
* Marcotte, E. (2010, 25 de mayo). Responsive web design. *A List Apart*. [https://alistapart.com/article/responsive-web-design/](https://alistapart.com/article/responsive-web-design/)
* Mercier, S., Villeneuve, S., Mondor, M., y Uysal, I. (2017). Time–temperature management along the food cold chain: A review of recent developments. *Comprehensive Reviews in Food Science and Food Safety, 16*(4), 647–667. [https://doi.org/10.1111/1541-4337.12269](https://doi.org/10.1111/1541-4337.12269)
* Ministerio de Transportes y Comunicaciones. (2023). *Plan Nacional de Servicios e Infraestructura Logística de Transporte al 2032* (Resolución Ministerial N.° 362-2023-MTC/01). [https://www.gob.pe/mtc](https://www.gob.pe/mtc)
* Nielsen, J. (1994). *10 usability heuristics for user interface design*. Nielsen Norman Group. [https://www.nngroup.com/articles/ten-usability-heuristics/](https://www.nngroup.com/articles/ten-usability-heuristics/)
* Norman, D. A. (2013). *The design of everyday things* (ed. rev. y ampliada). Basic Books.
* OpenStreetMap Foundation. (s. f.). *OpenStreetMap*. [https://www.openstreetmap.org](https://www.openstreetmap.org)
* Organización de las Naciones Unidas para la Alimentación y la Agricultura. (2022). *Más de 12 millones de toneladas de alimentos se pierden a lo largo de la cadena productiva en el Perú*. [https://www.fao.org/peru/noticias/detail-events/en/c/1712376/](https://www.fao.org/peru/noticias/detail-events/en/c/1712376/)
* The PostgreSQL Global Development Group. (s. f.). *PostgreSQL documentation*. [https://www.postgresql.org/docs/](https://www.postgresql.org/docs/)
* PrimeTek. (s. f.). *PrimeVue*. [https://primevue.org](https://primevue.org)
* Rosenfeld, L., Morville, P., y Arango, J. (2015). *Information architecture: For the web and beyond* (4.ª ed.). O'Reilly Media.
* Vernon, V. (2013). *Implementing domain-driven design*. Addison-Wesley.
* World Wide Web Consortium. (2023). *Accessible Rich Internet Applications (WAI-ARIA) 1.2*. [https://www.w3.org/TR/wai-aria-1.2/](https://www.w3.org/TR/wai-aria-1.2/)
* World Wide Web Consortium. (2024). *Web Content Accessibility Guidelines (WCAG) 2.2*. [https://www.w3.org/TR/WCAG22/](https://www.w3.org/TR/WCAG22/)
* Wroblewski, L. (2011). *Mobile first*. A Book Apart.

# Anexos
