@echo offcd /d %1svn cleanuprem Ignoresvn propset svn:ignore SCIfile.txt .rem Complete entire GMX project foldersrem Targets a current bug in GMS v.1.1.711 (see http://bugs.yoyogames.com/view.php?id=8074)for %%i in (background background\images Configs datafiles extensions fonts objects paths rooms scripts sound\audio sprites sprites\images timelines) do (	if not exist "%1\%%i" (		mkdir "%1\%%i"	))rem Clear and commitsvn resolved *svn add *svn delete SCIfile.txt --keep-localsvn commit . -m "Fixed botched initial commit by GMS"