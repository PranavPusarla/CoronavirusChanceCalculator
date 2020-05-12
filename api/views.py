from django.http import JsonResponse, HttpResponse
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
import json
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.generics import ListAPIView
from .models import Calculator, Chance
from .serializer import CalculatorSerializer, ChanceSerializer
import pandas as pd
from .ensemble import predict_covid
import numpy as np


# # Create your views here.
# class AllObjects(ListAPIView):
#     queryset = Calculator.objects.all()
#     serializer_class = CalculatorSerializer
#
#     def post(self, request):
#         serializer = CalculatorSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#
# class View(APIView):
#
#     def get(self, request, pk):
#         try:
#             calculator = Calculator.objects.get(pk=pk)
#             serializer = CalculatorSerializer(calculator)
#             return Response(serializer.data)
#         except:
#             return Response(status=status.HTTP_404_NOT_FOUND)
#
#     def delete(self, request, pk):
#         calculator = Calculator.objects.get(pk=pk)
#         calculator.delete()
#         return Response(status=status.HTTP_200_OK)

@csrf_exempt
def createPost(request):
    if (request.method == "POST"):
        byte_string = request.body
        body = json.loads(byte_string)
        for i in range(len(body)):
            if (body[i] == "Yes"):
                body[i] = 1
            elif (body[i] == "No"):
                body[i] = 0
        body[0] = int(body[0])
        body[10] = float(body[10])
        arr = np.asarray(body)
        arr = np.expand_dims(arr, axis=0)
        chance_of_covid = predict_covid(arr)
        chance = Chance()
        chance.probability_of_covid = float(chance_of_covid)
        chance.save()
        return HttpResponse(status=201)
    else:
        return HttpResponse('Wrong http request')

@csrf_exempt
def getChanceOfCovid(request):
    if (request.method == "GET"):
        chance_of_covid = Chance.objects.first()
        if (chance_of_covid == None):
            return HttpResponse("Please enter values first!")
        else:
            serializer = ChanceSerializer(chance_of_covid)
            data = serializer.data.get('probability_of_covid')
            data = float(str(round(data, 2)))
            chance_of_covid.delete()
            return JsonResponse({"data": data}, safe=False)
    else:
        return HttpResponse('Wrong http request')

@csrf_exempt
def getData(request):
    if (request.method == "POST"):
        byte_string = request.body
        print(byte_string)
        body = json.loads(byte_string)
        print(body)
        for i in range(len(body)):
            if (body[i] == "Yes"):
                body[i] = 1
            elif (body[i] == "No"):
                body[i] = 0
        body[0] = int(body[0])
        body[10] = float(body[10])

        return HttpResponse(status=201)
    else:
        return HttpResponse('Wrong http request')
