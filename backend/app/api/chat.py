from fastapi import APIRouter, HTTPException

from app.schemas.chat_request import ChatRequest
from app.schemas.chat_response import ChatResponse

from app.services.chat_prompt_service import build_chat_prompt
from app.services.gemini_service import ask_gemini

router = APIRouter(
    prefix="/chat",
    tags=["AI Chat"],
)


@router.post(
    "",
    response_model=ChatResponse,
)
async def chat(request: ChatRequest):

    try:

        prompt = build_chat_prompt(request)

        answer = await ask_gemini(prompt)

        return ChatResponse(
            answer=answer.strip()
        )

    except Exception as e:

        raise HTTPException(
            status_code=500,
            detail=str(e),
        )