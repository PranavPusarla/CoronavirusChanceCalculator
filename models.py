from django.db import models

# Create your models here.
class Calculator(models.Model):
    age = models.IntegerField()
    high_risk_exposure = models.BooleanField()
    high_risk_interactions = models.BooleanField()
    diabetes = models.BooleanField()
    chd = models.BooleanField()
    htn = models.BooleanField()
    cancer = models.BooleanField()
    asthma = models.BooleanField()
    copd = models.BooleanField()
    autoimmune_disease = models.BooleanField()
    temperature = models.FloatField()
    rhonchi = models.BooleanField()
    wheezes = models.BooleanField()
    cough = models.BooleanField()
    fever = models.BooleanField()
    fatigue = models.BooleanField()
    headache = models.BooleanField()
    runny_nose = models.BooleanField()
    muscle_sore = models.BooleanField()
    sore_throat = models.BooleanField()

class Chance(models.Model):
    probability_of_covid = models.FloatField()