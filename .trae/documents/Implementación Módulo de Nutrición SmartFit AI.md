# Plan de Implementación: SmartFit AI - Módulo de Nutrición

Dado que el directorio parece estar vacío, comenzaré inicializando el proyecto y luego implementaré la arquitectura solicitada paso a paso.

## 1. Configuración Inicial
1.  Inicializar proyecto Flutter (`flutter create .`).
2.  Agregar dependencias clave:
    *   `flutter_riverpod` (Gestión de estado)
    *   `supabase_flutter` (Backend)
    *   `google_generative_ai` (Gemini)
    *   `http` (API requests para OpenFoodFacts si no usamos package específico o para mayor control)
    *   `intl` (Manejo de fechas)

## 2. Base de Datos (Supabase)
1.  Crear archivo `supabase/schema.sql` con:
    *   Tablas: `profiles`, `daily_targets`, `food_products`, `meal_logs`, `daily_summaries`.
    *   Tipos de datos (`enums` para `meal_type`, etc.).
    *   Relaciones (Foreign Keys).

## 3. Lógica de Negocio (Core)
1.  Crear `lib/core/utils/nutrition_calculator.dart`:
    *   Implementar fórmulas Mifflin-St Jeor.
    *   Cálculo de TDEE y ajuste por objetivos.
    *   Reparto de macros.

## 4. Capa de Datos (Repositorios y Servicios)
1.  Crear `lib/features/nutrition/repositories/food_repository.dart`:
    *   Búsqueda en Supabase (cache).
    *   Fallback a OpenFoodFacts API.
    *   Guardado de logs de comida.
2.  Crear `lib/core/services/gemini_service.dart`:
    *   Implementación del prompt estructurado para feedback nutricional.

## 5. Interfaz de Usuario (UI/UX)
1.  Crear `lib/features/nutrition/presentation/dashboard_screen.dart`:
    *   Header con barras de macros.
    *   Timeline de comidas.
2.  Crear `lib/features/nutrition/presentation/food_logger_screen.dart`:
    *   Buscador y Scanner (simulado o UI placeholder).
    *   Bottom Sheet para detalle de alimentos.

## 6. Integración
1.  Configurar `main.dart` con `ProviderScope` y `Supabase.initialize`.

¿Deseas que proceda con este plan de implementación?