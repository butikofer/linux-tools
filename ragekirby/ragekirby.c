#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <signal.h>

int someval = 1;

void timer_callback(int sig) {
        if (someval) {
                printf("(╮°_°)╮ ┳━┳    ...     \n");
        } else {
                printf("(╯°□°)╯ ┻━┻ !!!!!!!!!!!!\n");
        }

        fflush(stdout);

        someval = !someval;
}

void stop_timer(timer_t tid) {
        struct itimerspec stopv;

        stopv.it_value.tv_sec = 0;
        stopv.it_value.tv_nsec = 0;

        stopv.it_interval.tv_sec = 0;
        stopv.it_interval.tv_nsec = 0;

        timer_settime(tid, 0, &stopv, NULL);
}

int main(int argc, char** argv) {
        int interval = 1;

        if (argc == 2) {
                interval = atoi(argv[1]);
        }

        (void) signal(SIGALRM, timer_callback);

        // start the timer

        timer_t tid = 0;

        struct itimerspec v;

        v.it_value.tv_sec = 0;
        v.it_value.tv_nsec = 1;

        v.it_interval.tv_sec = interval;
        v.it_interval.tv_nsec = 0;

        timer_create(CLOCK_REALTIME, NULL, &tid);

        timer_settime(tid, 0, &v, NULL);

        while (1) {
                sleep(99999);
        }
}
