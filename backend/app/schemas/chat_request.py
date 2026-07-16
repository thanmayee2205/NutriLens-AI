from pydantic import BaseModel


class ChatRequest(BaseModel):
    question: str

    product_analysis: str

    age: int | None = None

    gender: str | None = None

    medical_conditions: list[str] = []

    allergies: list[str] = []

    diet_preferences: list[str] = []