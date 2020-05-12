from rest_framework import serializers
from .models import Calculator, Chance

class CalculatorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Calculator
        fields = '__all__'

class ChanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Chance
        fields = '__all__'
