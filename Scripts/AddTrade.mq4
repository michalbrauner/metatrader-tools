//+------------------------------------------------------------------+
//|                                                     AddTrade.mq4 |
//|                                                   Michal Brauner |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Michal Brauner"
#property link      "http://www.mql5.com"
#property version   "1.00"
#property strict
#property show_inputs

#include <MickyTools/OrderSendMarket.mqh>

extern string StrategyCode = "10";
extern string Note1 = "TradeType = ";
extern string Note2 = " --> 0 = BUY_LIMIT";
extern string Note3 = " --> 1 = SELL_LIMIT";
extern string Note4 = " --> 2 = BUY_STOP";
extern string Note5 = " --> 3 = SELL_STOP";
extern string Note6 = " --> 4 = BUY";
extern string Note7 = " --> 5 = SELL";
extern int TradeType;
extern double StopLoss = 0.0;
extern double InputPrice = 0.0;
extern double TakeProfit = 0.0;
extern double FixedLotSize = 0.01;


string pairCode = "";

int OnInit()
{
   pairCode = getPairCode();
   
   if (pairCode=="")
   {
      return INIT_FAILED;
   }
   
   if (StrategyCode=="")
   {
      return INIT_FAILED;
   }
   
   if (InputPrice==0.0)
   {
      return INIT_FAILED;
   }
   
   if (FixedLotSize<0.01)
   {
      return INIT_FAILED;
   }
   
   return INIT_SUCCEEDED;
}


void OnStart()
{
   int orderTicket = 0;
   
   string magicNumber = getMagicNumber(StrategyCode);
   
   // BUY limit
   if (TradeType==0)
   {
      RefreshRates();
      orderTicket  = OrderSendMarket(Symbol(), OP_BUYLIMIT, FixedLotSize, InputPrice, 30, StopLoss, TakeProfit, NULL, magicNumber, 0, clrNONE);  
   }
   
   // SELL limit
   if (TradeType==1)
   {
      RefreshRates();
      orderTicket  = OrderSendMarket(Symbol(), OP_SELLLIMIT, FixedLotSize, InputPrice, 30, StopLoss, TakeProfit, NULL, magicNumber, 0, clrNONE);  
   }
   
   // BUY limit
   if (TradeType==2)
   {
      RefreshRates();
      orderTicket  = OrderSendMarket(Symbol(), OP_BUYSTOP, FixedLotSize, InputPrice, 30, StopLoss, TakeProfit, NULL, magicNumber, 0, clrNONE);  
   }
   
   // SELL limit
   if (TradeType==3)
   {
      RefreshRates();
      orderTicket  = OrderSendMarket(Symbol(), OP_SELLSTOP, FixedLotSize, InputPrice, 30, StopLoss, TakeProfit, NULL, magicNumber, 0, clrNONE);  
   }
   
   // BUY 
   if (TradeType==4)
   {
      RefreshRates();
      orderTicket  = OrderSendMarket(Symbol(), OP_BUY, FixedLotSize, Ask, 30, StopLoss, TakeProfit, NULL, magicNumber, 0, clrNONE);  
   }
   
   // SELL 
   if (TradeType==5)
   {
      RefreshRates();
      orderTicket  = OrderSendMarket(Symbol(), OP_SELL, FixedLotSize, Bid, 30, StopLoss, TakeProfit, NULL, magicNumber, 0, clrNONE);  
   }
   
   
   if (orderTicket>0)
   {
      Print("Trade has been successfully added (orderTicket="+orderTicket+", magicNumber="+magicNumber+")");
   }
   else
   {
      Print("Trade hasn't been added");
      Print("ERROR = "+GetLastError());
   }
      
}

string getMagicNumber(string strategyCode)
{
   string magicNumber = "";
   
   if (IsDemo())
   {
      magicNumber = "1";
   }
   else
   {
      magicNumber = "2";
   }
   
   magicNumber = magicNumber + "00";
   magicNumber = magicNumber + "2";
   magicNumber = magicNumber + strategyCode;
   magicNumber = magicNumber + pairCode;
   
   return magicNumber;
}

string getPairCode()
{
   if (Symbol()=="EURUSD")
   {
      return "41";
   }
   else
   if (Symbol()=="GBPUSD")
   {
      return "42";
   }
   else
   if (Symbol()=="EURJPY")
   {
      return "43";
   }
   else
   if (Symbol()=="USDJPY")
   {
      return "44";
   }
   else
   if (Symbol()=="AUDUSD")
   {
      return "45";
   }
   else
   if (Symbol()=="NZDUSD")
   {
      return "46";
   }
   else
   if (Symbol()=="EURGBP")
   {
      return "47";
   }
   else
   if (Symbol()=="USDCHF")
   {
      return "48";
   }
   else
   if (Symbol()=="USDCAD")
   {
      return "49";
   }
   else
   if (Symbol()=="EURCHF")
   {
      return "50";
   }
   else
   if (Symbol()=="EURAUD")
   {
      return "51";
   }
   else
   if (Symbol()=="NZDJPY")
   {
      return "52";
   }
   else
   if (Symbol()=="EURCAD")
   {
      return "53";
   }
   
   return "";
}

