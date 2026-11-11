
from fastapi import FastAPI

# Initialize CareerCompass application
app = FastAPI(
    title="CareerCompass AI",
    description="Multilingual AI Career Guidance Platform",
    version="1.0.0"
)


# Root endpoint
@app.get("/")
async def root():
    return {
        "message": "Welcome to CareerCompass AI",
        "status": "Running"
    }


# Health check endpoint
@app.get("/health")
async def health_check():
    return {
        "application": "CareerCompass AI",
        "status": "Healthy"
    }
