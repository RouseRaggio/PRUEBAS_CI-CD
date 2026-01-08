from django.urls import path, include
from rest_framework.routers import DefaultRouter
from products.views import ProductViewSet
from django.contrib import admin
from django.http import HttpResponse

router = DefaultRouter()
router.register(r"products", ProductViewSet)


def home(request):
    return HttpResponse("🚀 API funcionando correctamente")


urlpatterns = [
    path("", home),
    path("api/", include(router.urls)),
]
