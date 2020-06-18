StackOverflow: Import excel when column names are excel dates                                     
                                                                                                  
github                                                                                            
https://tinyurl.com/y99s3k7k                                                                      
https://github.com/rogerjdeangelis/utl-import-excel-when-column-names-are-excel-dates             
                                                                                                  
stackoverflow                                                                                     
https://tinyurl.com/y9wjpt3b                                                                      
https://stackoverflow.com/questions/62427085/reading-excel-file-in-sas-with-date-columns          
                                                                                                  
                                                                                                  
This shoud work with any problematic excel column names                                           
                                                                                                  
*_                   _                                                                            
(_)_ __  _ __  _   _| |_                                                                          
| | '_ \| '_ \| | | | __|                                                                         
| | | | | |_) | |_| | |_                                                                          
|_|_| |_| .__/ \__,_|\__|                                                                         
        |_|                                                                                       
;                                                                                                 
                                                                                                  
 d:/xls/dates.xlsx                                                                                
                                                                                                  
      ---------------------------------------------                                               
   1  |       id| 31-Jan-18| 28-Jun-18| 28-Feb-18 |  * are really numeric;                        
      |-------------------------------------------|                                               
   2  |        1|         4|         6|         8 |                                               
      |---------+----------+----------+-----------|                                               
   3  |        2|         9|         0|         9 |                                               
      |---------+----------+----------+-----------|                                               
   4  |        3|         3|         9|         5 |                                               
      ---------------------------------------------                                               
                                                                                                  
*            _               _                                                                    
  ___  _   _| |_ _ __  _   _| |_                                                                  
 / _ \| | | | __| '_ \| | | | __|                                                                 
| (_) | |_| | |_| |_) | |_| | |_                                                                  
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                 
                |_|                                                                               
;                                                                                                 
                                                                                                  
WORK.WANT total obs=3                                                                             
                                                                                                  
 ID    D31JAN18    D28JUN18    D28FEB18                                                           
                                                                                                  
  1        4           8           6                                                              
  2        9           9           0                                                              
  3        3           5           9                                                              
                                                                                                  
*          _       _   _                                                                          
 ___  ___ | |_   _| |_(_) ___  _ __                                                               
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                              
\__ \ (_) | | |_| | |_| | (_) | | | |                                                             
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                             
                                                                                                  
;                                                                                                 
                                                                                                  
proc sql dquote=ansi;                                                                             
  connect to excel                                                                                
     (Path="d:/xls/dates.xlsx");                                                                  
     create                                                                                       
         table want as                                                                            
     select                                                                                       
         *                                                                                        
         from connection to Excel                                                                 
         (                                                                                        
          Select                                                                                  
             id                                                                                   
            ,[31-Jan-18] as D31Jan18                                                              
            ,[28-Feb-18] as D28Jun18                                                              
            ,[28-Jun-18] as D28Feb18                                                              
          from                                                                                    
            dates                                                                                 
         );                                                                                       
  disconnect from Excel;                                                                          
Quit;                                                                                             
                                                                                                  
