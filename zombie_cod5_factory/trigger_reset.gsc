#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
	thread thread_restarter();
}

thread_restarter() //In dedi servers, the trigger thread breaks in random reasons. This ensures every 3.5 seconds the thread restarts automatically
{
	wait 5;
	for(;;)
	{
		wait 0.05;
		level notify("notifier_1");
		wait 3.5;
		level notify("notifier_2");
	}
}
