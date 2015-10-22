//+------------------------------------------------------------------+
//|                                                        Tools.mqh |
//|                                                   Michal Brauner |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Michal Brauner"
#property link      "http://www.mql5.com"
#property strict

double max(double a, double b)
{
   return a>=b ? a : b;
}

double min(double a, double b)
{
   return a<=b ? a : b;
}

