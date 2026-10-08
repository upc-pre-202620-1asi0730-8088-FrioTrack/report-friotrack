workspace "FrioTrack TB1" "Local client and planned API" {
 model {
  coordinator = person "Logistics Coordinator" "Schedules shipments and handles alerts"
  client = person "Cargo Client" "Reads assigned shipments"
  maps = softwareSystem "OpenStreetMap" "External map tiles"
  mail = softwareSystem "Mail Provider" "Planned transactional mail"
  sensors = softwareSystem "Sensors" "Planned readings"
  system = softwareSystem "FrioTrack" "Cold chain transport" {
   landing = container "Landing Page" "Public proposal and entry points" "HTML CSS JavaScript"
   spa = container "Web Application SPA" "Local TB1 demo" "Vue JavaScript PrimeVue" {
    iam = component "IAM views" "Access and profile demo" "Vue"
    fleet = component "Fleet views" "Resources" "Vue"
    shipment = component "Shipment views" "Four-step scheduling and lifecycle" "Vue"
    monitoring = component "Monitoring views" "Sample readings and location" "Vue Leaflet"
    alerts = component "Alert and Reporting views" "Actions and sample history" "Vue"
    store = component "AppStore" "State and domain validation" "JavaScript"
    local = component "LocalDemoRepository" "Browser persistence of sample data" "localStorage"
   }
   api = container "REST API" "Planned business use cases" "ASP.NET Core C#" {
    interfaces = component "REST interfaces" "Controllers DTOs for each BC" "ASP.NET Core"
    application = component "Application handlers" "Commands queries transactions for each BC" "C#"
    domain = component "Domain modules" "IAM Fleet Shipment Monitoring Alerts aggregates and ports" "C#"
    infrastructure = component "Infrastructure adapters" "Repositories sensor mail PDF" "EF Core C#"
    events = component "Event dispatcher" "In-process application reactions - planned" "C#"
   }
   database = container "Database" "Planned relational persistence" "PostgreSQL"
  }
  coordinator -> spa "Uses"
  client -> spa "Reads assigned shipments"
  landing -> spa "Role-aware entry links"
  iam -> store "Uses"
  fleet -> store "Uses"
  shipment -> store "Uses"
  monitoring -> store "Uses"
  alerts -> store "Uses"
  store -> local "Persists sample data"
  monitoring -> maps "Gets tiles" "HTTPS"
  spa -> api "Planned REST integration" "HTTPS JSON"
  sensors -> api "Planned readings" "HTTPS JSON"
  interfaces -> application "Invokes"
  application -> domain "Uses"
  infrastructure -> domain "Implements ports"
  application -> events "Dispatches domain events"
  events -> application "Routes reactions to context handlers"
  infrastructure -> database "Persists" "SQL"
  infrastructure -> mail "Planned mail" "HTTPS"
 }
 views {
  systemContext system "Context" { include * autoLayout lr }
  container system "Containers" { include * autoLayout tb }
  component spa "Frontend" { include * autoLayout tb }
  component api "Backend" { include * autoLayout tb }
 }
}
