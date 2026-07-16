import json

from fastapi import APIRouter, HTTPException

from app.schemas.analyze_request import AnalyzeRequest
from app.schemas.analyze_response import AnalyzeResponse

from app.services.prompt_service import build_prompt
from app.services.gemini_service import ask_gemini

router = APIRouter(
    prefix="/analyze",
    tags=["AI Analysis"],
)


@router.post(
    "",
    response_model=AnalyzeResponse,
)
async def analyze_food(request: AnalyzeRequest):

    prompt = build_prompt(request)

    try:

        result = await ask_gemini(prompt)

        data = json.loads(result)

        return AnalyzeResponse(**data)

    except Exception as e:

        raise HTTPException(
            status_code=500,
            detail=str(e),
        )