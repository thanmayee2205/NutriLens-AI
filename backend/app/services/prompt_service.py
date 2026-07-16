import json


def build_prompt(request):

    prompt = f"""
You are an expert nutritionist and food scientist.

A user scanned a packaged food label.

OCR TEXT:

{request.ocr_text}

USER PROFILE

Age: {request.age}

Gender: {request.gender}

Height: {request.height}

Weight: {request.weight}

Medical Conditions:
{request.medical_conditions}

Allergies:
{request.allergies}

Diet Preferences:
{request.diet_preferences}

TASK

1. Extract ONLY the ingredients.
2. Ignore addresses, company names, phone numbers, websites and nutrition facts.
3. Explain each ingredient.
4. Classify every ingredient as:
Safe
Moderate
Avoid

5. Calculate an overall health score from 0-100.

6. Give an overall verdict.

7. Give personalized recommendations.

Return ONLY valid JSON in exactly this format:

{{
  "health_score": 80,
  "overall_verdict": "...",
  "recommendation": "...",
  "ingredients":[
    {{
      "name":"...",
      "risk":"...",
      "purpose":"...",
      "health_effect":"..."
    }}
  ]
}}

Do not include markdown.
Do not include explanations outside JSON.
"""

    return prompt