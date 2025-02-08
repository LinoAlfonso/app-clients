# Ceiba Users App

Una aplicación Flutter que muestra un listado de usuarios y sus publicaciones, 
implementando una arquitectura limpia y permitiendo el uso offline de la aplicación.

## 🏗 Arquitectura

El proyecto sigue los principios de Clean Architecture con la siguiente estructura:

lib/src/
├── config/ # Configuraciones globales
├── core/ # Funcionalidades core de la aplicación
│ ├── database/ # Gestión de base de datos local
│ └── env/ # Configuración de variables de entorno
├── features/ # Módulos de la aplicación
│ └── feature_users/ # Módulo de usuarios
│ ├── domain/ # Reglas de negocio y contratos
│ └── infrastructure/ # Implementaciones concretas


### Capas de la Arquitectura:
- **Domain**: Contiene las entidades, casos de uso y contratos de repositorios
- **Infrastructure**: Implementa los repositorios y fuentes de datos
- **Presentation**: Maneja la UI y la gestión de estado

## 📚 Librerías Principales

- **provider**: ^6.0.0
    - Gestión de estado de la aplicación
    - Implementación del patrón Provider para inyección de dependencias

- **go_router**: ^13.0.0
    - Navegación declarativa
    - Manejo de rutas nombradas
    - Soporte para deep linking

- **sqflite**: ^2.3.0
    - Base de datos local SQLite
    - Almacenamiento offline de usuarios
    - Caché para reducir llamadas al API

- **http**: ^1.1.0
    - Cliente HTTP para consumo de APIs
    - Manejo de peticiones REST

- **flutter_dotenv**: ^5.1.0
    - Gestión de variables de entorno
    - Configuración segura de URLs y tokens

## 🔄 Flujo de Datos

1. **Primera carga**:
    - La app verifica si existen usuarios en la base de datos local
    - Si no hay datos locales, realiza la petición al API
    - Los usuarios obtenidos se almacenan en SQLite

2. **Cargas posteriores**:
    - Los datos se recuperan directamente de la base de datos local
    - Se evitan llamadas innecesarias al API
    - Garantiza funcionamiento offline

3. **Publicaciones**:
    - Al seleccionar un usuario se muestran sus publicaciones
    - Las publicaciones se obtienen del API
    - Se implementa caché local para las publicaciones

## 🚀 Características

- ✅ Listado de usuarios con búsqueda
- ✅ Detalle de publicaciones por usuario
- ✅ Modo offline
- ✅ Caché local
- ✅ Clean Architecture
- ✅ Inyección de dependencias
- ✅ Manejo de errores
- ✅ Variables de entorno
