import os
import traceback

prex = "1-"
num = 1
for x in os.listdir(os.getcwd()):
    try:
        x.encode("utf-8")
    except UnicodeEncodeError as ex:
        while os.path.exists(prex+str(num)):
            num +=1
        os.rename(x, prex+str(num))
        num +=1
