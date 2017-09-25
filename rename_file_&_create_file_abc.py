import os 
import syspath = ‘path’
ListFiles = os.listdir(path) 
print(ListFiles) 
LenList = len(ListFiles) 
for i in range(0, LenList):    
  NewName = ListFiles[i]    
  print(ListFiles[i])   
  #NewName = NewName[12:]    
  #os.rename(path+ListFiles[i], path+NewName)    
  #print(NewName)    
  absname = NewName[0:-4]    
  absna = str(absname)+u’.abc’   
  file = open(str(absna), ‘tw’, encoding=’utf-8’)    
  file.close()    
  print(absna)
