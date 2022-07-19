@echo off

xcopy /i /s "%CD%" "%localappdata%\Plutonium\storage\t5\scripts\sp" /y

xcopy /i /s "%CD%" "%localappdata%\Plutonium-staging\storage\t5\scripts\sp" /y

del %localappdata%\Plutonium\storage\t5\scripts\sp\Install_Scripts_To_T5.bat

del %localappdata%\Plutonium-staging\storage\t5\scripts\sp\Install_Scripts_To_T5.bat


end
