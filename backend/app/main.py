from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.analyze import router as analyze_router
from app.api.chat import router as chat_router

app = FastAPI(
    title="NutriLens AI API",
    version="1.0.0",
    description="AI Powered Food Ingredient Analysis API",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register API routes
app.include_router(analyze_router)
app.include_router(chat_router)


@app.get("/")
def root():
    return {
        "message": "NutriLens AI Backend Running",
        "status": "success",
    }