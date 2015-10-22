//+------------------------------------------------------------------+
//|                                              OrderSendMarket.mqh |
//|                                                   Michal Brauner |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Michal Brauner"
#property link      "http://www.mql5.com"
#property strict

int OrderSendMarket(
   string   symbol,              // symbol
   int      cmd,                 // operation
   double   volume,              // volume
   double   price,               // price
   int      slippage,            // slippage
   double   stoploss,            // stop loss
   double   takeprofit,          // take profit
   string   comment=NULL,        // comment
   int      magic=0,             // magic number
   datetime expiration=0,        // pending order expiration
   color    arrow_color=clrNONE)
{
   int ticket = -1;
   
   ResetLastError();
   
   ticket = OrderSend(symbol,cmd, volume, price, slippage, 0, 0, comment, magic, expiration, arrow_color);
   
   if (ticket!=-1)
   {
      if (OrderModify(ticket, price, stoploss, takeprofit, expiration, arrow_color))
      {
         // tady udelat nejakou notifikaci
      }
   }
   
   return ticket;
}