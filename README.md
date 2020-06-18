# utl-import-excel-when-column-names-are-excel-dates
Import excel when column names are excel dates  
    Import excel when column names are excel dates                                              
                                                                                                
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
                                                                                                
                      
                      
     You can download my workbook at                                                                                                                                            
                                                                                                                                                                               
    https://tinyurl.com/yd9hoag7                                                                                                                                               
    https://github.com/rogerjdeangelis/utl-import-excel-when-column-names-are-excel-dates/blob/master/months.xlsx                                                              
                                                                                                                                                                               
    or create your own                                                                                                                                                         
                                                                                                                                                                               
     |-----------------------------------------------------------------------------------------------------------------------------------------------------------              
     |01-JAN-2019| 01-FEB-2019| 01-MAR-2019| 01-APR-2019| 01-MAY-2019| 01-JUN-2019| 01-JUL-2019| 01-AUG-2019| 01-SEP-2019| 01-OCT-2019| 01-NOV-2019| 01-DEC-2019|              
     |-----------+------------+------------+------------+------------+------------+------------+------------+------------+------------+------------+------------+              
     |4          | 0          | 7          | 3          | 1          | 0          | 5          | 6          | 4          | 2          | 8          | 9          |              
     |-----------+------------+------------+------------+------------+------------+------------+------------+------------+------------+------------+------------+              
     |9          | 9          | 9          | 0          | 6          | 0          | 3          | 7          | 9          | 7          | 8          | 7          |              
     |-----------+------------+------------+------------+------------+------------+------------+------------+------------+------------+------------+------------+              
     |5          | 5          | 6          | 1          | 4          | 6          | 5          | 6          | 0          | 4          | 2          | 0          |              
     ------------------------------------------------------------------------------------------------------------------------------------------------------------              
                                                                                                                                                                               
                                                                                                                                                                               
                                                                                                                                                                               
    %utlfkil("d:/xls/months.xlsx");                                                                                                                                            
                                                                                                                                                                               
    libname xll "d:/xls/months.xlsx" scan_text=no header=no;                                                                                                                   
    data names;                                                                                                                                                                
      array fro[12] $13 f1-f12;                                                                                                                                                
      array too[12] $12 t1-t12;                                                                                                                                                
      set xll.months(obs=1);                                                                                                                                                   
      do i=1 to 12;                                                                                                                                                            
         trg=cats('D',compress(fro[i],'-'));                                                                                                                                   
         src=cats('[',fro[i],']');                                                                                                                                             
         sel=catx(" ",src,"as",trg);                                                                                                                                           
         putlog ',' sel;                                                                                                                                                       
         keep src trg;                                                                                                                                                         
         output;                                                                                                                                                               
      end;                                                                                                                                                                     
    run;quit;                                                                                                                                                                  
    libname xll clear;                                                                                                                                                         
                                                                                                                                                                               
    * you should see this in the log;                                                                                                                                          
                                                                                                                                                                               
    ,[01-JAN-2019] as D01JAN2019                                                                                                                                               
    ,[01-FEB-2019] as D01FEB2019                                                                                                                                               
    ,[01-MAR-2019] as D01MAR2019                                                                                                                                               
    ,[01-APR-2019] as D01APR2019                                                                                                                                               
    ,[01-MAY-2019] as D01MAY2019                                                                                                                                               
    ,[01-JUN-2019] as D01JUN2019                                                                                                                                               
    ,[01-JUL-2019] as D01JUL2019                                                                                                                                               
    ,[01-AUG-2019] as D01AUG2019                                                                                                                                               
    ,[01-SEP-2019] as D01SEP2019                                                                                                                                               
    ,[01-OCT-2019] as D01OCT2019                                                                                                                                               
    ,[01-NOV-2019] as D01NOV2019                                                                                                                                               
    ,[01-DEC-2019] as D01DEC2019                                                                                                                                               
                                                                                                                                                                               
                                                                                                                                                                               
    * cut and paste in into the sql code below.                                                                                                                                
    * I am too lazy to automate this                                                                                                                                           
    * note this method is restricted to 255 columns;                                                                                                                           
    * macro do_over can automate this so you don't need to cut and paste.                                                                                                      
    * I also think it is possible to get the text date in the label using the libname engine                                                                                   
    * you can then parse the label and rename                                                                                                                                  
    ;                                                                                                                                                                          
                                                                                                                                                                               
                                                                                                                                                                               
    proc sql dquote=ansi;                                                                                                                                                      
      connect to excel                                                                                                                                                         
         (Path="d:/xls/months.xlsx");                                                                                                                                          
         create                                                                                                                                                                
             table want as                                                                                                                                                     
         select                                                                                                                                                                
             *                                                                                                                                                                 
             from connection to Excel                                                                                                                                          
             (                                                                                                                                                                 
              Select                                                                                                                                                           
                  [01-JAN-2019] as D01JAN2019                                                                                                                                  
                 ,[01-FEB-2019] as D01FEB2019                                                                                                                                  
                 ,[01-MAR-2019] as D01MAR2019                                                                                                                                  
                 ,[01-APR-2019] as D01APR2019                                                                                                                                  
                 ,[01-MAY-2019] as D01MAY2019                                                                                                                                  
                 ,[01-JUN-2019] as D01JUN2019                                                                                                                                  
                 ,[01-JUL-2019] as D01JUL2019                                                                                                                                  
                 ,[01-AUG-2019] as D01AUG2019                                                                                                                                  
                 ,[01-SEP-2019] as D01SEP2019                                                                                                                                  
                 ,[01-OCT-2019] as D01OCT2019                                                                                                                                  
                 ,[01-NOV-2019] as D01NOV2019                                                                                                                                  
                 ,[01-DEC-2019] as D01DEC2019                                                                                                                                  
              from                                                                                                                                                             
                months                                                                                                                                                         
             );                                                                                                                                                                
      disconnect from Excel;                                                                                                                                                   
    Quit;                                                                                                                                                                      
                                                                                                                                                                               
                                                                                                                                                                               
    NOTE: Table WORK."WANT" created, with 3 rows and 12 columns.                                                                                                               
                                                                                                                                                                               
    3691    disconnect from Excel;                                                                                                                                             
    3692  Quit;                                                                                                                                                                
    NOTE: PROCEDURE SQL used (Total process time):                                                                                                                             
          real time           0.09 seconds                                                                                                                                     
          user cpu time       0.00 seconds                                                                                                                                     
          system cpu time     0.04 seconds                                                                                                                                     
          memory              5328.78k                                                                                                                                         
          OS Memory           37644.00k                                                                                                                                        
          Timestamp           06/18/2020 06:55:08 PM                                                                                                                           
          Step Count                        816  Switch Count  0                                                                                                               
                                                                                                                                                                               
                                                                                                                                                                               
                                                                                                                                                                               
    WORK.WANT total obs=3                                                                                                                                                      
                                                                                                                                                                               
    Obs    D01JAN2019    D01FEB2019    D01MAR2019    D01APR2019  ...     D01DEC2019                                                                                            
                                                                                                                                                                               
     1         4             0             7             3       ...         9                                                                                                 
     2         9             9             9             0       ...         7                                                                                                 
     3         5             5             6             1       ...         0                                                                                                 
                                                                                                                                                                               
                                                                                                                                                                               
                                                                                                                                                                               

                                                                                                
