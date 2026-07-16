from pydantic import BaseModel


class AnalyzeRequest(BaseModel):
    ocr_text: str

    age: int | None = None

    gender: str | None = None

    height: float | None = None

    weight: float | None = None

    medical_conditions: list[str] = []

    allergies: list[str] = []

    diet_preferences: list[str] = []