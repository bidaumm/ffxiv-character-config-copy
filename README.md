# ffxiv-character-config-copy
ffxiv-character-config-copy

Script that allows you to synchronize character data via dropbox

It will sync 

For everything:

character appearance data and shared macros

For all characters:

character configuration / keybinds / log filter / macros

per character basis:

Gearsets/Item Order/Item Search info

per computer basis:

ui position 



dropbox directory structure to follow for script to work.

    Dropbox>

    Backup Folder>
  
      FFXIV>
      
        COMMON>
        
         CHAR>

            COMMON.DAT
            
            CONTROL0.DAT
            
            CONTROL1.DAT
            
            HOTBAR.DAT
            
            KEYBIND.DAT
            
            LOGFLTR.DAT
            
            MACRO.DAT
            
            ...
        
          FFXIV_CHARA_01.DAT
        
          MACROSYS.DAT
        
          ... 
 
        CHAR1FOLDER>
      
          GEARSET.DAT
        
          ITEMFDR.DAT
        
          ITEMODR.DAT
          
          ...
        
        CHAR2FOLDER>
      
          GEARSET.DAT
        
          ITEMFDR.DAT
        
          ITEMODR.DAT
          
          ...
        
        CHARETC....>
      
          GEARSET.DAT
        
          ITEMFDR.DAT
        
          ITEMODR.DAT
          
          ...
        
      COMPUTER1NAME>
      
          ADDON.DAT
          
          ...
        
      COMPUTER2NAME>
      
          ADDON.DAT
          
          ...
        
      COMPUTERETC....>
      
          ADDON.DAT
          
          ...
