import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// Use env var for key in production
final geminiTrainingCoachProvider = Provider((ref) => GeminiTrainingCoach('YOUR_GEMINI_API_KEY'));

class GeminiTrainingCoach {
  final String apiKey;
  late final GenerativeModel _model;

  GeminiTrainingCoach(this.apiKey) {
    _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  }

  /// 1. Feedback Post-Entreno
  Future<String> analyzeSession({
    required String routineName,
    required double totalVolume,
    required double avgRpe,
    required String userNotes,
    Map<String, dynamic>? previousSessionStats,
  }) async {
    final prompt = '''
    Actúa como un entrenador personal de alto rendimiento.
    El usuario completó la sesión '$routineName'.
    Datos actuales:
    - Volumen total: $totalVolume kg
    - RPE promedio: $avgRpe
    - Nota del usuario: '$userNotes'
    
    Datos de la sesión anterior: ${previousSessionStats != null ? jsonEncode(previousSessionStats) : 'No disponible'}
    
    Analiza brevemente el rendimiento comparado y da un consejo de recuperación específico.
    Máximo 50 palabras. Tono motivador pero técnico.
    ''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'Buen trabajo, sigue así.';
    } catch (e) {
      return 'Error analizando sesión: $e';
    }
  }

  /// 2. Análisis de Mesociclo (JSON Output)
  Future<Map<String, dynamic>> analyzeMesocycle({
    required List<Map<String, dynamic>> weeklyVolumes, // [{'muscle': 'chest', 'sets': 10, 'volume': 5000}...]
    required String userFeedback, // "Me duelen las rodillas"
  }) async {
    final prompt = '''
    Analiza el progreso de las últimas 4 semanas.
    Volúmenes semanales: ${jsonEncode(weeklyVolumes)}
    Feedback usuario: "$userFeedback"
    
    Reglas:
    1. Si hay sobrecarga progresiva (volumen sube), felicita.
    2. Si RPE baja y peso igual -> Sugerir subir carga.
    3. Si dolor articular + volumen alto -> Sugerir Deload.
    
    Devuelve SOLO un JSON con este formato (sin markdown):
    {
      "suggested_action": "increase_load" | "deload" | "maintain",
      "target_muscle": "muscle_name_or_all",
      "message": "Mensaje corto explicando la razón."
    }
    ''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      final text = response.text?.replaceAll('```json', '').replaceAll('```', '').trim();
      
      if (text != null) {
        return jsonDecode(text);
      }
      return {'error': 'No response text'};
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
