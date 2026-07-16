from pydantic import BaseModel


class Ingredient(BaseModel):
    name: str
    risk: str
    purpose: str
    health_effect: str


class AnalyzeResponse(BaseModel):
    health_score: int
    overall_verdict: str
    recommendation: str
    ingredients: list[Ingredient]